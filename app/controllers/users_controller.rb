class UsersController < ApplicationController
  def index
    @users = User.limit(10).order(id: :desc)
  end
end
