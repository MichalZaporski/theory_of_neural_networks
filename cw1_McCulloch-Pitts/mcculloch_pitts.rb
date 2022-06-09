# frozen_string_literal: true

def mcculloch_pitts_neuron(u:, w:)
  u.each_with_index.map { |ui, i| ui * w[i] }.sum.negative? ? 0 : 1
end

puts '(1) NOT n = 2, u2 = 1'
w = [-1, 0.5]
puts mcculloch_pitts_neuron(u: [0, 1], w: w)
puts mcculloch_pitts_neuron(u: [1, 1], w: w)

puts '(2) AND n = 3, u3 = 1'
w = [0.5, 0.5, -1]
puts mcculloch_pitts_neuron(u: [0, 0, 1], w: w)
puts mcculloch_pitts_neuron(u: [1, 0, 1], w: w)
puts mcculloch_pitts_neuron(u: [0, 1, 1], w: w)
puts mcculloch_pitts_neuron(u: [1, 1, 1], w: w)

puts '(3) NAND n = 3, u3 = 1'
w = [-0.6, -0.6, 1]
puts mcculloch_pitts_neuron(u: [0, 0, 1], w: w)
puts mcculloch_pitts_neuron(u: [1, 0, 1], w: w)
puts mcculloch_pitts_neuron(u: [0, 1, 1], w: w)
puts mcculloch_pitts_neuron(u: [1, 1, 1], w: w)

puts '(4) OR n = 3, u3 = 1'
w = [1, 1, -0.5]
puts mcculloch_pitts_neuron(u: [0, 0, 1], w: w)
puts mcculloch_pitts_neuron(u: [1, 0, 1], w: w)
puts mcculloch_pitts_neuron(u: [0, 1, 1], w: w)
puts mcculloch_pitts_neuron(u: [1, 1, 1], w: w)
