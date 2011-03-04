# TODO: FIX deployment['description'] to not double escape \n
module Cpk
	def self.create_deployments(deps)
	puts "go"
		deps.each do |dep|
			if @options[:destroy]
				d = Deployment.find(:all) { |x| x.nickname =~ /#{dep['nickname']}/ }
				d.destroy unless @debug
			else
				Deployment.create(dep) unless @debug
			end
				puts dep.inspect if @debug
		end
	end
end

