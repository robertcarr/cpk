module Cpk
	def	self.serverinputs(servers)
#TODO: FIX THE Interation names too confusing
		servers.each do |specific_server|
			d = Deployment.find(:first) { |x| x.nickname.match(specific_server['deployment']) }
			d['servers'].each do |deployment_server|
				if deployment_server['nickname'] == specific_server['nickname']
					href = deployment_server['href']
					id = href[/\d+$/].to_i
					s = Server.find(id)
					s.set_input(specific_server['input'], specific_server['value']) unless @debug
				end

			end
		end
	end
end

