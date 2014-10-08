#Bcash Ruby

[![Gem
Version](http://img.shields.io/gem/v/bcash-ruby.svg)](https://rubygems.org/gems/bcash-ruby)
[![Build Status](https://travis-ci.org/minestore/bcash-ruby.svg?branch=master)](https://travis-ci.org/minestore/bcash-ruby)
[![Code Climate](https://codeclimate.com/github/minestore/bcash-ruby/badges/gpa.svg)](https://codeclimate.com/github/minestore/bcash-ruby)
[![Coverage
Status](https://coveralls.io/repos/minestore/bcash-ruby/badge.png)](https://coveralls.io/r/minestore/bcash-ruby)

Ruby wrapper for the Bcash API. This gem provides wrapper for account and
transaction methods.

## Installation
    gem install bcash-ruby

## Resources
* [View Source on GitHub][code]
* [Report Issues on GitHub][issues]
* [Read More at the Wiki][wiki]

[code]: https://github.com/minestore/bcash-ruby
[issues]: https://github.com/minestore/bcash-ruby/issues
[wiki]: https://wiki.github.com/minestore/bcash-ruby

## Configuration

```ruby
Bcash.configure do |b|
  b.email = Rails.application.secrets.bcash["email"]
  b.token = Rails.application.secrets.bcash["token"]
end
```

## Usage Examples

### Search accounts by CPF

```ruby
  client = Bcash::Client.new
  response = client.search_account_by_cpf('07411111111')
  response.code # 1
  response.cpf # 074111111111
  response.message # Foi encontrado 1 registro para o CPF ou email informado!
  response.accounts.size # 1
  response.accounts.first # { "mail" => 'pessoa@hotmail.com', "token" => 'kx4F3mkZDlGUejQNKWdnP5Ttmk', "idClient" => '205' }
```

### Create account
```ruby
  data = {
    owner: {
          email: "jose@vendedor.net",
          gender: "M",
          name: "José o Vendedor",
          cpf: "43677708699",
          birth_date: "12/12/1912"
        },
        address: {
          address: "Rua Agostinho",
          zip_code: "81560-040",
          number: "1000",
          neighborhood: "Centro",
          complement: "Casa",
          city: "Curitiba",
          state: "PR"
        },
        contact: {
          phone_number: "41-3333-3333"
        }
      }
    }

    client = Bcash::Client.new
    response = cliente.create_account(data)
    response.success? # true
    response.message # Conta criada com sucesso

```

### Verify Bcash return

```ruby
  data = {
    transacao: '2833',
    status: 'Transação em Andamento',
    cod_status: '0',
    valor_original: '2145.23',
    valor_loja: '2083.23',
    token:  '1211CF51917E074BC3784592C71FC'
  }

  client = Bcash::Client.new
  response = client.verify_return(data)
  response.verified? #true
```

## Supported Ruby Versions
This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 1.9.3
* Ruby 2.0.0
* Ruby 2.1.0
* [Rubinius][]

[rubinius]: http://rubini.us/

If something doesn't work on one of these interpreters, it's a bug.

This library may inadvertently work (or seem to work) on other Ruby
implementations, however support will only be provided for the versions listed
above.

If you would like this library to support another Ruby version, you may
volunteer to be a maintainer. Being a maintainer entails making sure all tests
run and pass on that implementation. When something breaks on your
implementation, you will be responsible for providing patches in a timely
fashion. If critical issues for a particular implementation exist at the time
of a major release, support for that Ruby version may be dropped.

## License
Copyright (c) 2014 Raphael Costa and minestore, Inc. See [LICENSE][] for
details.

[license]: LICENSE
