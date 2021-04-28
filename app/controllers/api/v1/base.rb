# frozen_string_literal: true

module Api
  module V1
    class Base < Grape::API
      version 'v1'
      format :json

      namespace 'projects' do
        mount Api::V1::Projects::Create
      end
    end
  end
end
