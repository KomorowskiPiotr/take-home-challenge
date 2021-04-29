# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CurrencyRates::Show, type: :request do
  describe 'GET /api/v1/currency_rates' do
    subject(:get_currency_rates) do
      get '/api/v1/currency_rates', params: params
      response
    end

    let(:project) { create(:project) }
    let!(:currency_rate) { create(:currency_rate) }

    context 'with valid api_key' do
      let(:params) { { api_key: project.api_key } }

      it 'returns currency_rate' do
        expect(JSON.parse(get_currency_rates.body).first).to include(
          'base_currency' => currency_rate.base_currency,
          'exchanger' => currency_rate.exchanger
        )
      end

      it { expect(get_currency_rates).to have_http_status(:success) }
    end

    context 'with invalid api_key' do
      let(:params) { { api_key: nil, id: project.id } }

      it 'returns error message' do
        expect(JSON.parse(get_currency_rates.body)).to eq({ 'error' => 'Invalid API KEY.' })
      end

      it { expect(get_currency_rates).to have_http_status(:unauthorized) }
    end
  end
end
