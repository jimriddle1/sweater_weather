class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation],
                  api_key: SecureRandom.uuid)
    render json: UserSerializer.create_user(user)
  end


end
