require 'lotus/helpers'
require 'rack/cors'

module ApiV1
  class Application < Lotus::Application
    configure do
      ##
      # BASIC
      #

      # Define the root path of this application.
      # All paths specified in this configuration are relative to path below.
      #
      root __dir__

      # Relative load paths where this application will recursively load the code.
      # When you add new directories, remember to add them here.
      #
      load_paths << [
        'controllers',
        'serializers'
      ]

      # Handle exceptions with HTTP statuses (true) or don't catch them (false).
      # Defaults to true.
      # See: http://www.rubydoc.info/gems/lotus-controller/#Exceptions_management
      #
      # handle_exceptions true

      ##
      # HTTP
      #

      # Routes definitions for this application
      # See: http://www.rubydoc.info/gems/lotus-router#Usage
      #
      routes 'config/routes'

      # URI scheme used by the routing system to generate absolute URLs
      # Defaults to "http"
      #
      # scheme 'https'

      # URI host used by the routing system to generate absolute URLs
      # Defaults to "localhost"
      #
      # host 'example.org'

      # URI port used by the routing system to generate absolute URLs
      # Argument: An object coercible to integer, default to 80 if the scheme is http and 443 if it's https
      # This SHOULD be configured only in case the application listens to that non standard ports
      #
      # port 443

      # Configure Rack middleware for this application
      #
      # middleware.use Rack::Protection

      middleware.use Rack::Cors do
        allow do
          origins '*'
          resource '*',
            headers: :any,
            methods: [:get, :post, :options],
            credentials: true,
            max_age: 0
        end
      end

      controller.format json_api: 'application/vnd.api+json'

      # Default format for the requests that don't specify an HTTP_ACCEPT header
      # Argument: A symbol representation of a mime type, default to :html
      #
      default_request_format :json_api

      # Default format for responses that doesn't take into account the request format
      # Argument: A symbol representation of a mime type, default to :html
      #
      default_response_format :json_api

      # HTTP Body parsers
      # Parse non GET responses body for a specific mime type
      # Argument: Symbol, which represent the format of the mime type (only `:json` is supported)
      #           Object, the parser
      #
      body_parsers :json

      # When it's true and the router receives a non-encrypted request (http),
      # it redirects to the secure equivalent resource (https). Default disabled.
      #
      # force_ssl true

      ##
      # TEMPLATES
      #

      # The layout to be used by all views
      #
      # layout :application # It will load ApiV1::Views::ApplicationLayout

      # The relative path to templates
      #
      # templates 'templates'

      # Enabling serving assets
      # Defaults to false
      #
      serve_assets false

      ##
      # FRAMEWORKS
      #

      # Configure the code that will yield each time ApiV1::Action is included
      # This is useful for sharing common functionality
      #
      # See: http://www.rubydoc.info/gems/lotus-controller#Configuration
      controller.prepare do
        # include MyAuthentication # included in all the actions
        # before :authenticate!    # run an authentication before callback
      end
    end

    ##
    # DEVELOPMENT
    #
    configure :development do
      # Don't handle exceptions, render the stack trace
      handle_exceptions false
    end

    ##
    # TEST
    #
    configure :test do
      # Don't handle exceptions, render the stack trace
      handle_exceptions false
    end

    ##
    # PRODUCTION
    #
    configure :production do
      # scheme 'https'
      # host   'example.org'
      # port   443
    end
  end
end
