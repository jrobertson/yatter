#!/usr/bin/env ruby

# file: yatter.rb 

# desc: Yet another Twitter wrapper

require 'twitter'
require 'dynarex-password'
require 'remote_dwsregistry'


class Yatter < Twitter::REST::Client
  
  def self.fetch_credentials(regx, user)
    
    reg = if regx.is_a? String then
      RemoteDwsRegistry.new domain: regx
    else
      regx
    end

    decipher = ->(lookup_file, s) {
      DynarexPassword.new.reverse_lookup(s, lookup_file)
    }
    
    key = 'hkey_apps/microblog/twitter/'
    e = reg.get_key(key + user)
    lookup_file = e.text('lookup_file').to_s
    
    consumer_key        = e.text('ctoken').to_s
    consumer_secret     = decipher.call(lookup_file, e.text('csecret').to_s)
    access_token        = e.text('atoken').to_s
    access_token_secret = decipher.call(lookup_file, e.text('asecret').to_s)
    
    [consumer_key, consumer_secret, access_token, access_token_secret]
    
  end    
  
  def initialize(reg, user: nil, debug: false)

    raise 'You must enter a user' if user.nil? 

    @debug = debug
    
    consumer_key, consumer_secret, access_token, access_token_secret = Yatter.fetch_credentials(reg, user)
    
    if @debug then
      puts [consumer_key, consumer_secret, access_token, access_token_secret]\
          .inspect 
    end    
    
    super() do |config|                  
      
      config.consumer_key        = consumer_key
      config.consumer_secret     = consumer_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
                  
    end
    
    #if e.text('last_follower').to_s.empty? then
    #  reg.set_key(key + 'last_follower', last_follower) 
    #end

  end
  
  def followers()
    
    @followers ||= super().take(10)
    
    @followers.map do |x|
      
      OpenStruct.new({
        name: x.name, 
        username: x.screen_name, 
        profile: x.description,        
        followers: x.followers_count, 
        following: x.friends_count,
        member_since: x.created_at, 
        website: x.website.to_s
      }).freeze
      
    end
    
  end
  
  def last_follower()
    
    @followers ||= followers.take(10)    
    @followers[0][:username]

  end
  
  def mentions()
    
    @mentions ||= super()
    
    @mentions.map do |x|
      OpenStruct.new({date: x.created_at, user: x.user.screen_name, 
                      text: x.text}).freeze
    end
    
  end
  
  def update(msg)
    super(msg)
  end

end
