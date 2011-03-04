module Cpk
	def	self.create_cloudfront(objects)
		cf = Fog::CDN.new(:provider => 'AWS')
	end
end

## TODO: Unfinished

