module Rack
  class MyFirstMiddleware

    def initialize(app)
      @app = app
    end

    def call(env)
      started = Time.now

      status, headers, body = @app.call(env)

      p "BEFORE", [status, headers, body]

      # THIS IS OUR MIDDLEWARE ---------------------------------------------->
      body << "<p><small>Processed in: #{Time.now-started} seconds<small></p>"
      headers['Content-Length'] = Rack::Utils.bytesize(body.to_s).to_s
      # <---------------------------------------------------------------------

      p "AFTER", [status, headers, body]

      [status, headers, body]
    end

  end
end
