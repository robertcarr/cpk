require 'cpk/cpk.rb'


module Cpk
@username = 'robert@rightscale.com'
@password = 'l@ss3ndr1v3'
@session = GoogleSpreadsheet.login(@username, @password)
@worksheet = @session.spreadsheet_by_key("tY3KyQ3heFR8_pLCIDa5mxA").worksheets[0]
@debug = debug?
@debug = false


d= extract("deployments")
puts d[0]['description'].dump

exit
Deployment.create(d)
exit
#build("deployments")
create_deployments(extract("deployments"))
exit
create_ssh(extract("ssh"))
create_securitygroups(extract("securitygroup"))
create_credentials(extract("credentials"))
create_s3(extract("s3"))
end

