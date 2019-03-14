class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_current_user_enrolled, only: [:show]

  def show
  end

  private

  def require_current_user_enrolled
    if current_user.enrolled_in?(current_lesson.section.course)
      
    else
      redirect_to root_url, alert: 'You Are Not Enrolled'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
