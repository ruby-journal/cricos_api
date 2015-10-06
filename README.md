# CRICOS API

CRICOS API is an attempt to provide a JSON API service for the CRICOS system (which does not offer API interface).

It is built to demonstrate the power of [Lotus Framework](http://lotusrb.org).

Please be noted that this app is not affiliated with the government department who runs CRICOS. It does not ship with the CRICOS DB for legal reason. You can scrape the data with existing tools on the WWW.

# Getting started

Please run `./setup.sh`

Start the server with command:

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