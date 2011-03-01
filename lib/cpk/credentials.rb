module Cpk
	def self.create_credentials(creds)
		creds.each do |cred|
			Credential.create(cred) unless @debug
			puts cred.inspect if @debug
		end
	end
end

