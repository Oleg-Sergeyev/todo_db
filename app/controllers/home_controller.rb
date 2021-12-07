class HomeController < ApplicationController
  http_basic_authenticate_with name: 'TesT', password: 'WelcomeBack'
  def index
    Rails.logger.info '******************************'
    Rails.logger.info "Get params = #{request.query_parameters.values}"
    Rails.logger.info '******************************'
  end
end
