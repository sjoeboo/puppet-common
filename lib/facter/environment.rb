require 'puppet'
Facter.add('environment') do
  setcode do
    Puppet[:environment].to_s
  end
end
