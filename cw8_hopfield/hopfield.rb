# frozen_string_literal: true

z = [0.0, 0.0, 0.0, 0.0, 0.0,
     0.0, 1.0, 1.0, 0.0, 0.0,
     0.0, 0.0, 1.0, 0.0, 0.0,
     0.0, 0.0, 1.0, 0.0, 0.0,
     0.0, 0.0, 1.0, 0.0, 0.0]

# z = [0.0, 1.0, 1.0, 1.0, 0.0,
#      0.0, 1.0, 0.0, 1.0, 0.0,
#      0.0, 1.0, 0.0, 1.0, 0.0,
#      0.0, 1.0, 0.0, 1.0, 0.0,
#      0.0, 1.0, 1.0, 1.0, 0.0]

c = Array.new(25) { [] }
w = Array.new(25) { [] }
theta = []
x = []
u = []

25.times do |i|
  25.times do |j|
    c[i][j] = (z[i] - (1.0 / 2.0)) * (z[j] - (1.0 / 2.0)) if i != j
    c[i][j] = 0 if i == j
  end
end
# p c

25.times do |i|
  25.times do |j|
    w[i][j] = 2 * c[i][j]
  end
end

25.times do |i|
  theta[i] = c[i].sum
end

25.times do |i|
  x[i] = rand(0..1)
end

while true
  25.times do |i|
    sum = 0
    25.times do |j|
      sum += w[i][j] * x[j]
    end
    u[i] = sum - theta[i]
  end

  (1..24).each do |i|
    x[i] = 0 if u[i].negative?
    x[i] = x[i - 1] if u[i].zero?
    x[i] = 1 if u[i].positive?
  end

  25.times do |i|
    puts if (i % 5).zero?
    print(x[i] == 1 ? '■' : '□')
  end
  puts
  sleep(1)
end
