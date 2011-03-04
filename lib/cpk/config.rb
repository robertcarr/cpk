require 'optparse'
require 'json'

module Cpk

@options = Hash.new

def self.readopts
optparse = OptionParser.new	do |opts|
opts.banner = "Usage: cpk [options] [<spreadsheet key>]"

@options[:debug] = false
opts.on('-x','--debug','Debug mode/dry-run') do 
@options[:debug] = true
end
@options[:show] = nil
opts.on('-s','--show SECTION','Show data for SECTION in worksheet') do |section|
@options[:show] = section
end
@options[:destroy] = nil
opts.on('-d', '--destroy SECTION', 'Destroy (delete) an section') do |section|
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
opts.on('-h','--help','Display this screen') do	
puts opts
exit
end
end
optparse.parse!
end

readopts

@config = JSON::parse(IO.read("../config.json"))
@username = @config['username']
@password = @config['password']
@google_key = @config['key'] ||= @options[:key]
@session = GoogleSpreadsheet.login(@username, @password)
@worksheet = @session.spreadsheet_by_key(@google_key).worksheets[0]

@debug = @options[:debug]


	def self.account?
		@worksheet[4,2]
	end
		
	def self.debug?
		@debug = @worksheet[5,2] || "False"
	end
end

