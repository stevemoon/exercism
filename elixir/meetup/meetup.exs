defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @daynums  %{:monday => 1, :tuesday => 2, :wednesday => 3,
             :thursday => 4, :friday => 5, :saturday => 6, :sunday => 7}

  @schednums %{:first => 0, :second => 1, :third => 2, :fourth => 3}

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    get_weekday_list(year, month, weekday)
    |> select_day(year, month, schedule)
  end
  
  @spec get_weekday_list(pos_integer, pos_integer, weekday) :: list
  defp get_weekday_list(year, month, weekday) do
    daynum = Map.get(@daynums, weekday)
    for x <- 1..:calendar.last_day_of_the_month(year, month), 
      :calendar.day_of_the_week(year, month, x) == daynum, do: x
  end

  @spec select_day(list, pos_integer, pos_integer, schedule) :: tuple
  defp select_day(day_list, year, month, :teenth) do
    day = for x <- day_list, x > 12, do: x
    {year, month, hd(day)}
  end
  defp select_day(day_list, year, month, :last) do
    day = Enum.reverse(day_list)
    {year, month, hd(day)}
  end
  defp select_day(day_list, year, month, schedule) do
    pos = Map.get(@schednums, schedule)
    day = Enum.fetch!(day_list, pos)
    {year, month, day}
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> origin/master
