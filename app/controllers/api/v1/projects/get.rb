# frozen_string_literal: true

module Api
  module V1
    module Projects
      class Get < Api::Base
        get do
          params do
            requires :id, type: Integer
            requires :api_key, type: String
          end

          project = Project.find_by(api_key: params['api_key'])
          return invalid_api_key unless project

          present(project, with: ::ProjectEntity)
        end
      end
    end
  end
end
