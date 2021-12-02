measurements = File.read_lines("./input.txt").map(&.to_i32)

puts measurements.each.cons_pair.count { |a, b| a < b }

puts measurements.each.cons(3).each.cons_pair.count { |a, b| a.sum < b.sum }
