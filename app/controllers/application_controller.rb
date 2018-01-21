# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  before_action :authenticate_user!,
    unless: -> { request.controller_class == HomeController }

  private

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end
end
