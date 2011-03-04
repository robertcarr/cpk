module Cpk
	def self.create_credentials(creds)
		creds.each do |cred|
		if @options[:destroy]
			c = Credential.find(:first) { |x| x.name =~ /#{cred["name"]}/ }
			c.destroy unless @debug
		else
			Credential.create(cred) unless @debug
		end
			puts cred.inspect if @debug
		end
	end
end

