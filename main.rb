require_relative 'carWash/car_wash.rb'
require_relative 'matrix/my_matrix.rb'


cw = CarWash.new(3)
puts cw.to_s
puts

cw.push("A")
puts cw.to_s
puts

cw.push("B")
cw.push("C")
cw.push("D")
cw.push("E")
puts cw.to_s
puts

cw.push("F")
cw.push("F")
cw.push("G")
cw.push("I")
cw.washes
puts cw.to_s
puts

cw.washes
puts cw.to_s
puts

puts "History of Car Wash : "
p cw.washed_history
puts

cw.push("X")
puts cw.to_s
puts

puts "----------------------------------------------------"
puts "----------------------------------------------------"

m = MyMatrix.new(2, 2)
puts " matrix 1 : "
m[1, 1] = 1
m[1, 2] = 2
m[2, 1] = 3
m[2, 2] = 4
puts m.to_s
puts

m1 = MyMatrix.new(2, 2)
puts " matrix 2 : "
m1[1, 1] = 2
m1[1, 2] = 3
m1[2, 1] = 4
m1[2, 2] = 5
puts m1.to_s
puts

puts " Perkalian skalar : "
m * 2
puts m.to_s
puts

puts " Penambahan Matrix : "
m + m1
puts m.to_s
puts


