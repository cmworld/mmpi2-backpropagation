require "test/unit"
require "./helper"

class MMPI2BackPropagationTest < Test::Unit::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_results_of
		# Perform...
		@target.train MMPI2Generator.instance.generate(20), 100
		test = MMPI2Generator.instance.generate.first
		test.answer_yes_for_all_sentences

		# perform...
		result = @target.results_of test

		# Assert...
		assert result.value >= 17
		assert result.value <= 23
	end

	def setup
		@target = MMPI2BackPropagation.new_configured
	end

	def teardown
		@target.reset
	end
end