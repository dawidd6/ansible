# frozen_string_literal: true

Vagrant.configure('2') do |config|
  config.vm.box = 'debian/buster64'
  config.vm.boot_timeout = 600
  config.vm.network 'public_network'
  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'rpi3.yml'
  end
  config.vm.provider 'virtualbox' do |vb|
    vb.gui = false
    vb.memory = '2048'
    vb.cpus = 2
    vb.customize ['modifyvm', :id, '--uart1', '0x03f8', '4']
    vb.customize ['modifyvm', :id, '--uartmode1', 'file', '/dev/null']
  end
end
