
module Cpk
def self.extract(group)
row_array = Array.new
  for row in 1..@worksheet.num_rows
    if @worksheet[row,1].downcase == group.downcase
      offset = 1
      headers = @worksheet.rows[row] # Defaults to non-zero array
      until ( @worksheet.rows[row + offset][0].empty? || @worksheet.rows[row + offset][0].match(/^ +/) )
        row_hash = Hash.new
# Allow user to specify exact spreadsheet row to extract
        @options[:line] ? row_data = @worksheet.rows[@options[:line].to_i - 1] : row_data = @worksheet.rows[row+offset]
        puts row_data.inspect if @debug
        headers.each_index do |x|
        row_hash[headers[x].downcase] = row_data[x] unless  (headers[x].empty? || row_data[x] == "" || row_data[x] =~ /^ / )
        end
        row_array  << row_hash
        offset += 1
        break if @options[:line]
      end 
    end
  end
row_array
end
end





