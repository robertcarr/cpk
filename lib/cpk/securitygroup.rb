module Cpk
	def self.create_securitygroups(groups)
		groups.each do |group|
		if @options[:destroy]
			g = Ec2SecurityGroup.find(:first) { |x| x.aws_group_name =~ /#{group["aws_group_name"]}/ }
			g.destroy unless @debug
		else
			Ec2SecurityGroup.create(group) unless @debug
		end
		puts group.inspect if @debug
		end
	end
end

