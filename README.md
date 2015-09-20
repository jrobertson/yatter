Introducing the Yatter gem (Yet another Twitter wrapper)

    require 'yatter'

    registry = DWSRegistry.new('/home/james/da2/registry/registry.xml')
    t = Yatter.new registry, user: 'jrobertson'
    t.update "Testing the Yatter gem (Yet another Twitter wrapper), please ignore"

The above example posts a status update to Twitter using the Yatter gem which is a wrapper of the Twitter gem.

In this gem it retrieves the Twitter oauth credentials from an XML based registry file. The sensitive credentials are encrypted which is why a lookup_file is passed in to decrypt them.

Here's a sample of the twitter_jrobertson.reg file I imported to the registry:

<pre>
hkey_apps/microblog/twitter/jrobertson
ctoken: 38najKwhmfYRJruC94kRSg
csecret: xIiVvzWYPv8bHjZm528wBDDJyoR1pIvGmBss453MR1tP6LR1tPBBb7Ezrd6LqfZmsXBByoEJEJBBWYR18x7L8b
atoken: 763224-5iKZYjX35tUm5qaMaNXwlYgEMm9QnQFnKLwq9OyecE
asecret: FznV2pc5k19E52xE2pGm2pEzWYHjHuqZZlGmTvR1EzBE1Ku8aPrIy4WYvz2N1K2bPv9k1KPePvBEGmqAHjmBHj
lookup_file: /home/james/password-210115_lookup.xml
</pre>

## Resources

* twitter by sferik http://sferik.github.io/twitter/
* yatter https://rubygems.org/gems/yatter

yatter twitter gem wrapper

