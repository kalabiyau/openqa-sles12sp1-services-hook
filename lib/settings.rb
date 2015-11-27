configure do
  set :bind, '0.0.0.0'
  set :port, 3000
  set :logging, false
  logger = Logger.new STDOUT
  logger.level = Logger::INFO
  logger.datetime_format = '%a %d-%m-%Y %H:%M '
  set :logger, logger
  logger << BANKSY
end
