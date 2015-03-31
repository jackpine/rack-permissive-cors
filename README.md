# Rack::PermissiveCors

Set Permissive CORS headers using this special rack middleware. This
might solve your problem with broken fonts on firefox, and overly polite
Ajax queries.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-permissive-cors', git: "git@github.com:jackpine/rack-permissive-cors.git"

And then execute:

    $ bundle

## Usage

E.g you can force permissive CORS headers on all requests in case your CDN cache doesn't vary on Origin. _I'm looking at you Cloudfront!_

In config/environments/production.rb:

    # Make sure to insert this middleware before `ActionDispatch::Static`
    require 'rack/permissive-cors'
    config.middleware.insert_before(ActionDispatch::Static,
                                    Rack::PermissiveCors)

    # serve your static assets using rails.
    config.serve_static_assets = true

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
