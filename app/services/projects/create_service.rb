# frozen_string_literal: true

require 'securerandom'

module Projects
  class CreateService
    def call(name: nil)
      project = Project.create!(
        name: name,
        api_key: generate_api_key
      )

      currency_rate = create_default_currency_rate(project.id)

      if currency_rate['error']
        project.delete
        return currency_rate['error']
      end

      { api_key: project.api_key }
    end

    private

    def generate_api_key
      BCrypt::Password.create(api_key)
    end

    def api_key
      SecureRandom.base64(15)
    end

    def create_default_currency_rate(project_id)
      CurrencyRates::CreateService.new.call(project_id: project_id, base_currency: 'EUR', convert_currency: 'USD')
    end
  end
end
