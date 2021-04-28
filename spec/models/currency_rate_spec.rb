# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrencyRate, type: :model do
  it { expect { create(:currency_rate) }.not_to raise_error }
end
