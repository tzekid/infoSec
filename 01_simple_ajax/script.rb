#!/usr/bin/env ruby
require 'curb'

# Take an argument (cmd line)
name = (ARGV[0]) ? ARGV[0] : "bob"

# Send request to URL
c = Curl::Easy.perform("http://localhost/infosec/01_xmlreq/bob.php?q=#{name}")

# Print response
response = c.body_str
print "Server response: `#{response}`"