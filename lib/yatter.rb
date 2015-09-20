#!/usr/bin/env ruby

# file: yatter.rb 

# desc: Yet another Twitter wrapper

require 'twitter'
require 'dynarex-password'
require 'dws-registry'

class Yatter < Twitter::REST::Client
  
  def initialize(reg, user: nil)

    raise 'You must enter a user' if user.nil? 

    e = reg.get_key('hkey_apps/microblog/twitter/' + user)
    @lookup_file = e.text('lookup_file')
    
    super() do |config|                  
      
      config.consumer_key        = e.text('ctoken')
      config.consumer_secret     = decipher(e.text('csecret'))
      config.access_token        = e.text('atoken')
      config.access_token_secret = decipher(e.text('asecret'))
            
    end

  end
  
  def update(msg)
    super(msg)
  end

  private

  def decipher(s)
    DynarexPassword.new.reverse_lookup(s, @lookup_file)
  end
end
