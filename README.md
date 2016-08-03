# RetURNer

Client library to fetch URN of Blizzard resources.

## Installation

execute:

    $ gem build returner.gemspec
    $ gem install ./returner-0.1.0.gem

## Configuration

    $ require 'returner'

## Usage

###Fetch URN of a resource:

```ruby
urn = RetURNer.for(type: :customer, id: 1) # => <# RetURNer @urn='urn:fadendaten:customer:1' ...>
urn.to_s # => 'urn:fadendaten:customer:1'
```

###Fetch a resource

```ruby
urn = RetURNer.for(type: :customer, id: 1) # => <# RetURNer @urn='urn:fadendaten:customer:1' ...>
urn.fetch # => <# Blizzard::Client::Customer @id=1 ...>
```

###Rspec Testing

To run the test:
```ruby
bundle exec rspec
```
