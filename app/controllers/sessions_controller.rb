class SessionsController < ApplicationController

  def create

    # render :text => request.env['omniauth.auth'].inspect.to_yaml

    auth = request.env['omniauth.auth']

    if @authorization = Authorization.find_by_provider_and_uid(auth.provider, auth.uid)
      render :text => "Welcome back #{@authorization.user.name}! You're logged in through #{@authorization.provider}."
    else
      user = User.find_or_create_by_email(:name => auth.info.name, :email => auth.info.email)
      user.authorizations.build(:provider => auth.provider, :uid => auth.uid)
      user.save
      render :text => "Hi #{user.name}! Your account has been signed up."
    end

  end

end
