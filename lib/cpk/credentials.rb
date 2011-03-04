module Cpk
	def self.create_credentials(creds)
		creds.each do |cred|
		if @options[:destroy]
			c = Credential.find(:first) { |x| x.name =~ /#{cred["name"]}/ }
			sleep 0.5
			puts c.inspect
			c.destroy unless c.nil? || @debug
			sleep 0.5
		else
			begin
			Credential.create(cred) unless @debug
			rescue
			puts "Error creating #{cred["name"]}.  Already exists?"
			end
		end
			puts cred.inspect if @debug
		end
	end
end

