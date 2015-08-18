require 'sinatra'
require 'byebug'

set :bind, '0.0.0.0'
set :port, 3002

get %r{/access/services/1106/repo/repoindex.xml} do
  content_type 'text/xml'
  File.read('./services/SLES_12_x86_64.xml') 
end
