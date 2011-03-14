# TODO: FIX deployment['description'] to not double escape \n
module Cpk
  def self.create_deployments(deps)
    deps.each do |dep|
      if @options[:destroy]
        d = Deployment.find(:first) { |x| x.nickname =~ /#{dep['nickname']}/ }
        d.destroy unless @debug || d.nil?
      else
        Deployment.create(dep) unless @debug
      end
        puts dep.inspect if @debug
      end
  end
end

