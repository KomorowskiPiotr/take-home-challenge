# frozen_string_literal: true

module Api
  module V1
    module Projects
      class Create < Grape::API
        post do
          ::Projects::CreateService.new.call
        end
      end
    end
  end
end
