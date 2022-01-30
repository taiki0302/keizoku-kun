class AchievementsController < ApplicationController
 def index
  @achievements = current_user.achievements

  if @achievement.nil?
        @nil_result = "nil"
  else
        @nil_result = "nil"
  end

 end

end
