# frozen_string_literal: true

module Api
  class Root < Api::Base
    mount Api::V1::Root
  end
end
