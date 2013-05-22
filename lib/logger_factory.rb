require "logger"

class LoggerFactory
	include Singleton

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	attr_reader :logger

	# ----------------------------------------------------------------------------
	# Initializer
	# ----------------------------------------------------------------------------
	def initialize
		@logger = Logger.new LOGGER_FILE_NAME
	end	
end