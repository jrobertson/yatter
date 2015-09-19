# Introducing the Yatter gem (Yet another Twitter wrapper)

    require 'yatter'

    registry = DWSRegistry.new('/home/james/da2/registry/registry.xml')
    t = Yatter.new registry, user: 'jrobertson', lookup_file: '/home/james/password-210115_lookup.xml'
    t.update "Testing the Yatter gem (Yet another Twitter wrapper), please ignore"

The above example post a status update to Twitter using the Yatter gem which is a wrapper of the Twitter gem.

In this gem it retrieves the Twitter oauth credentials from an XML based registry file. The sensitive credentials are encrypted which is why a lookup_file is passed in to decrypt them.

## Resources

* twitter  by sferik http://sferik.github.io/twitter/
* yatter https://rubygems.org/gems/yatter

yatter twitter gem wrapper


