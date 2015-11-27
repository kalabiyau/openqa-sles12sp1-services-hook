class Sinatra::Request
  require 'json'
  def headers
    headers_hash = env.select{|k,v| k =~/\AHTTP_.*/}
    JSON.pretty_generate(headers_hash)
  end
end
