require 'sinatra'
require 'logger'
require 'byebug'
require 'securerandom'

require_relative 'lib/tagline'
require_relative 'lib/settings'
require_relative 'lib/request'
require_relative 'lib/helpers'

def tell_secrets(request)
  # TODO: logger is not thread useful
  # with applied concurrency it will scatter log lines everywhere as they been served by different threads
  req_uuid = SecureRandom.uuid
  logger.info("Warping: #{req_uuid}")
  logger.info(request.host)
  logger.info(request.url)
  logger.info(request.headers)
  logger.info('Params: ' + request.params.to_s)
  logger.info("Closing: #{req_uuid}")
end

get %r{.*} do
  tell_secrets(request)
end

post %r{.*} do
  tell_secrets(request)
end
