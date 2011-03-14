require 'optparse'
require 'json'

module Cpk

@options = Hash.new

def self.readopts
optparse = OptionParser.new	do |opts|
opts.banner = "Usage: cpk [options]"

# TODO: Finish error checking options
@options[:debug] = false
opts.on('-x','--debug','Debug mode/dry-run') do 
@options[:debug] = true
end
@options[:show] = nil
opts.on('-s','--show SECTION','Show data for a SECTION in worksheet') do |section|
@options[:show] = section
end
@options[:destroy] = nil
opts.on('-d', '--destroy SECTION', 'Destroy (delete) a section') do |section|
@options[:destroy] = section
end
@options[:create] = nil
opts.on('-c','--create [SECTION|all]','Create specific section') do |section|
@options[:create] = section
end
@options[:line] = nil
opts.on('-l', '--line LINE', 'Apply changes to this line only') do |line|
@options[:line] = line
end
@options[:key] = nil
opts.on("-k", "--key KEY", "Spreadsheet KEY overrides config") do |key|
@options[:key] = key
end
@options[:worksheet] = nil
opts.on("-w", "--worksheet SHEET", "Specify worksheet to use ## TODO ##") do |worksheet|
@options[:worksheet] = worksheet
end
@options[:username] = nil
opts.on("-u", "--user USER", "Google docs user name") do |user|
@options[:username] = user
end
@options[:password] = nil
opts.on("-p", "--password PASSWORD", "Google docs password") do |password|
@options[:password] = password
end
@options[:pdf] = nil
opts.on("-f","--pdf", "Create PDF of configuration") do
@options[:pdf] = true
end



opts.on('-h','--help','Display this screen') do	
puts opts
exit
end
end
optparse.parse!
end

readopts

# TODO: Add support for muliple "tabs" in spreadsheet
@config = JSON::parse(IO.read("/root/.cpk/cpk-config"))
@username = @config['username']
@password = @config['password']
@google_key = @options[:key] ||= @config['key']
@session = GoogleSpreadsheet.login(@username, @password)
@worksheet = @session.spreadsheet_by_key(@google_key).worksheets[0]
@debug = @options[:debug]

end

