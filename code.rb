# 3.1.0
# App ID
'305526829561222'
# App Secret
'53985e48bc5b0c0318d1567763477f9b'

# 3.1.1
gem 'omniauth-facebook'

# 3.1.3 - omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '305526829561222', '53985e48bc5b0c0318d1567763477f9b'
  # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  # provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end

# 3.1.4 - routes.rb
match '/auth/:provider/callback', :to => 'sessions#create'

# 3.1.6 - sessions_controller.rb
def create
  render :text => request.env['omniauth.auth'].inspect
end

# 3.2.3 - user.rb
has_many :authorizations

# 3.2.3 - authorization.rb
belongs_to :user

# 3.2.4 - authorization.rb
validates_presence_of :user_id, :uid, :provider
validates_uniqueness_of :uid, :scope => :provider

# 3.2.5 - user.rb
validates_uniqueness_of :email

# 3.2.6 - sessions_controller.rb
def create
  auth = request.env['omniauth.auth']

  if @authorization = Authorization.find_by_provider_and_uid(auth.provider, auth.uid)
  else
    user = User.find_or_create_by_email(:email => auth.info.email)
    user.name = auth.info.name
    @authorization = user.authorizations.build(:provider => auth.provider, :uid => auth.uid)
    user.save
  end
end

# 3.2.7 - sessions_controller.rb
self.current_user = @authorization.user

# 3.2.7 - application_controller.rb
def current_user
  User.find(session[:user_id])
end

def current_user=(user)
  session[:user_id] = user.id
end

helper_method :current_user

# 3.2.8 - sessions_controller.rb
redirect_to root_url

# 3.2.9 - application.html.erb
<div class="btn logout">
  <%= link_to "Logout", "/logout" %>
</div>
<div class="btn login">
  <% if current_user %>
    Signed in as <%= current_user.name %>
  <% else %>
    <%= link_to "Sign in with Facebook", "/auth/facebook" %>
  <% end %>
</div>

# 3.2.10 - routes.rb
match '/logout', :to => 'sessions#destory'

# 3.2.11 - sessions_controller.rb
def destroy
  session[:user_id] = nil
  redirect_to root_url
end