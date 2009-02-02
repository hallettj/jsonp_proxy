JSONP Proxy
=============

This is a proxy application that adds JSONP wrapping to JSON responses from
sites that do not support JSONP themselves. [Read more about JSONP.][jsonp]

[jsonp]: http://bob.pythonmac.org/archives/2005/12/05/remote-json-jsonp/

To use this service, make a request to the JSONP Proxy with a 'src' parameter
pointing to the URL of the JSON data you want to retrieve, and a 'callback'
parameter naming a function in your JavaScript application. Make sure the 'src'
parameter is properly escaped. For example:

    http://jsonp.pdxjs.com/?src=http%3A%2F%2Fexample.com%2Fdata.json&callback=read_json

Installation
--------------

JSONP Proxy is made up of a single file, jsonp_proxy.ru. This is a Rack
application. Set it running like any other rack application.
