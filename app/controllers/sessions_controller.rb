class SessionsController < ApplicationController

  def create

    # render :text => request.env['omniauth.auth'].inspect.to_yaml

    auth_hash = request.env['omniauth.auth']

    @authorization = Authorization.find_by_provider_and_uid(auth_hash.info.provider, auth_hash.uid)

    if @authorization
      render :text => "Welcome back #{@authorization.user.name}! You're logged in through #{@authorization.provider}."
    else
      user = User.new(:name => auth_hash.info.name, :email => auth_hash.info.email)
      user.authorizations.build(:provider => auth_hash.provider, :uid => auth_hash.uid)
      user.save
      render :text => "Hi #{user.name}! Your account has been signed up."
    end

  end

end
