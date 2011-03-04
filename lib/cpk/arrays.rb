module Cpk
	def self.create_arrays(arrays)
	fix = Array.new
	fix = %w{ min_count max_count resize_up_by resize_down_by resize_calm_time decision_threshold }
	h = Hash.new
		arrays.each do |array|
		puts array.inspect if @debug

		if @options[:destroy]
			id = array_id_by_name(array['nickname'])
			a = Ec2ServerArray.find(id)
			a.destroy unless @debug
		else
			array['deployment_href'] = deployment_href_by_name(array['deployment_href'])
			array['server_template_href'] = template_href_by_name(array['server_template_href'], array['version'])
			array['ec2_security_groups_href'] = security_group_href_by_name(array['ec2_security_groups_href'])

			fix.each do |k|
				h[k] = array[k]
			end
			array['elasticity'] = h
			Ec2ServerArray.create(array) unless @debug
		end
		end
	end
end

