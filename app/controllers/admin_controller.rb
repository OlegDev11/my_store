class AdminController < ApplicationController
  layout "admin"
  before_action  :check_if_admin

  def users_count
    @users_count = User.count
  end
end
