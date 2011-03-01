module Cpk
	def self.create_deployments(deps)
		deps.each do |dep|
			Deployment.create(dep) unless @debug
			puts dep.inspect if @debug
		end
	end
end

