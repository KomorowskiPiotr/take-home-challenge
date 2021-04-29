# frozen_string_literal: true

module Api
  class Base < Grape::API
    helpers do
      def invalid_api_key
        status 401
        present(:error, 'Invalid API KEY.')
      end

      def not_found
        status 404
        present(:error, 'Entity not found.')
      end
    end
  end
end
