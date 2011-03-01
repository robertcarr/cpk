module Cpk
	def self.create_ssh(keys)
		keys.each do |key|
			Ec2SshKey.create(key) unless @debug
			puts key.inspect if @debug
		end
	end
end

