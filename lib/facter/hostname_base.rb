#!/usr/bin/env ruby

require 'facter'
begin
  Facter.hostname
rescue
  Facter.loadfacts()
end

#Hostname_base Fact
# something02 => something 
Facter.add("hostname_base") do
  setcode do
    Facter.value("hostname").gsub(/\d+$/,"")
  end
end
