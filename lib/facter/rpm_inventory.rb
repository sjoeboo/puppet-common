#/usr/bin/env ruby
require 'facter'

begin
  Facter.operatinsystem
rescue
  Facter.loadfacts()
end

#Limit to RHEL-ish nodes

if Facter.value('operatingsystem').match(/(RedHat|CentOS)/)
  #generate md5sum of installed pacakges
  rpm_inventory=`rpm -qa |sort|md5sum|cut -d '-' -f 1`.to_s.chomp
  Facter.add('rpm_inventory') do
    setcode do
      rpm_inventory
    end
  end
end
