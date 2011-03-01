module Cpk
	def self.create_s3(buckets)
	s3 = Fog::Storage.new( :provider => 'AWS', :aws_access_key_id => Fog.credentials[:aws_access_key_id],
												 :aws_secret_access_key => Fog.credentials[:aws_secret_access_key] )
	buckets.each do |bucket|
		s3.directories.create(:key => bucket["name"])
	end
	end
end
