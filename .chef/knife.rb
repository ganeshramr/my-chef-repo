current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "ganesh"
client_key               "#{current_dir}/ganesh.pem"
validation_client_name   "ofs2-validator"
validation_key           "#{current_dir}/ofs2-validator.pem"
chef_server_url          "https://mychefserver/organizations/ofs2"
syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntaxcache"
cookbook_path            ["#{current_dir}/../cookbooks"]
