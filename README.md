# Crikey! It's a new CRICOS app!

Crikey is an attempt to provide a JSON API service for the CRICOS system (which does not offer API interface).

It is built to demonstrate the power of [Lotus Framework](http://lotusrb.org) on API side and NodeJS/ReactJS on the client side.

Please be noted that this app is not affiliated with the government department who runs CRICOS. It does not ship with the CRICOS DB for legal reason. You can scrape the data with existing [crisos_crape](https://github.com/ruby-journal/cricos_scrape.rb).

# Prerequisites

* Ruby 2.2.3 or newer
* NodeJS 4.2.1 or newer
* PostgresSQL 9.1 or newer

# Architecture

The app is split into 2 apps.

* The API app is written with Lotus
* The web client app is written with ReactJS using NodeJS stack (located under `client` folder)

# Getting started

## JSON API app

Please see README.md in `server`

## Web Client app

Please see README.md in `client`

# Copyright

2015 (c) Trung Lê & friends

# License

MIT