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
  Dir["#{ __dir__ }/config/mappers/*.rb"].each { |file| mapping file.to_s.gsub('.rb', '') }
end.load!
