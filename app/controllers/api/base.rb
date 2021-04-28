# frozen_string_literal: true

module Api
  class Base < Grape::API
    helpers do
      def invalid_api_key
        status 401
        present(:error, 'Invalid API KEY.')
      end
    end
  end
end
