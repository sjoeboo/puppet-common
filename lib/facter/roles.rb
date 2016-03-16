#!/usr/bin/env ruby

require 'facter'
begin
  Facter.classes
rescue
  Facter.loadfacts()
end

classes=Facter.value("classes")

roles=Array.new
classes.each do |c|
  if c.match(/role/)
    roles.push(c)
  end
end
Facter.add("roles") do
  setcode do
    roles
  end
end

