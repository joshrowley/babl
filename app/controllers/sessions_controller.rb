class SessionsController < ApplicationController

  def create

    render :text => request.env['omniauth.auth'].inspect.to_yaml

  end

end
