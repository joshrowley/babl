require "omniauth-oauth"

module OmniAuth
  module Strategies
    class Trello < OmniAuth::Strategies::OAuth
      option :name, "trello"
      option :client_options, { :site => "https://trello.com",
                                :request_token_path => "/1/OAuthGetRequestToken",
                                :access_token_path => "/1/OAuthGetAccessToken",
                                :authorize_path => "/1/OAuthAuthorizeToken" }

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
  end
end
