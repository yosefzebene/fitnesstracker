class UserworkoutController < ApplicationController
    before_action :initialize_session

    def new
        redirect_to root_path if current_user.has_plan?

        @plan = {}

        session[:plan].each do |key, value|
            value.each do |i|
                workout = Workout.find(i)
                (@plan[key] ||= []) << workout
            end
        end
    end

    def add_workout
        workouts = session[:plan][params[:day]] ||= []

        if !workouts.include? params[:id].to_i
            workouts << params[:id].to_i
        end

        redirect_back(fallback_location: root_path)
    end

    def remove_workout
        array = session[:plan][params[:day]]
        array.delete(params[:id].to_i)
        redirect_back(fallback_location: root_path)
    end

    def create
        @plan = {}

        session[:plan].each do |key, value|
            value.each do |i|
                current_user.userworkouts.create({ :workout_id => i, "#{Date::DAYNAMES[key.to_i].downcase}" => true })
            end
        end

        redirect_to(root_path)
    end

    def delete
        Userworkout.where(user_id: current_user.id).delete_all

        redirect_to(root_path)
    end

    private

    def initialize_session
        session[:plan] ||= {}
    end
end
