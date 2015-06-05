current_dir = File.dirname(__FILE__)
log_level                :debug
log_location             STDOUT
node_name                "admin"
client_key               "#{current_dir}/admin.pem"
validation_client_name   'chef-validator'
validation_key           "#{current_dir}/chef-validator.pem"
chef_server_url		"https://192.168.1.101"
cookbook_path ["#{current_dir}/../cookbooks"]
ssl_verify_mode :verify_none

knife[:opennebula_username] = "oneadmin"

knife[:opennebula_password] = "yib4OquafUp1"

knife[:opennebula_endpoint] = "http://192.168.1.100:2633/RPC2"
