module Cpk
	def self.create_elb(objects)
	options = Hash.new
		objects.each do |elb_row|
#		elb_row['region'].exists? ? options['region'] = elb_row['region'] : options.delete
			elb = Fog::AWS::ELB.new(options)
			zones = elb_row['zones'].split(",")
			puts zones.inspect
			listeners = [ { "Protocol" => elb_row['protocol'], "LoadBalancerPort" => elb_row['loadbalancerport'], "InstancePort" => elb_row['instanceport'] } ]
			puts listeners.inspect
			elb.create_load_balancer(zones, elb_row['lb_name'], listeners) unless @debug
			puts elb_row.inspect
	end
	end

end
