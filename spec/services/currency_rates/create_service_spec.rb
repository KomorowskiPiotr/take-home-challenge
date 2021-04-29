# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrencyRates::CreateService do
  describe '#call' do
    subject(:create_rate) { described_class.new.call(base_currency: base_currency, convert_currency: convert_currency) }

    let(:base_currency) { 'EUR' }
    let(:convert_currency) { 'USD' }

    context 'with valid params' do
      context 'when currency rate exist' do
        before { create(:currency_rate) }

        it 'does not create new currency_rate' do
          expect { create_rate }.not_to change { CurrencyRate.all.size }
        end
      end

      context 'when currency rate does not exist' do
        it 'creates new currency_rate' do
          expect { create_rate }.to change { CurrencyRate.all.size }.by 1
        end
      end
    end

    context 'with invalid params' do
      context 'without base_currency' do
        let(:base_currency) { nil }

        it { expect { create_rate }.to raise_error(ActiveRecord::NotNullViolation) }
      end

      context 'without exchanger' do
        let(:convert_currency) { nil }

        it { expect { create_rate }.to raise_error(ActiveRecord::NotNullViolation) }
      end
    end
  end
end
