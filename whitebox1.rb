# Copyright (c) 2016 Computer Networks and Distributed Systems LABORAtory (LABORA).
# This proxy represents physical host machine.
#
module OmfRc::ResourceProxy::Whitebox
  include OmfRc::ResourceProxyDSL

  register_proxy :whitebox1

  utility :common_tools
  utility :ip

  property :if_name, :default => "eth0"
  property :tar_name, :default => "tar_name"
  property :rule_name, :default => "rule_name"

  #
  # Gets the :if_name property
  #
  request :if_name do |whitebox1|
    info 'Request(if_name) called'
    whitebox1.property.if_name
  end

  #
  # Gets the :ip_address of :if_name interface
  #
  request :ip_address do |whitebox1|
    info 'Request(ip_address) called'
    whitebox1.__send__("request_ip_addr")
  end

  #
  # Gets the :hostname
  #
  request :hostname do |whitebox1|
    info 'Request(hostname) called'
    hostname = whitebox1.execute_cmd("cat /etc/hostname").delete("\n")
    hostname
  end

  #
  # Configures the :if_name property
  #
  configure :if_name do |whitebox1, value|
    info 'Configure(if_name) called'
    whitebox1.property.if_name = value
    value
  end

  #
  # Configures the :ip_address of :if_name interface
  #
  configure :ip_address do |whitebox1, ip_address|
    info 'Configure(ip_address) called'
    whitebox1.__send__("configure_ip_addr", ip_address)
    ip_address
  end

  #
  # Configures the :hostname
  #
  configure :hostname do |whitebox1, hostname|
    info 'Configure(hostname) called'  
    whitebox1.execute_cmd("echo #{hostname} > /etc/hostname")
    hostname
  end

  #
  # Set the :tar_name
  #
  configure :tar_name do |whitebox1, value|
    info 'Configure(tar_name) called'
    whitebox1.property.tar_name = value
    whitebox1.property.tar_name
  end

  #
  # Set the :rule_name
  #
  configure :rule_name do |whitebox1, value|
    info 'Configure(rule_name) called'
    whitebox1.property.rule_name = value
    whitebox1.property.rule_name
  end

  #
  # Configure the :upload_tar
  #
  configure :upload_tar do |whitebox1, value|
    info 'Configure(upload_tar) called'
    whitebox1.execute_cmd("scp ec:/root/ec/#{whitebox1.property.tar_name} /home/vagrant/ovs/vswitchd").delete("\n")
    whitebox1.execute_cmd("tar -xzvf /home/vagrant/ovs/vswitchd/#{whitebox1.property.tar_name}").delete("\n")    
  value
  end

  #
  # Configure the :upload_rules
  #
  configure :upload_rules do |whitebox1, value|
    info 'Configure(upload_rules) called'
    whitebox1.execute_cmd("scp ec:/root/ec/#{whitebox1.property.rule_name} /tmp").delete("\n")
  value
  end

  #
  # Configure the :init_ovs
  #
  configure :init_ovs do |whitebox1, value|
    info 'Configure(init_ovs) called'
    whitebox1.execute_cmd("/home/vangrant/ovs/ovsdb/ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.soc --remote=db:Open_vSwitch,Open_vSwitch,manager_options --pidfile").delete("\n")
    whitebox1.execute_cmd("/home/vangrant/ovs/vswitchd/ovs-vswitchd --dpdk -c 0x1 -n 4 -- unix:/usr/local/var/run/openvswitch/db.sock --pidfile").delete("\n")
  end

  # Configure the :run_rules
  #
  configure :run_rules do |whitebox1, value|
    info 'Configure(run_rules) called'
    whitebox1.execute_cmd("home/vagrant/vagrant/examples/l2_switch.sh >> /tmp/result_whitebox1.txt").delete("\n")
    whitebox1.execute_cmd("scp /tmp/result_whitebox1.txt ec:/root").delete("\n")
  value
  end
end

