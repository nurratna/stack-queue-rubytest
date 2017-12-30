class CarWash
	attr_accessor :size, :matrix

	def initialize(size)
		@size = size
		@matrix = Array.new(@size){Array.new(@size, "-")}
		@row_head = 0
		@column_head = 0
		@washed = Array.new
	end

	def to_s
		str = ""
		@matrix.map do |a| 
			str += "| #{a.join(" ")} |\n" 
		end
		str
	end

	def push(car_name)
		row, column = ensure_still_empty_space
		if row.nil? && column.nil?
			"parking space is full"
		else
			@matrix[row][column] = car_name
		end
	end

	def washes
		if is_empty_space?
			"parking space is empty"
		else
			@washed << @matrix[@row_head][@column_head]
			@matrix[@row_head][@column_head] = "-"

			if @column_head < size && @row_head < size
				@column_head += 1
				@row_head += 1 if @column_head >= size

				if @matrix[@row_head][@column_head] == "-"
					@column_head = 0
					@row_head = 0
				end
			end
		end
	end

	def washed_next
		
	end

	def washed_history
		@washed
	end

	private
		def is_empty_space?
			@matrix.all? { |row| row.all? { |element| element == '-' } }
		end

		def ensure_still_empty_space
			indexs = []
			@matrix.each_index do |i|
	  		if @matrix[i].index('-')
	  			indexs = [i, @matrix[i].index('-')]
	  			break
	  		end
			end
			indexs
		end
end

