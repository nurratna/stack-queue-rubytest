require_relative '../car_wash.rb'

describe "CarWash" do 
	before :each do
    @cw = CarWash.new(3)
  end

  it "should be able to be initialized with a size" do
    expect(@cw.class.name).to eq("CarWash")
  end

  it "should have size" do
    expect(@cw.size).to eq(3)
  end	

  it "should have elements of matrix with - value" do
		expect(@cw.matrix).to eq([["-", "-", "-"], ["-", "-", "-"], ["-", "-", "-"]])
	end

	it "should be able to show elements of matrix" do
		expect(@cw.to_s).to eq("| - - - |\n| - - - |\n| - - - |\n")
	end

	context "car in" do
		it "should be able to push a car with empty space" do
			expect(@cw.push("A")).to eq("A")
		end

		it "should be able to push a car with empty space" do
			@cw.push("A")
			expect(@cw.to_s).to eq("| A - - |\n| - - - |\n| - - - |\n")
		end

		it "not should be able to push a car with full space" do
			@cw.push("A")
			@cw.push("B")
			@cw.push("C")
			@cw.push("D")
			@cw.push("E")
			@cw.push("F")
			@cw.push("G")
			@cw.push("H")
			@cw.push("I")
			expect(@cw.push("E")).to eq("parking space is full")
		end
	end

	context "car out" do
		it "should be able to wash the first car that comes" do
			@cw.push("A")
			@cw.push("B")
			@cw.push("C")
			@cw.push("D")
			@cw.washes
			@cw.washes
			expect(@cw.to_s).to eq("| - - C |\n| D - - |\n| - - - |\n")
		end

		it "should be able to push the first index when other car that comes after other car washes" do
			@cw.push("A")
			@cw.push("B")
			@cw.push("C")
			@cw.push("D")

			@cw.washes
			@cw.push("E")
			@cw.washes
			expect(@cw.to_s).to eq("| E - C |\n| D - - |\n| - - - |\n")
		end

		it "not should be able to wash if the parking space is empty" do
			expect(@cw.washes).to eq("parking space is empty")
		end
	end

	it "shoulde be able to display the order of next car wash"

	it "shoulde be able to display the history of car wash" do
		@cw.push("A")
		@cw.push("B")
		@cw.push("C")
		@cw.push("D")
		@cw.washes
		@cw.washes
		expect(@cw.washed_history).to eq(["A", "B"])
	end
end