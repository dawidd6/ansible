Vagrant.configure("2") do |config|
    config.vm.box = "generic/ubuntu2204"

    # Prevent SharedFoldersEnableSymlinksCreate errors
    #config.vm.synced_folder ".", "/vagrant", disabled: true

    config.vm.provision "shell", path: "bootstrap.sh"

    # Run Ansible from the Vagrant VM
    config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "playbook.yml"
        ansible.install = false
        ansible.verbose = true
        ansible.limit = "all"
        ansible.inventory_path = "inventory"
    end
end
