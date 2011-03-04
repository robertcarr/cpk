module Cpk

	def self.uri?(href)
	return true if href.match(/^http/)
	end
	
	def	self.deployment_href_by_name(deployment)
		dep = Deployment.find(:all).select { |x| x.nickname.match(deployment) } 
		dep[0]['href']
	end

	def self.template_href_by_name(name, version)
		puts name, version
		st = ServerTemplate.find(:first) { |x| x.nickname =~ /#{name}/i && x.version == version.to_i }
		puts st.inspect if @debug
		st['href']
	end

	def self.security_group_href_by_name(name)
		sg = Ec2SecurityGroup.find(:first) { |x| x.aws_group_name =~ /#{name}/ }
		sg['href']
	end

end

