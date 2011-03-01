module Cpk
	def self.create_securitygroups(groups)
		groups.each do |group|
			Ec2SecurityGroup.create(group) unless @debug
			puts group.inspect if @debug
		end
	end
end

