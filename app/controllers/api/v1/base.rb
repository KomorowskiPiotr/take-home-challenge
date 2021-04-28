# frozen_string_literal: true

module Api
  module V1
    class Base < Grape::API
      version 'v1'
      format :json

      namespace 'projects' do
        mount Api::V1::Projects::Create
        route_param :id do
          mount Api::V1::Projects::Get
        end
      end

      helpers do
        def invalid_api_key
          status 401
          present(:error, 'Invalid API KEY.')
        end
      end
    end
  end
end
