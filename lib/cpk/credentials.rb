module Cpk
	def self.create_credentials(creds)
		creds.each do |cred|
		if @options[:destroy]
			c = Credential.find(:first) { |x| x.name =~ /#{cred["name"]}/ }
			c.destroy unless c.nil? || @debug
		else
			begin
			Credential.create(cred) unless @debug
			rescue
				puts "Error creating #{cred["name"]}"
			end

		end
			puts cred.inspect if @debug
		end
	end
end

