require 'em-proxy'
require 'http/parser'
require 'byebug'

host = '127.0.0.1'
port = 3001
puts "listening on #{host}:#{port}..."

Proxy.start(host: '127.0.0.1', port: 3001) do |conn|
  conn.server :srv, host: '127.0.0.1', port: 3000

  conn.on_data do |data|
    data
  end

  conn.on_response do |_, resp|
    resp.gsub(/suse/, 'zuze')
    # TODO: handle service json
    # TODO: handle repoindex.xml
  end
end
