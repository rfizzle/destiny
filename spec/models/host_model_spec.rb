require 'rails_helper'

RSpec.describe Host, type: :model do
  it('initializes and persists to the database') { Host.new.save }
end
