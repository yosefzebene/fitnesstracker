class UserController < ApplicationController
  def show
    if current_user.has_plan?
      today = Date.today
      @day_of_week = today.strftime('%A').downcase

      @workouts = Userworkout.where({ :user_id => current_user.id, "#{@day_of_week}" => true  })
    end
  end
end
