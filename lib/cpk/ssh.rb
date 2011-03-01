module Cpk
	def self.create_ssh(keys)
		keys.each do |key|
			Ec2SshKey.create(key)
		end
	end
end

