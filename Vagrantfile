Vagrant.configure('2') do |config|

  config.vm.box = 'ubuntu/xenial64'

  config.vm.network 'private_network', ip: '192.168.100.10'
  config.vm.network 'forwarded_port', guest: 9292, host: 9292
  config.vm.network 'forwarded_port', guest: 15672, host: 15672

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'events-demo'
  end

  config.vm.provision :docker
  config.vm.provision :docker_compose, rebuild: true, run: 'always', yml: '/vagrant/docker-compose.yml'

end