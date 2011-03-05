# Complete PS Killer
# Automating Professional Services
# Robert Carr
# robert@rightcale.com
#

require 'cpk/cpk.rb'
require 'pp'

module Cpk

# Listed in order of execution. Certain tasks need to happen before others so be careful
sections = %w{ credentials ssh securitygroups eip s3 deployments servers deploymentinputs serverinputs arrays elb }

if @options[:show] && sections.include?(@options[:show])
  pp extract(@options[:show])
else
  puts "Valid choices are: "
  sections.each { |x| puts x }
end

@options[:destroy] ? task = @options[:destroy] : task = @options[:create]

if task == 'all'
  sections.each do |section|
    data = extract(section)
    send "create_#{section}".to_sym, data
  end
elseif task != nil
  data = extract(task)
  send "create#{section}".to_sym, data
end

end


