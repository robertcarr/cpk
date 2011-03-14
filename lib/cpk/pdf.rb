require 'rubygems'
require 'prawn'

module Cpk
  def self.create_pdf
headers = ""
data = ""
    servers = extract("servers")
    servers.each do |row|
x=0
      row.each do |item, val|
      headers << "#{item}\t" unless x
      data << "#{val}\t"
      end
x += 1
    end
puts headers
  end
end



