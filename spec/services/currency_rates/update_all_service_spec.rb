# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrencyRates::UpdateAllService do
  describe '#call' do
    subject(:update_rates) { described_class.new.call }

    let(:currency_rate) { create(:currency_rate, rate: 0) }

    it 'updates currency_rate' do
      expect { update_rates }.to change { currency_rate.reload.rate }
    end
  end
end
