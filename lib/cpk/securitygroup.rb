module Cpk
	def self.create_securitygroups(groups)
		groups.each do |group|
		if @options[:destroy]
		begin
			g = Ec2SecurityGroup.find(:first) { |x| x.aws_group_name =~ /#{group["aws_group_name"]}/ }
			g.destroy unless @debug
		rescue
			puts "Error destroying #{group["aws_group_name"]}"
		end
		else
		begin
			Ec2SecurityGroup.create(group) unless @debug
		rescue
			puts "Error creating #{group["aws_group_name"]}.  Already exist?\n"
		end
		end
		puts group.inspect if @debug
		end
	end
end

