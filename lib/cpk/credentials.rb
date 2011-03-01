module Cpk
	def self.create_credentials(creds)
		creds.each do |cred|
			Credential.create(cred)
		end
	end
end

