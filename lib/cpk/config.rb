module Cpk
	def self.account?
		@worksheet[4,2]
	end
		
	def self.debug?
		@debug = @worksheet[5,2] || "False"
	end
end

