module ApiV1Helper
  require 'rack/test'
  include Rack::Test::Methods

  private

  def app
    ApiV1::Application.new
  end

  def response
    last_response
  end
end

RSpec.configure do |config|
  config.include ApiV1Helper, type: :api_v1
end