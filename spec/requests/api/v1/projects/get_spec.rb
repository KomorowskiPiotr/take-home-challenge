# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Projects::Get, type: :request do
  describe 'GET /api/v1/projects/:id' do
    subject(:get_project) do
      get '/api/v1/projects/:id', params: params
      response
    end

    let(:project) { create(:project) }

    context 'with valid api_key' do
      let(:params) { { api_key: project.api_key } }

      it 'returns project' do
        expect(JSON.parse(get_project.body).keys.sort).to eq(%w[api_key currency_rates name].sort)
      end

      it { expect(get_project).to have_http_status(:success) }
    end

    context 'with invalid api_key' do
      let(:params) { { api_key: nil, id: project.id } }

      it 'returns error message' do
        expect(JSON.parse(get_project.body)).to eq({ 'error' => 'Invalid API KEY.' })
      end

      it { expect(get_project).to have_http_status(:unauthorized) }
    end
  end
end
