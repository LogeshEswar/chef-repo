#
# Cookbook Name:: megam_preinstall
# Recipe:: default
#
# Copyright 2014, Megam Systems
#
# All rights reserved - Do Not Redistribute
#



  bash "SET IP in /etc/hosts" do
  user "root"
   code <<-EOH
	while read Iface Destination Gateway Flags RefCnt Use Metric Mask MTU Window IRTT; do
		[ "$Mask" = "00000000" ] && \
		interface="$Iface" && \
		ipaddr=$(LC_ALL=C /sbin/ip -4 addr list dev "$interface" scope global) && \
		ipaddr=${ipaddr#* inet } && \
		ipaddr=${ipaddr%%/*} && \
		break
	done < /proc/net/route

echo "$ipaddr localhost `hostname`" >> /etc/hosts
  EOH
end

=begin
template "/tmp/hosts.sh" do
  source "hosts.sh.erb"
  mode "0755"
end

execute "Add entry in /etc/hosts" do
  cwd "/tmp"  
  command "sh hosts.sh"
end
=end

case node[:platform]
when "ubuntu", "debian"

=begin
include_recipe "apt"

when "ubuntu"
execute "Build Essentials " do
  user "root"
  group "root"
  command "apt-get -y --force-yes install build-essential openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl1.0.0 libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion ruby2.0-dev"
end
=end

when "redhat", "centos", "fedora"
execute "yum -y groupinstall 'Development tools'"

end


