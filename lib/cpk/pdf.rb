require 'rubygems'
require 'prawn'

module Cpk
  def self.create_pdf
  pdf = Prawn::Document.new
  servers = extract("servers")
  servers.each do |x|
  pdf.text(x['nickname'])
  pdf.text(x['server_template_href'])
  pdf.text(x['instance_type'])
  end

  pdf.text("tester")
  pdf.render_file("doc.pdf")
  end
end



