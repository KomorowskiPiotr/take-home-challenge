# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrencyRates::CreateService do
  describe '#call' do
    subject(:create_project) { described_class.new.call(project_id: project_id, base_currency: base_currency, convert_currency: convert_currency) }

    let(:project) { create(:project) }
    let(:project_id) { project.id }
    let(:base_currency) { 'EUR' }
    let(:convert_currency) { 'USD' }

    context 'with valid params' do
      it 'creates new currency_rate' do
        expect { create_project }.to change { CurrencyRate.all.size }.by 1
      end
    end

    context 'with invalid params' do
      context 'without incorrect project_id' do
        let(:project_id) { 0 }

        it { expect { create_project }.to raise_error(ActiveRecord::RecordInvalid) }
      end

      context 'without base_currency' do
        let(:base_currency) { nil }

        it { expect { create_project }.to raise_error(ActiveRecord::NotNullViolation) }
      end
    end
  end
end
