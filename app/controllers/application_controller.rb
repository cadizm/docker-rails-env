class ApplicationController < ActionController::API
  before_action -> { request.format = :json }
end
