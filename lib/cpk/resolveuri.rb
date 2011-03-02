module Cpk

	def self.uri?(href)
	return true if href.match(/^http/)
	end
	
	def	self.deployment_href_by_name(deployment)
		dep = Deployment.find(:all).select { |x| x.nickname.match(deployment) } 
		dep[0]['href']
	end

	def self.template_href_by_name(name)
		st = ServerTemplate.find(:all).select { |x| x.nickname.match(name) }
		st[0]['href']
	end

end

