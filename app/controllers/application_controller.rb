class ApplicationController < ActionController::Base

  def verify_authenticity_token
    request.headers['X-CSRF-Token'] ||= request.headers['X-XSRF-TOKEN']
  end

end
