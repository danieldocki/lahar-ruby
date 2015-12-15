require_relative '../../test_helper'

describe Lahar do
  it "must be defined" do
    Lahar::VERSION.wont_be_nil
  end
end
