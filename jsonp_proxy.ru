require 'rack/contrib/jsonp'
require 'cgi'
require 'uri'
require 'net/http'
require 'net/https'

module Rack
  class Proxy

    def initialize(app)
      @app = app
    end

    def call(env)
      @status, @headers, @body = @app.call(env)
      request = Rack::Request.new(env)
      src = request.GET['src']
      if src
        url = URI.parse(src)
        connection = Net::HTTP.new(url.host, url.port)
        connection.use_ssl = true if url.is_a?(URI::HTTPS)
        res = connection.start { |http|
          http.send_request(request.request_method, [url.path, url.query].compact.join('?'), 
                            request.body.read)
        }
        [res.code, { 'Content-Type' => res.content_type }, res.body]
      else
        [@status, @headers, @body]
      end
    end

  end
end

use Rack::ContentLength
use Rack::JSONP
use Rack::Proxy

usage = <<-EOF
<h1>JSONP Proxy</h1>

<p>This is a proxy application that adds JSONP wrapping to JSON responses from
sites that do not support JSONP themselves.  <a
href="http://bob.pythonmac.org/archives/2005/12/05/remote-json-jsonp/">Read
more about JSONP.</a></p>

<p>To use this service, make a request to this address with a 'src' parameter
pointing to the URL of the JSON data you want to retrieve, and a 'callback'
parameter naming a function in your JavaScript application. Make sure the 'src'
parameter is properly escaped. For example:</p>

<blockquote>http://jsonp.pdxjs.com/?src=http%3A%2F%2Fexample.com%2Fdata.json&callback=read_json</blockquote>
EOF

app = lambda { [200, { 'Content-Type' => 'text/html' }, usage] }
run app
