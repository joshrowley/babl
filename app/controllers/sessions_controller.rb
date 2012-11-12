class SessionsController < ApplicationController

  def create


    #3.1.7
    # render :text => request.env['omniauth.auth'].inspect.to_yaml


    #3.2.6
    auth = request.env['omniauth.auth']

    if @authorization = Authorization.find_by_provider_and_uid(auth.provider, auth.uid)
      render :text => "Welcome back #{@authorization.user.name}! You're logged in through #{@authorization.provider}."
    else
      user = User.find_or_create_by_email(:name => auth.info.name, :email => auth.info.email)
      user.authorizations.build(:provider => auth.provider, :uid => auth.uid)
      user.save
      render :text => "Hi #{user.name}! Your account has been signed up."
    end

    self.current_user = @authorization.user
    

  end


  def destroy
    session[:user_id] = nil
  end


end
