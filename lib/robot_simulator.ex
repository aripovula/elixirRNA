defmodule RobotSimulator do
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    with :ok <- validate_direction(direction),
        :ok <- validate_position(position),
        do: %{ direction: direction, position: position}
  end

  def validate_direction(direction)
    when direction in [:north, :east, :south, :west] do
    :ok
  end
  def validate_direction(_direction) do
    {:error, "invalid direction"}
  end

  def validate_position({p1, p2})
    when is_integer(p1) and is_integer(p2) do
      :ok
    end
  def validate_position(_position) do
    {:error, "invalid position"}
  end

  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    is_invalid? = String.contains?(instructions, "U")
      # instructions
      # |> String.graphemes
      # |> Enum.any?
      #   fn x -> not(String.contains?("RLA", x)) end

    IO.inspect(label: instructions, value: is_invalid?)

    case is_invalid? do
      false -> count_moves(robot, instructions)
      true -> {:error, "invalid instruction"}
    end
  end

  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end

  defp count_moves(robot, instructions) do
    dmap = %{
      :northR => %{:x => 0, :y => 0, :d => :east},
      :northL => %{:x => 0, :y => 0, :d => :west},
      :northA => %{:x => 0, :y => 1, :d => :north},
      :eastR => %{:x => 0, :y => 0, :d => :south},
      :eastL => %{:x => 0, :y => 0, :d => :north},
      :eastA => %{:x => 1, :y => 0, :d => :east},
      :westR => %{:x => 0, :y => 0, :d => :north},
      :westL => %{:x => 0, :y => 0, :d => :south},
      :westA => %{:x => -1, :y => 0, :d => :west},
      :southR => %{:x => 0, :y => 0, :d => :west},
      :southL => %{:x => 0, :y => 0, :d => :east},
      :southA => %{:x => 0, :y => -1, :d => :south}
    }

    instructions
    |> String.graphemes
    |> Enum.reduce robot, fn (i, updated_robot) ->
      next = String.to_atom( to_string(updated_robot.direction) <> i )
      { x, y } = updated_robot.position
      %{
        direction: dmap[next][:d],
        position: { x + dmap[next][:x], y + dmap[next][:y] }
      }
    end
  end
end
