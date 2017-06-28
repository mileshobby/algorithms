require_relative '../dutch_flag_partition'

describe dutch_flag_partition do
  it "should partition array into thirds" do
    arr = [1,3,4,21,1,5,7,4,5,5,10]
    part = dutch_flag_partition(arr, 5)
    expect(part[0..4].all? {|el| el < 5}).to be_true
  end
end
