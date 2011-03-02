module Cpk
	def self.create_servers(servers)
		servers.each do |server|
		case server
			when server['deployment_href'] : puts "deployment"
		end

		#	Server.create(server) uinless @debug
			puts server.inspect if @debug
		end
	end
end

