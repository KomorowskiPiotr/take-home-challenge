# frozen_string_literal: true

require 'securerandom'

module Projects
  class CreateService
    def call(name: nil)
      project = Project.create!(
        name: name,
        api_key: generate_api_key
      )

      { api_key: project.api_key }
    end

    private

    def generate_api_key
      BCrypt::Password.create(api_key)
    end

    def api_key
      SecureRandom.base64(15)
    end
  end
end
