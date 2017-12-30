class MyMatrix
	attr_accessor :row, :column, :matrix

	def initialize(row, column)
		@row = row
		@column = column
		@matrix = Array.new(@row){ Array.new(@column) }
	end

	def []=(row, column, value)
		@matrix[row-1][column-1] = value
	end

	def [](row, column)
		@matrix[row-1][column-1]
	end

	def to_s
		str = ""
		@matrix.each do |a, b| 
			a = "-" if a.nil?
			b = "-" if b.nil?
			str += "| #{a} #{b} |\n"  
		end
		str
	end

	def *(other)
		@matrix.collect! do |row|
      row.collect! { |element| element * other }
    end
	end

	def +(other)
		if !ensure_have_same_dimension(other)
			"different dimension, can't addition between two matrixes"
		else
			if !ensure_elements_is_number(other)
				"one of elements not number, can't addition between two matrixes"
			else
				for i in 0...row
					for j in 0...column
						matrix[i][j] += other.matrix[i][j]
					end
				end
				@matrix
			end
		end
	end

	private
	  def ensure_elements_is_number(other)
	  	is_number_m1 = true
			matrix.each do |(x, y)|
				is_number_m1 = x.is_a?(Numeric) && y.is_a?(Numeric)
				break if is_number_m1 == false
			end

			is_number_m2 = true
			other.matrix.each do |(x, y)|
				is_number_m2 = x.is_a?(Numeric) && y.is_a?(Numeric)
				break if is_number_m2 == false
			end			

			is_number_m1 && is_number_m2
		end

		def ensure_have_same_dimension(other)
			row == other.row && @column == other.column
		end
end