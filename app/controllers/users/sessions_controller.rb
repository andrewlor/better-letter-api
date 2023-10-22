# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionFixController

  respond_to :json

  private

  def respond_with(resource, _opts={})
    render json: current_user, status: :ok
  end

  def respond_to_on_destroy
    successful_logout && return if current_user
    failed_logout
  end

  def successful_logout
    render status: :ok
  end

  def failed_logout
    render json: "Something went wrong.", status: :unauthorized
  end
end
