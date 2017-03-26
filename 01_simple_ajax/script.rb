#!/usr/bin/env ruby
require 'curb'

# Take an argument (cmd line)
name = (ARGV[0]) ? ARGV[0] : "bob"

LINK_TO_BOB_PHP = "http://localhost/infosec/01_xmlreq/bob.php"

# Send request to URL
c = Curl::Easy.perform(LINK_TO_BOB_PHP + "?q=#{name}")

# Print response
response = c.body_str
print "Server response: `#{response}`"
