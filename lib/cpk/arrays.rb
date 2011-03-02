module Cpk
	def self.create_arrays(arrays)
	fix = Array.new
	fix = %w{ min_count max_count resize_up_by resize_down_by resize_calm_time decision_threshold }
	h = Hash.new

		arrays.each do |array|
			array['deployment_href'] = deployment_href_by_name(array['deployment_href'])

			fix.each do |k|
				h[k] = array[k]
			end
			array['elasticity'] = h
			Ec2ServerArray.create(array) unless @debug

		end
	end
end

