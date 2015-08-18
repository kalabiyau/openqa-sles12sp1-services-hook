require 'sinatra'
require 'byebug'

set :bind, '0.0.0.0'
set :port, 3002

get %r{/access/services/(.*)/repo/repoindex.xml} do |service_name|
  content_type 'text/xml'
  File.read("./services/#{service_name}.xml") 
end
