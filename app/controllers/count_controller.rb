class CountController < ApplicationController
          
  def increment_counter
    if session[:counter].nil?
      session[:counter] = 0
    end
      session[:counter] += 1
  end

  def session_reset
    @counter = 0
    @_request.reset_session
    
    #session.keys.each do |key|
    #  Rails.logger.info "#{key} => #{session[key]}"
    #end
    
  end
  
  def index
    @counter = increment_counter
    session_reset if request.query_parameters[:reset] == "true"
  end
end
