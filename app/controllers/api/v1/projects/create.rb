# frozen_string_literal: true

module Api
  module V1
    module Projects
      class Create < Api::Base
        post do
          ::Projects::CreateService.new.call
        end
      end
    end
  end
end
