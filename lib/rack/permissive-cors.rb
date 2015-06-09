module Rack
  class PermissiveCors
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
       'Access-Control-Allow-Methods' => '*',
       'Access-Control-Allow-Headers' => '*'
      }
    end
  end
end
