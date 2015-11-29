# CRICOS API

CRICOS API is an [JSON API](http://jsonapi.org) compliant app. It is responsible for providing endpoint for the client app to fetch data.

# Prerequisites

* Ruby 2.2.3 or newer
* PostgresSQL 9.1 or newer

# Getting started

## JSON API app

Please run `./scripts/setup`

Start the api server with command:

```
bundle exec lotus server
```

# Testing

Automated tests can be run with:

```
bundle exec rake spec
```

# Copyright

2015 (c) Trung Lê

# License

MIT