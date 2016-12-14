#!/usr/bin/env ruby
require 'curb'
require 'json'

puts "BOF"

def exit_
    abort("macrohard.rb <email@domain.com> or <emails.txt"); end

# Get user input
input = (ARGV[0]) ? ARGV[0] : exit_

# Check if input is a single email or a text file
mail = (input.include? "@")    ? input : false
list = (input.include? ".txt") ? input : false
if not mail and not list then exit_ end

# Token will work for ~1 Month
def check(email, line = 0)
  if not (email.include? "@") then return false end
  
  begin c = Curl::Easy.perform("http://login.microsoft.com/common/userrealm/?user=#{email}&api-version=2.1&stsRequest=rQIIAeNisNLJKCkpKLbS1y_ILypJzNHLzUwuyi_OTyvJz8vJzEvVS87P1csvSs9MAbGKhLgEVHZIfTk2gc1hX6NOeetrV7VVjMqEjdC_wMj4gpHxFpOgf1G6Z0p4sVtqSmpRYklmft4jJt7Q4tQi_7ycypD87NS8Scx8OfnpmXnxxUVp8Wk5-eVAAaAJBYnJJfElmcnZqSW7mFXMDQyTDJIN03QNjU3NdE2SjY10kyxMjXXNjZKMzQ1NkhNNDVIusAj8YGFcxAp0s9_a1dsnrrrg3fHpeJnD2gkzT7HqW4RXVia7-OaYGVd4umZmBRelWvo5hSSmZ7ukOnkF5UUmenhnlno4hucVmdgaWxke4GQEAA2&checkForMicrosoftAccount=true")
  rescue
    printf("%02x %32s | Check FAIL\n", (line+1), email)
    return false
  end

  data = JSON.parse(c.body_str)

  # Check the "MicrosoftAccount" Tag
  if(data["MicrosoftAccount"] == 1)
    printf "%02x %32s | Check OK | INVALID | Macrohard\n", (line+1), email
    return false
  
  elsif (data["MicrosoftAccount"] == 0)
    printf "%02x %32s | Check OK |  VALID  | Microsoft\n", (line+1), email 
    return true

  else exit_
  end
end


if mail then check(mail)
  
elsif list
  # Try to open the file
  begin  text = File.open(list).read
  rescue(abort "There is no file named: #{list}")
  end

  # Format newlines
  text.gsub!(/\r\n?/, "\n")

  # Create an output file
  begin  file = File.open("./output.txt", "w+")
  rescue(abort "You have no rights to write output.txt")
  end
  
  # Do the thing
  ln = 0
  text.each_line do |line|
    line = line.strip

    if check(line, ln)
      file.write("#{line}\n")
    end
  end
end

puts "EOF"
