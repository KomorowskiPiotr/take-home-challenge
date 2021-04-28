# frozen_string_literal: true

module Api
  module V1
    module Projects
      class Root < Api::Base
        namespace 'projects' do
          mount Create
          route_param :id do
            mount Get
          end
        end
      end
    end
  end
end
