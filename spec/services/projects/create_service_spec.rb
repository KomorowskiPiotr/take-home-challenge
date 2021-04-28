# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::CreateService do
  describe '#call' do
    subject(:create_project) { described_class.new.call }

    it 'creates new project' do
      expect { create_project }.to change { Project.all.size }.by 1
    end

    it 'creates new currency_rate' do
      expect { create_project }.to change { CurrencyRate.all.size }.by 1
    end
  end
end
