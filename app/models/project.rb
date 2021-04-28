# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :currency_rates, dependent: :destroy
end
