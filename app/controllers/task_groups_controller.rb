class TaskGroupsController < ApplicationController
  def index
    @messages = TaskGroup.return_group_information(100)
    @users_array = TaskGroup.return_group_users(100)
  end
end
