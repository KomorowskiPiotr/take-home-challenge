# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CurrencyRates::Exchange, type: :request do
  describe 'GET /api/v1/currency_rates/exchange' do
    subject(:get_exchange_value) do
      get '/api/v1/currency_rates/exchange', params: params
      response
    end

    let(:project) { create(:project) }
    let!(:currency_rate) { create(:currency_rate) }

    context 'with valid api_key' do
      let(:params) do
        { api_key: project.api_key,
          exchanger: exchanger,
          value: value }
      end
      let(:exchanger) { currency_rate.exchanger }
      let(:value) { 1 }

      context 'when currency rate exist' do
        let(:value) { 10 }

        it 'returns exchange value' do
          expect(JSON.parse(get_exchange_value.body)).to eq({ 'exchange_value' => (currency_rate.rate.to_f * value.to_f).to_s })
        end

        it { expect(get_exchange_value).to have_http_status(:success) }
      end

      context 'when currency rate does not exist' do
        let(:exchanger) { 'FAKE' }

        it 'returns error message' do
          expect(JSON.parse(get_exchange_value.body)).to eq({ 'error' => 'Entity not found.' })
        end

        it { expect(get_exchange_value).to have_http_status(:not_found) }
      end
    end

    context 'with invalid api_key' do
      let(:params) { { api_key: nil, id: project.id } }

      it 'returns error message' do
        expect(JSON.parse(get_exchange_value.body)).to eq({ 'error' => 'Invalid API KEY.' })
      end

      it { expect(get_exchange_value).to have_http_status(:unauthorized) }
    end
  end
end
