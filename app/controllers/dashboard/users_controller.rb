class Dashboard::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout "dashboard/dashboard"
  
  def index
    if params[:keyword].present?
      @keyword = params[:keyword].strip
      @users = User.search_information(@keyword).display_list(params[:pages])
    else
      @keyword = ""
      @users = User.display_list(params[:pages])
    end
  end
  
  def destroy
  end
end
