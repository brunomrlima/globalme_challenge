class TaskGroupsController < ApplicationController
  skip_forgery_protection
  def index
    @messages = TaskGroup.return_group_information(100)
    @users_array = TaskGroup.return_group_users(100)
  end

  def update_variables
    @messages = TaskGroup.return_group_information(params[:variables][:n_user].to_i)
    @users_array = TaskGroup.return_group_users(params[:variables][:n_user].to_i)
    respond_to do |format|
      format.js
    end
  end
end
