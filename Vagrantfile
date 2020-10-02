Vagrant.configure("2") do |config|
  # Jenkins server
  config.vm.define "jenkins-pipeline" do |jenkins|
    jenkins.vm.box = "ubuntu/bionic64"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.box_url = "ubuntu/bionic64"
    jenkins.vm.network :private_network, ip: "192.168.100.20"
    jenkins.vm.provider :VirtualBox do |v|
      v.customize["modifyvm" , :id, "--natdnshostresolver1" , "on"]
      v.customize["modifyvm" , :id, "--memory", 3072]
      v.customize["modifyvm" , :id, "--name", "jenkins-pipeline"]
      v.customize["modifyvm" , :id, "--cpus", 2]
      v.customize["modifyvm",  :id, "--audio", "none"] #Resous un probleme de demarrage de ma vm
    end
    config.vm.provision :shell ,path: "sshconf.sh"
    jenkins.vm.provision :shell ,path: "install_jenkins.sh"
  end        


  # serveur de dev 
  config.vm.define "srvdev-pipeline" do |srvdev|
    srvdev.vm.box = "ubuntu/bionic64"
    srvdev.vm.hostname = "srvdev-pipeline"
    srvdev.vm.box_url = "ubuntu/bionic64"
    srvdev.vm.network :private_network, ip: "  "
    srvdev.vm.provider :VirtualBox do |v|
      v.customize["modifyvm" , :id, "--natdnshostresolver1" , "on"]
      v.customize["modifyvm" , :id, "--memory", 512]
      v.customize["modifyvm" , :id, "--name", "srvdev-pipeline"]
      v.customize["modifyvm" , :id, "--cpus", 1]
      v.customize["modifyvm",  :id, "--audio", "none"] #Resous un probleme de demarrage de ma vm
    end
    config.vm.provision "shell" ,path: "sshconf.sh"
  end  

  # serveur de stagging (pre-prod) 
  config.vm.define "srvstag-pipeline" do |srvstag|
    srvstag.vm.box = "ubuntu/bionic64"
    srvstag.vm.hostname = "srvstag-pipeline"
    srvstag.vm.box_url = "ubuntu/bionic64"
    srvstag.vm.network :private_network, ip: "192.168.100.22"
    srvstag.vm.provider :VirtualBox do |v|
      v.customize["modifyvm" , :id, "--natdnshostresolver1" , "on"]
      v.customize["modifyvm" , :id, "--memory", 512]
      v.customize["modifyvm" , :id, "--name", "srvstag-pipeline"]
      v.customize["modifyvm" , :id, "--cpus", 1]
      v.customize["modifyvm",  :id, "--audio", "none"] #Resous un probleme de demarrage de ma vm
    end
    config.vm.provision "shell" ,path: "sshconf.sh"
  end 

   # serveur de prod (prod) 
  config.vm.define "srvprod-pipeline" do |srvprod|
    srvprod.vm.box = "ubuntu/bionic64"
    srvprod.vm.hostname = "srvprod-pipeline"
    srvprod.vm.box_url = "ubuntu/bionic64"
    srvprod.vm.network :private_network, ip: "192.168.100.23"
    srvprod.vm.provider :VirtualBox do |v|
      v.customize["modifyvm" , :id, "--natdnshostresolver1" , "on"]
      v.customize["modifyvm" , :id, "--memory", 512]
      v.customize["modifyvm" , :id, "--name", "srvprod-pipeline"]
      v.customize["modifyvm" , :id, "--cpus", 1]
      v.customize["modifyvm",  :id, "--audio", "none"] #Resous un probleme de demarrage de ma vm
    end
    config.vm.provision "shell" ,path: "sshconf.sh"
  end 

     # serveur de bdd (bdd) 
    config.vm.define "srvbdd-pipeline" do |srvbdd|
      srvbdd.vm.box = "ubuntu/bionic64"
      srvbdd.vm.hostname = "srvbdd-pipeline"
      srvbdd.vm.box_url = "ubuntu/bionic64"
      srvbdd.vm.network :private_network, ip: "192.168.100.24"
      srvbdd.vm.provider :VirtualBox do |v|
        v.customize["modifyvm" , :id, "--natdnshostresolver1" , "on"]
        v.customize["modifyvm" , :id, "--memory", 512]
        v.customize["modifyvm" , :id, "--name", "srvbdd-pipeline"]
        v.customize["modifyvm" , :id, "--cpus", 1]
        v.customize["modifyvm",  :id, "--audio", "none"] #Resous un probleme de demarrage de ma vm
      end
      config.vm.provision "shell" ,path: "sshconf.sh"
      config.vm.provision "shell" ,path: "install_mariadb.sh"
    end 

       # serveur gitlab 
       config.vm.define "gitlab-pipeline" do |gitlab|
        gitlab.vm.box = "ubuntu/bionic64"
        gitlab.vm.hostname = "gitlab-pipeline"
        gitlab.vm.box_url = "ubuntu/bionic64"
        gitlab.vm.network :private_network, ip: "192.168.100.25"
        gitlab.vm.provider :VirtualBox do |v|
          v.customize["modifyvm" , :id, "--natdnshostresolver1" , "on"]
          v.customize["modifyvm" , :id, "--memory", 4096]
          v.customize["modifyvm" , :id, "--name", "gitlab-pipeline"]
          v.customize["modifyvm" , :id, "--cpus", 2]
          v.customize["modifyvm",  :id, "--audio", "none"] #Resous un probleme de demarrage de ma vm
        end
        config.vm.provision "shell" ,path: "sshconf.sh"
        #config.vm.provision "shell" ,path: "install_gitlab.sh"
      end
end
