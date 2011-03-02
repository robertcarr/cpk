module Cpk
	def self.deploymentinputs(inputs)
		inputs.each do |input|
			d = Deployment.find(:all).select { |x| x.nickname.match(input['deployment']) }
			puts d.inspect
			d[0].set_input(input['input'], input['value']) unless @debug
		puts input.inspect if @debug
		end
	end
end


