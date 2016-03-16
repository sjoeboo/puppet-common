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
  Facter.add("classes") do
    setcode do
      classes
    end
  end
end

