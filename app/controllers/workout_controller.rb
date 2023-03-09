class WorkoutController < ApplicationController
    def show
        @workouts = Workout.all()
    end
end
