# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Projects::Create, type: :request do
  describe 'POST /api/v1/projects' do
    subject(:create_project) do
      post '/api/v1/projects'
      response
    end

    it { expect(create_project).to have_http_status(:success) }

    it 'creates new project' do
      expect { create_project }.to change { Project.all.size }.by 1
    end

    it 'creates new currency_rate' do
      expect { create_project }.to change { CurrencyRate.all.size }.by 1
    end

    it 'returns api_key' do
      expect(JSON.parse(create_project.body)['api_key']).to eq(Project.last.api_key)
    end
  end
end
