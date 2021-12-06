alias Command = Tuple(String, String)

commands = File.read_lines("./input.txt").map { |c| Command.from(c.split) }

class Submarine
  property horizontal_position : Int32 = 0
  property depth : Int32 = 0

  def initialize(@commands : Array(Command))
  end

  def execute_commands
    @commands.each { |c| self.follow_command(*c) }
    self
  end

  def follow_command(direction, value)
    case direction
    when "up"      then @depth -= value.to_i32
    when "down"    then @depth += value.to_i32
    when "forward" then @horizontal_position += value.to_i32
    end
  end

  def report_position
    {horizontal_position, depth}
  end
end

puts Submarine.new(commands).execute_commands.report_position.product

class AimingSubmarine < Submarine
  property aim : Int32 = 0

  def follow_command(direction, value)
    case direction
    when "up"   then @aim -= value.to_i32
    when "down" then @aim += value.to_i32
    when "forward"
      @horizontal_position += value.to_i32
      @depth += @aim * value.to_i32
    end
  end
end

puts AimingSubmarine.new(commands).execute_commands.report_position.product
