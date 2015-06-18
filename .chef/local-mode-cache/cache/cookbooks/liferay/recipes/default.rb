#
# Cookbook Name:: liferay
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "java"
include_recipe "tomcat"

apt_package "unzip" do
  action :install
end


directory "/usr/share/tomcat7/lib/ext" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

%w[ /usr/share/liferay /usr/share/liferay/tmp ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
  end
end

remote_file "/usr/share/tomcat7/lib/ext/support-tomcat.jar" do
  source "http://search.maven.org/remotecontent?filepath=com/liferay/portal/support-tomcat/6.2.1/support-tomcat-6.2.1.jar"
end

remote_file "/var/lib/tomcat7/webapps/liferay-portal.war" do
  source "http://superb-dca2.dl.sourceforge.net/project/lportal/Liferay%20Portal/6.2.3%20GA4/liferay-portal-6.2-ce-ga4-20150416163831865.war"
end


remote_file "/usr/share/tomcat7/lib/ext/mail.jar" do
  source "https://maven.java.net/content/repositories/releases/com/sun/mail/javax.mail/1.5.3/javax.mail-1.5.3.jar"
end 

remote_file "dependency archive" do
  path "/usr/share/liferay/tmp/dependencies.zip"
  source "http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.3%20GA4/liferay-portal-dependencies-6.2-ce-ga4-20150416163831865.zip/download"
end

remote_file "/usr/share/tomcat7/lib/ext/jta.jar" do
  source "http://central.maven.org/maven2/javax/transaction/jta/1.1/jta-1.1.jar"
end




execute "unzip /usr/share/liferay/tmp/dependencies.zip -d /usr/share/liferay/tmp/" do 
 not_if {File.exists?('/usr/share/liferay/tmp/liferay-portal-dependencies-6.2-ce-ga4/hsql.jar')} 
end

execute "copy dependencies" do
 command "cp /usr/share/liferay/tmp/life*/*.jar /usr/share/tomcat7/lib/ext/"
 not_if {File.exists?('/usr/share/tomcat7/lib/ext/hsql.jar')}
end

cookbook_file "activation.jar" do
  path "/usr/share/tomcat7/lib/ext/activation.jar"
  action :create_if_missing
end

cookbook_file "ccpp.jar" do
  path "/usr/share/tomcat7/lib/ext/ccpp.jar"
  action :create_if_missing
end

cookbook_file "jms.jar" do
  path "/usr/share/tomcat7/lib/ext/jms.jar"
  action :create_if_missing
end

cookbook_file "jta.jar" do
  path "/usr/share/tomcat7/lib/ext/jta.jar"
  action :create_if_missing
end

cookbook_file "jtds.jar" do
  path "/usr/share/tomcat7/lib/ext/jtds.jar"
  action :create_if_missing
end

cookbook_file "junit.jar" do
  path "/usr/share/tomcat7/lib/ext/junit.jar"
  action :create_if_missing
end

cookbook_file "persistence.jar" do
  path "/usr/share/tomcat7/lib/ext/persistence.jar"
  action :create_if_missing
end

cookbook_file "jutf7.jar" do
  path "/usr/share/tomcat7/lib/ext/jutf7.jar"
  action :create_if_missing
end

bash "copyExtTolib" do
 code  "cp /usr/share/tomcat7/lib/ext/*.* /usr/share/tomcat7/lib"
 not_if {File.exists?('/usr/share/tomcat7/lib/jutf7.jar')}
end

template "/etc/tomcat7/Catalina/localhost/ROOT.xml" do
  source "ROOT.xml.erb"
  mode '0777'
  owner 'root'
  group 'root'
end
