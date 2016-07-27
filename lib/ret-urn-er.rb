require 'ret-urn-er/version'

module RetURNer
  def self.hello(str)
    puts str
    if Blizzard::Client::Customer.respond_to?(:find)
      puts 'Blizzard is cllable'
    end
  end
end
