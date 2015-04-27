class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def index
    if current_user
      gon.push({
        env: Rails.env,
        current_user: {id: current_user.id, email: current_user.email}
      })
    end
  end


  protected

  def layout_by_resource
    if devise_controller?
      "session"
    else
      "application"
    end
  end

end
