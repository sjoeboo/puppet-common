#!/usr/bin/env ruby

require 'facter'
begin
  Facter.puppet_vardir
rescue
  Facter.loadfacts()
end

vardir=Facter.value("puppet_vardir")
statedir="#{vardir}/state"
classes_file="#{statedir}/classes.txt"

if File.exists?(classes_file)
  #File exists, load it.
  f=File.open(classes_file, 'r')
  classes=Array.new
  f.each_line do |line|
    classes.push(line.chomp)
  end

  #Capture the whole list
  classes_all=Array.new
  classes.each do |c|
    classes_all.push(c)
  end

  roles=Array.new
  classes.each do |c|
    if c.match(/role/)
      roles.push(c)
    end
  end
  classes.delete_if {|c| c.match(/role/)}

  profiles=Array.new
  classes.each do |c|
    if c.match(/profile/)
      profiles.push(c)
    end
  end
  classes.delete_if {|c| c.match(/profile/)}

  Facter.add("classes") do
    setcode do
      classes
    end
  end
  Facter.add("classes_all") do
    setcode do
      classes_all
    end
  end
  Facter.add("roles") do
    setcode do
      roles
    end
  end
  Facter.add("profiles") do
    setcode do
      profiles
    end
  end

end
