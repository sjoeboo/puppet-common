#!/usr/bin/env ruby

require 'facter'
begin
  Facter.classes
rescue
  Facter.loadfacts()
end

classes=Facter.value("classes")

profiles=Array.new
classes.each do |c|
  if c.match(/profile/)
    profiles.push(c)
  end
end
Facter.add("profiles") do
  setcode do
    profiles
  end
end

