module Cpk
	def self.create_servers(servers)
		servers.each do |server|
# Normalize server_template API call
# Server Template
			st = template_href_by_name(server['server_template_href'])
			server['server_template_href'] = st
# ST href f
#				templateid = server['server_template_href'].match(/\d+$/)
#			server['server_template_href'] = Server.connection.settings[:api_url] + "/server_templates/#{templateid}"
# Search deployment on name
			server['deployment_href'] = deployment_href_by_name(server['deployment_href'])

			Server.create(server) unless @debug
			puts server.inspect if @debug
		end
	end
end

