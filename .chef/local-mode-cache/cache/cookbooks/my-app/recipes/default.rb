#
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'java'
include_recipe 'tomcat'

service "tomcat7" do
 action :stop
end

file "/var/lib/tomcat7/webapps/awesome.war" do
  content IO.read("/vagrant/awesome.war")
  action :create
end

service "tomcat7" do
 action :start
end
