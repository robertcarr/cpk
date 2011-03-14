module Cpk
  def self.create_servers(servers)
    servers.each do |server|
# Normalize server_template API call
# Server Template
    puts server.inspect if @debug
    st = template_href_by_name(server['server_template_href'], server['version'])
    server['server_template_href'] = st
    server['deployment_href'] = deployment_href_by_name(server['deployment_href'])
    server['ec2_security_groups_href'] = security_group_href_by_name(server['ec2_security_groups_href'])
    Server.create(server) unless @debug
    end
  end
end

