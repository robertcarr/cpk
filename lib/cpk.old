require 'cpk/cpk.rb'

module Cpk
	def	self.execute(username, password, key)
		@debug = false
		@username = username
		@password = password
		@google_spreadsheet_key = key
		@session = GoogleSpreadsheet.login(@username, @password)
		@worksheet = @session.spreadsheet_by_key(@google_spreadsheet_key).worksheets[0]

		create_deployments(extract("deployments"))
		create_credentials(extract("credentials"))
		create_ssh(extract("ssh"))
		create_securitygroups(extract("security groups"))
		create_s3(extract("s3"))
		create_eips(extract("eip"))
		create_elb(extract("elb"))
		create_servers(extract("servers"))

		deploymentinputs(extract("deployment inputs"))
		serverinputs(extract("serverinputs"))
	end
end

username = 'robert@rightscale.com'
password = 'l@ss3ndr1v3'
key = "tY3KyQ3heFR8_pLCIDa5mxA"

Cpk::execute(username, password, key) 
