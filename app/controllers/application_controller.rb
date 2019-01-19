class ApplicationController < ActionController::Base
  def json_response(body, status: 200)
    render json: body, status: 200
  end
end
