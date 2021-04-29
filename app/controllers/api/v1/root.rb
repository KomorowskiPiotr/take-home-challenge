# frozen_string_literal: true

module Api
  module V1
    class Root < Api::Base
      version 'v1'
      format :json

      mount Api::V1::Projects::Root
      mount Api::V1::CurrencyRates::Root

      add_swagger_documentation info: { title: 'challenge-app' }, doc_version: '0.0.1'
    end
  end
end
