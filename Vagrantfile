Vagrant.configure('2') do |config|

  config.vm.box = 'ubuntu/xenial64'

  config.vm.network 'private_network', ip: '192.168.100.10'
  config.vm.network 'forwarded_port', guest: 9292, host: 9292
  config.vm.network 'forwarded_port', guest: 15672, host: 15672

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'events-demo'
  end

  # install docker
  config.vm.provision :docker

  # install docker-compose
  config.vm.provision :shell, inline: <<-BASH
    sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) \
              -o /usr/local/bin/docker-compose &&
    sudo chmod +x /usr/local/bin/docker-compose
  BASH

end