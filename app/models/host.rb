class Host
  include Mongoid::Document

  field :ip, type: String
  field :mac, type: String
  field :host_names, type: Array
  field :operating_system, type: String
  field :cpe, type: String

  has_many :ports
end
