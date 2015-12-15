# Lahar::Ruby

Ruby API wrapper for Lahar

## Installation

Add this line to your application's Gemfile:

    gem 'lahar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lahar

## Usage

### Creating a Lead
    lead = Lahar::Client.new('lahar_token')
    lead.create_lead({ :email => 'foo@bar.com', :nome => 'Foo Bar', nome_formulario: 'nome_da_conversao' })

### Changing a Lead
    lead = Lahar::Client.new('lahar_token')
    lead.change_lead({ :email => 'foo@bar.com', :nome => 'Bar Foo', nome_formulario: 'nome_da_conversao' })

### Change Lead Status
    lead = Lahar::Client.new('lahar_token')
    lead.change_lead_status({ :email => 'foo@bar.com', :estagio_lead => '2' })


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
