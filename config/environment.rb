require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/cricos_api'
require_relative '../apps/api_v1/application'

Lotus::Container.configure do
  mount ApiV1::Application, at: '/api/v1'
end
