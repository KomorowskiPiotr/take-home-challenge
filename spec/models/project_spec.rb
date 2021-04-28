# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  it { expect { create(:project) }.not_to raise_error }
end
