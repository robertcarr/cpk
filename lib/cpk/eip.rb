module Cpk
	def self.create_eips(eips)
		eips.each do |eip|
			Ec2ElasticIp.create(eip) unless @debug
			puts eip.inspect if @debug
		end
	end
end

