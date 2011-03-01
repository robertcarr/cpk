
module Cpk
def self.extract(group)
row_array = Array.new

	for row in 1..@worksheet.num_rows
		if @worksheet[row,1].downcase == group
			offset = 1
			headers = @worksheet.rows[row] # Defaults to non-zero array
				until ( @worksheet.rows[row + offset][1].empty? )
				row_hash = Hash.new
					row_data =  @worksheet.rows[row+offset]
					row_data.each_index do |x|
						row_hash[headers[x].downcase] = row_data[x] unless  (headers[x].empty? || row_data[x] == "")
					end
					row_array  << row_hash
					offset += 1
				end 
		end
	end
row_array
end
end





