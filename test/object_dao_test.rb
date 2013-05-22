require "test/unit"
require "helper"

class ObjectDaoTest < Test::Unit::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_save
		# Prepare...
		FileUtils.delete DAO_FILE_NAME
		tests = MMPI2Generator.instance.generate 2
	
		# Perform...
		@target.save tests

		# Assert...
		assert File.exist?(DAO_FILE_NAME)
	end

	def test_load
		# Prepare...
		@target.save(MMPI2Generator.instance.generate 1)

		# Perform...
		tests = @target.load
	
		# Assert...
		assert_not_nil tests
	end

	def setup
		@target = ObjectDao.new DAO_FILE_NAME
	end
end