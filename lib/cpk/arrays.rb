module Cpk
	def self.create_arrays(arrays)
	fix = Array.new
	fix = %w{ min_count max_count resize_up_by resize_down_by resize_calm_time }
	h = Hash.new
		arrays.each do |array|
		fix.each do |k|
			h[k] = array[k]
		end
			array['elasticity'] = h
		end
	end
end

