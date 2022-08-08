class Api::V1::SessionsController < ApplicationController

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: UserSerializer.create_user(user), status: 200
    else
      render json: { data: { errors: "Invalid Credentials"} }, status: 401
    end
  end


end
