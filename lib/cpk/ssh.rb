module Cpk
	def self.create_ssh(keys)
		keys.each do |key|
		begin
			Ec2SshKey.create(key) unless @debug
		rescue
			puts "Error creating key #{key}. Does it already exist?"
		end
			puts key.inspect if @debug
		end
	end
end

