# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts={})
    successful_registration && return if resource.persisted?
    failed_registration
  end

  def successful_registration
    render json: { message: "You've registered successfully", user: current_user }, status: :ok
  end

  def failed_registration
    render json: { message: "Something went wrong. Please try again" }, status: :unprocessable_entity
  end
end
