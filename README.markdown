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

Dependencies
--------------

* rack
* rack-contrib

License
---------

The MIT License

Copyright (c) 2009 Jesse Hallett <hallettj@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
