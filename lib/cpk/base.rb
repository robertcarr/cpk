module Cpk
	def	self.set_account(username, password, account)
		RightScale::Api::BaseExtend.class_eval <<-EOF
			@@connection.settings = {
				:user					=> username,
				:pass					=> password,
				:api_url			=> "https://my.rightscale.com/api/acct/#{account}",
				:common_headers => {
						"X_API_VERSION" => "1.0"
				}
			}
		EOF
	end
end




