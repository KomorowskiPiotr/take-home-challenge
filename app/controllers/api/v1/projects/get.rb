# frozen_string_literal: true

module Api
  module V1
    module Projects
      class Get < Grape::API
        get do
          params do
            requires :id, type: Integer
            requires :api_key, type: String
          end

          project = Project.includes(:currency_rates).find_by(api_key: params['api_key'])
          return invalid_api_key unless project

          present(project, with: ::ProjectEntity)
        end
      end
    end
  end
end
