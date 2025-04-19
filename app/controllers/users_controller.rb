class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :index  ]

  def index
    @pagy, @users = pagy(User.all)
  end
end
