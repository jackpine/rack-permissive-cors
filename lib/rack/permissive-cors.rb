module Rack
  class PermissiveCors
    VERSION = '0.1.0'

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      headers = headers.merge(cors_header)
      [status, headers, body]
    end

    def cors_header
      {
       'Access-Control-Allow-Origin' => '*',
       'Access-Control-Allow-Methods' => 'GET, POST, PUT, DELETE',
       'Access-Control-Allow-Headers' => 'Authorization, Origin, X-Requested-With, Content-Type, Accept'
      }
    end
  end
end
