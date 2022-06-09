# frozen_string_literal: true

class F
  def initialize(x:)
    @c = 0.01
    @e = 0.000000001
    @x_old = x
    @x_new = [nil] * x.size
    main_step
  end

  def run
    until break?
      old_to_new
      main_step
    end

    display_result
  end

  private

  def main_step = @x_new = @x_new.each_with_index.map { @x_old[_2] - @c * send("dx#{_2}") }

  def old_to_new = @x_old.replace @x_new

  def break? = @x_new.each_with_index.map { (_1 - @x_old[_2]).abs }.max < @e

  def display_result
    puts "#{self.class} #{@x_new} Value: #{function}"
  end
end

class F1 < F
  private

  def dx0 = 4 * @x_old[0] - 2 * @x_old[1] - 2

  def dx1 = 4 * @x_old[1] - 2 * @x_old[0] - 2 * @x_old[2]

  def dx2 = 2 * @x_old[2] - 2 * @x_old[1]

  def function = 2 * @x_new[0]**2 + 2 * @x_new[1]**2 + @x_new[2]**2 - 2 * @x_new[0] * @x_new[1] - 2 * @x_new[1] * @x_new[2] - 2 * @x_new[0] + 3
end

class F2 < F
  private

  def dx0 = 12 * @x_old[0]**3 + 12 * @x_old[0]**2 - 24 * @x_old[0]

  def dx1 = 24 * @x_old[1] - 24

  def function = 3 * @x_new[0]**4 + 4 * @x_new[0]**3 - 12 * @x_new[0]**2 + 12 * @x_new[1]**2 - 24 * @x_new[1]
end

def random_array(size, n) = Array.new(size) { rand(-n..n) }

F1.new(x: random_array(3, 20)).run

F2.new(x: random_array(2, 2)).run
F2.new(x: [3, 4]).run
