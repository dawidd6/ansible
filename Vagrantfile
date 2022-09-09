Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"

    # Prevent SharedFoldersEnableSymlinksCreate errors
    #config.vm.synced_folder ".", "/vagrant", disabled: true

    config.vm.provision "shell", path: "bootstrap.sh"

    # Run Ansible from the Vagrant VM
    config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "playbook.yml"
        ansible.install = false
    end
end
