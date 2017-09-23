class Port
  include Mongoid::Document

  field :number, type: Integer
  field :protocol, type: String
  field :service, type: String
  belongs_to :host
end
