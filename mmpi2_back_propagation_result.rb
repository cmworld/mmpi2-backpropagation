class MMPI2BackPropagationResult
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def to_s
		"Real: #{@real}, Value: #{@value}"
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(output)
		@real = output
		@value = to_number(output)
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_reader :real, :value

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def to_number(a_value)
		BinaryConverter.instance.binary_array_to_number a_value
	end

end