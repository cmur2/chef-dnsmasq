
package "dnsmasq"

file "/etc/dnsmasq.conf" do
  content node.generate_dnsmasq_conf
  owner "root"
  group "root"
  mode 00644
  notifies :restart, 'service[dnsmasq]'
end

service "dnsmasq" do
  action [:enable, :start]
end
