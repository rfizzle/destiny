# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'health/index.html.erb', type: :feature do
    scenario 'route works' do
      visit health_index_path
      expect(current_path).to eq(health_index_path)
    end
end
