module Cpk
	def self.create_servers(servers)
		servers.each do |server|
# Normalize server_template API call
			templateid = server['server_template_href'].match(/\d+$/)
			server['server_template_href'] = Server.connection.settings[:api_url] + "/server_templates/#{templateid}"
# Search deployment on name


			Server.create(server) unless @debug
			puts server.inspect if @debug
		end
	end
end

