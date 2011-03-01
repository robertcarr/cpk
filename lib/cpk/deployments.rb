module Cpk
	def self.create_deployments(deps)
		deps.each do |dep|
			Deployment.create(dep)
		end
	end
end

