require 'lotus/model'

Dir["#{ __dir__ }/cricos_api/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  ##
  # Database adapter
  #
  adapter type: :sql, uri: ENV['CRICOS_API_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  mapping "#{ __dir__ }/config/mapping"
end.load!
