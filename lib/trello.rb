require 'omniauth-oauth'
class Trello < OmniAuth::Strategies::OAuth
      option :name, "trello"
      option :client_options, { :site => "https://trello.com",
                                :request_token_path => "/1/OAuthGetRequestToken",
                                :access_token_path => "/1/OAuthGetAccessToken",
                                :authorize_path => "/1/OAuthAuthorizeToken",
                                :name => "App Name Yo!" }

      uid do
        1
      end

      info do
        {
          :name => "test_name",
          :location => "test_location"
        }
      end


      extra do
        {
          'raw_info' => "test_raw_info"
        }
      end

      def raw_info
      end
end