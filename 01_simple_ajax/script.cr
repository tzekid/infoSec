#!/usr/bin/crystal
require "http"

# Take an argument (cmd line)
name = ARGV.size == 1 ? ARGV[0] : "bob"

LINK_TO_BOB_PHP = "http://localhost/infosec/01_xmlreq/bob.php"

# Send request to URL
response = HTTP::Client.get LINK_TO_BOB_PHP + "?q=#{name}"

# Print response
response = response.body
print "Server response: `#{response}`"

