module Cpk
	def	self.build(object)
		data = Cpk::extract(object)
		puts data.inspect
	end
end

		
