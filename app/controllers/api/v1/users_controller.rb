class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation],
                  api_key: SecureRandom.uuid)
    if user.save
      render json: UserSerializer.create_user(user), status: 201
    else
      render json: { data: { errors: user.errors.messages.values.join} }, status: 404
      # binding.pry
    end
  end


end
