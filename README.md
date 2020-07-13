# Ansible and Infrastructure as code

This lecture we will look at:
- IAC (Infrastructure as code)
- Configuration Management tools
- What is Ansible?
- Why Ansible

- Installing Ansible
- Create a multi environment setup
- use Ansible to configure the environments
- File structures and Ansible
- Adhock commands
- Playbooks

### Infrastructure as code
- Setting up infrastructure with code as opposed to clicking away
- have a source code that is more robust than isolated scripts

### Configuration Management tools
Tools that put IAC into practice along with orchestration tools.

Configuration Management tools include:
- Chef
- Puppet
- Ansible

### Orchestration tools
These tools aim more to configure the  networking and deployment at scale
These tools include:
- Ansible
- Terraform (Hashicorp)
- Other

### Ansible  - simply Put
Ansible is a high level language for dealing with powershell vs bash environments. For dealing with different package managers. And generally abstraction the most used commands and operations in provision so that you become more infrastructure agnostic. It is also open source(low cost/ free). Built on python.

4 pillars of dev ops:
--> Flexibility ,  Ease of use, robustness and cost
- free
- Allows us to become infrastructure agnostic
- Because of IAS and Configuration management tool it increases robustness
- Easier to use due to being a high level language (easier to understand - just set up a YML file for your playbooks)

It allows for a multi and hybrid-cloud-premises-environment management (orchestration)

Allows us to setup and track seever machines. Example:
- webserver
- db
- aws

### Installing ansible
- On windows, get a VM and install it.
- On mac, use python.


### Ansible Demo
Objectives:
Emulate a real environment. Create 3 machines and use ansible to manage

### Why do we use Ansible instead of normal provisioning?
### Ansible controller:
	- Works similarly to a bastion
	- A single machine which acts as management machine to configure other machines.

	- How do we create a controller on windows?
		- Windows - linux sub-system
		- go to start bar, search "windows features" and enable windows subsystem for linux
		
### Setting up the VMs so you can ping all from ansible
On your ansible do ```ssh-keygen```
this creates a new pub key 
pass this to other VMs you'll be provisioning
and then on your ansible do ```ssh-copy-id root@192.168.10.x0```

#### Within one of your VMs (web/aws/db)
	- cd /etc/ssh
	- sudo nano sshd_config
	- uncomment and change "PermitRootLogin" to "PermitRootLogin yes"
	- change "PubKeyAuthentication" to  "PubKeyAuthentication yes" 
	- ```sudo service sshd restart```
#### Back in your ansible:
	- you should be able to ssh into it 
	- ```ansible all -m ping```
	- ```sudo ssh root@192.168.10.10```

