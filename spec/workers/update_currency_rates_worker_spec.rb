# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe UpdateCurrencyRatesWorker, type: :worker do
  describe 'testing worker' do
    it 'goes into the jobs array for testing environment' do
      expect { described_class.perform_async }.to change(described_class.jobs, :size).by(1)
      described_class.new.perform
    end
  end
end
