require 'returner/version'
require 'blizzard-client'

class RetURNer
  LOOKUPS = {
    customer: ->(id) { Blizzard::Client::Customer.find(id: id) },
  }.freeze

  TYPE_MAPPING = {
    customer: 'urn:fadendaten:customer'
  }.freeze

  attr_reader :urn

  def initialize(urn)
    @urn = urn
  end

  def id
    @id ||= splitted_urn[:id].to_i
  end

  def type
    @type ||= TYPE_MAPPING.invert[splitted_urn[:type]]
  end

  def fetch
    LOOKUPS[type].call(id)
  end

  def splitted_urn
    @splitted_urn ||= urn.match(/(?<type>.+):(?<id>\d+)\z/)
  end

  def to_s
    urn
  end

  def self.for(type: nil, id: nil)
    urn = "#{TYPE_MAPPING[type]}:#{id}"
    new(urn)
  end
end
