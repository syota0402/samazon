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
    user = User.find(params[:id])
    delete_flg = User.switch_flg(user.delete_flg)
    user.update(delete_flg: delete_flg)
    redirect_to dashboard_users_path
  end
end
