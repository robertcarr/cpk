module Cpk
	def self.create_deployments(deps)
		deps.each do |dep|
# TODO: FIX deployment['description'] to not double escape \n
			Deployment.create(dep) unless @debug
			puts dep.inspect if @debug
		end
	end
end

