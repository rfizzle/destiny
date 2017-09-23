require 'rails_helper'

RSpec.describe Port, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_field(:number).of_type(Integer) }
  it { is_expected.to have_field(:protocol).of_type(String) }
  it { is_expected.to have_field(:service).of_type(String) }
  it { is_expected.to belong_to(:host) }
end
