sums = Hash.new { |k, v| k[v] = Hash.new(0) }

3.upto(1_000_000_000) do |a|
  puts "N=#{a}"
  $stdout.flush

  2.upto(a - 1) do |b|
    1.upto(b - 1) do |c|
      sum = a * a + b * b + c * c

      # The sum must be divisible by three.
      centre_square, remainder = sum.divmod(3)
      next unless remainder.zero?

      counts = sums[sum]

      counts[a] += 1
      counts[b] += 1
      counts[c] += 1

      # The centre must produce the sum in at least four ways and must be a third of the sum.
      centre = counts.detect { |k, v| v >= 4 && k * k == centre_square }
      next unless centre

      # There must be at least eight other numbers that produce the sum in at least two ways.
      others = counts.select { |_, v| v >= 2 && v != centre }
      next unless others.count >= 8

      # The four corners must produce the sum in at least three ways.
      possible_corners = others.select { |_, v| v >= 3 }
      next unless possible_corners.count >= 4

      # There must be at least two pairs of corners that produce the sum.
      corners_square = possible_corners.keys.map { |x| x * x }
      corner_pairs = corners_square.combination(2).select do |x, y|
        x + y + centre_square == sum
      end
      next unless corner_pairs.count >= 2

      # Iterate through each valid corner combination.
      # c1 m1 c2
      # m2    m3
      # c3 m4 c4
      other_squares = others.reduce({}) { |hash, (k, v)| hash.merge(k * k => true) }
      corner_pairs.combination(2).each do |(c1, c4), (c2, c3)|
        m1 = sum - c1 - c2
        m2 = sum - c1 - c3
        m3 = sum - c2 - c4
        m4 = sum - c3 - c4

        distinct_squares = 5
        distinct_squares += [m1, m2, m3, m4].uniq.count { |x| other_squares[x] }

        puts "-------------------------"
        puts "  sum: #{sum}, distinct: #{distinct_squares}\n"
        puts "  #{c1} #{m1} #{c2}"
        puts "  #{m2} #{centre_square} #{m3}"
        puts "  #{c3} #{m4} #{c4}"
      end
    end
  end
end
