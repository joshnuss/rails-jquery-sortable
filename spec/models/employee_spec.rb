require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Employee do
  before(:each) do
    @valid_attributes = {
      :department_id => 1,
      :name => "value for name",
      :title => "value for title",
      :position => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Employee.create!(@valid_attributes)
  end
end
