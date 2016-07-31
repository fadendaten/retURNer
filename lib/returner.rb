require 'returner/version'
require 'blizzard-client'

class RetURNer
  LOOKUPS = {
    customer: ->(id) { Blizzard::Client::Customer.find(id: id) },
    order: ->(id, company) { Blizzard::Client::Transaction.by_customer(id: id, company: company) },
    voucher: ->(id) { Blizzard::Client::Voucher.by_customer(id: id) }
  }.freeze

  TYPE_MAPPING = {
    customer: 'urn:fadendaten:customer',
    order: 'urn:fadendaten:webshop:order',
    voucher: 'urn:fadendaten:voucher'
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

  def other_id
    splitted_urn_hash = Hash[ splitted_urn.names.zip( splitted_urn.captures ) ]
    @other_id ||= splitted_urn_hash['other_id']
  end

  def fetch
    return LOOKUPS[type].call(id, other_id) if other_id
    LOOKUPS[type].call(id)
  end

  def splitted_urn
    @splitted_urn ||= urn.match(/(?<type>.+):(?<id>\d+)\z/) ||
                      urn.match(/(?<type>.+):(?<id>\d+):(?<other_id>.+)\z/)
  end

  def to_s
    urn
  end

  def self.for(type: nil, id: nil, other_id: nil)
    urn = "#{TYPE_MAPPING[type]}"
    urn += ":#{id}" if id
    urn += ":#{other_id}" if other_id
    new(urn)
  end
end
