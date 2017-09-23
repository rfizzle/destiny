require 'rails_helper'

RSpec.describe Host, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_field(:ip).of_type(String) }
  it { is_expected.to have_field(:mac).of_type(String) }
  it { is_expected.to have_field(:host_names).of_type(Array) }
  it { is_expected.to have_field(:operating_system).of_type(String) }
  it { is_expected.to have_field(:cpe).of_type(String) }
  it { is_expected.to have_many(:ports).of_type(Port) }
end
