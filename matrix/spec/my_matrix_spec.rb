require_relative '../my_matrix.rb'

describe "MyMatrix" do
	before :each do
		@m = MyMatrix.new(2, 2)
	end

	it "should be able to be initialize with a row and column" do
		expect(@m.class.name).to eq("MyMatrix")
	end

	it "should have row" do
		expect(@m.row).to eq(2)
	end

	it "should have column" do
		expect(@m.column).to eq(2)
	end

	it "should have elements of matrix with nil value" do
		expect(@m.matrix).to eq([[nil, nil], [nil, nil]])
	end

	it "should be able to assign an element of matrix" do
		expect(@m[1, 1] = 1).to eq(1)
	end

	it "should be able to access an element of matrixs" do
		@m[1, 1] = 1
		expect(@m[1, 1]).to eq(1)
	end

	it "should be able to show elements of matrix" do
		@m[1, 1] = 1
		@m[1, 2] = 2
		@m[2, 1] = 3
		expect(@m.to_s).to eq("| 1 2 |\n| 3 - |\n")
	end

	context "multiplication" do
		before :each do 
			@m[1, 1] = 1
			@m[1, 2] = 2
			@m[2, 1] = 3
			@m[2, 2] = 4
		end

		it "should be able to do scalar multiplication to a matrix" do
			expect(@m * 2).to eq([[2, 4], [6, 8]])
		end

		it "should be able to do scalar multiplication to a matrix" do
			@m * 2
			expect(@m.to_s).to eq("| 2 4 |\n| 6 8 |\n")
		end
	end

	context "additions" do
		before :each do
			@m[1, 1] = 1
			@m[1, 2] = 2
			@m[2, 1] = 3
			@m[2, 2] = 4
		end

		it "should be able to do additions with same dimension and elements all number" do
			@m2 = MyMatrix.new(2, 2)
			@m2[1, 1] = 2
			@m2[1, 2] = 3
			@m2[2, 1] = 4
			@m2[2, 2] = 5
			
			expect(@m + @m2).to eq([[3, 5], [7, 9]])
		end

		it "should be able to do additions with same dimension and elements all number" do
			@m2 = MyMatrix.new(2, 2)
			@m2[1, 1] = 2
			@m2[1, 2] = 3
			@m2[2, 1] = 4
			@m2[2, 2] = 5
			
			@m + @m2
			expect(@m.to_s).to eq("| 3 5 |\n| 7 9 |\n")
		end

		it "not should be able to do additions with different dimension" do
			@m2 = MyMatrix.new(1, 2)
			expect(@m + @m2).to eq("different dimension, can't addition between two matrixes")
		end

		it "not should be able to do additions with one of elements not number" do
			@m2 = MyMatrix.new(2, 2)
			@m2[1, 1] = 2
			@m2[1, 2] = 3
			@m2[2, 1] = 4
			@m2[2, 2] = "a"

			expect(@m + @m2).to eq("one of elements not number, can't addition between two matrixes")
		end
	end
end