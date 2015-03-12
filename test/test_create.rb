require "test/unit"
 
class TestCreateSimulator < Test::Unit::TestCase

  attr_reader :created_id

  TEST_SIM_NAME = "Simulator Test Simulator"

  def setup
    @created_id = `./simulator create "#{TEST_SIM_NAME}" iPhone-5s iOS-8-2`
  end

  def teardown
    # It takes a moment to be created, so we can't delete it too quickly
    sleep 2
    cleaned_up = system("./simulator destroy #{created_id}")
    assert cleaned_up, "Did not clean up simulator! Run: xcrun simctl delete #{created_id}"
    @created_id = nil
  end
 
  def test_create_then_find
    assert_match /\h{7}-\h{4}-\h{4}-\h{4}-\h{12}\n/, created_id
    # Because there's a lot of file moving to get one of these created,
    # we'll test "find" here as well.
    found_id = `./simulator find "#{TEST_SIM_NAME}"`
    assert_equal found_id, created_id, "Unable to find simulator #{created_id}, found: #{found_id} instead"
  end
 
end
