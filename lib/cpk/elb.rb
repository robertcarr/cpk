module Cpk
	def self.create_elb(objects)
	options = Hash.new
		objects.each do |elb_row|
			elb = Fog::AWS::ELB.new
			zones = elb_row['zones'].split(",")
			listeners = [ { "Protocol" => elb_row['protocol'], "LoadBalancerPort" => elb_row['loadbalancerport'], "InstancePort" => elb_row['instanceport'] } ]
			elb.create_load_balancer(zones, elb_row['lb_name'], listeners) unless @debug
	end
	end

end
