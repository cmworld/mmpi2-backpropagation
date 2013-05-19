class MMPI2BackPropagation
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def train(tests, a_max_error = NetConfiguration::MAX_ERROR)
		count = 1
		previous_error = 5
		error = 0
		begin
			tests.each {|a_test| error = @net.train(a_test.answers_array,to_binary_array(a_test.depression_level)) }
			puts "Train #{count} => Error: #{error}..."
			count+=1

			if count % 20 == 0
				puts "Check Error => Previous: #{previous_error}, Actual: #{error}"
				if previous_error+0.2 < error
					break
				end
				previous_error = error
			end

		end while error >= a_max_error 
  end

	def results_of(a_test)
	  MMPI2BackPropagationResult.new @net.eval(a_test.answers_array)
	end

	def reset
		@net = Ai4r::NeuralNetwork::Backpropagation.new(@neuron_levels)
		@net.learning_rate = @learning_rate
		@net.momentum = @momentum
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_writer :neuron_levels, :momentum, :learning_rate

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def to_binary_array(a_value)
		BinaryConverter.instance.number_to_binary_array a_value, 5
	end

	def to_number(a_value)
		BinaryConverter.instance.binary_array_to_number a_value
	end

  # -------------------------------------------------------------------------
  # Initialize...
  # -------------------------------------------------------------------------
  def initialize(neuron_levels = [32,32,5], a_learning_rate = 0.25, a_momentum = 0.1)
  	@neuron_levels = neuron_levels
  	@momentum = a_momentum
  	@learning_rate = a_learning_rate
		reset
  end

	def self.new_configured
		MMPI2BackPropagation.new NetConfiguration::NEURON_LEVELS, NetConfiguration::LEARNING_RATE, NetConfiguration::MOMENTUM
	end
end
