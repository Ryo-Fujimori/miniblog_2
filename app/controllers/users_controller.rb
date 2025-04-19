class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :index  ]

  def index
    @users = User.limit(10).order(id: :desc)
  end
end
