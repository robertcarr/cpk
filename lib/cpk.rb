require 'cpk/cpk.rb'


module Cpk
@username = 'robert@rightscale.com'
@password = 'l@ss3ndr1v3'
@session = GoogleSpreadsheet.login(@username, @password)
@worksheet = @session.spreadsheet_by_key("tY3KyQ3heFR8_pLCIDa5mxA").worksheets[0]
@sections = %w{ deployments servers arrays ssh s3 sg}

create_credentials(extract("credentials"))
end

