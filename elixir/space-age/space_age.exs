defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus
  @base_sec 31557600
  @seconds_per_orbit %{ :earth   => 1.0        * @base_sec,
                        :mercury => 0.2408467  * @base_sec,
                        :venus   => 0.61519726 * @base_sec,
                        :mars    => 1.8808158  * @base_sec,
                        :jupiter => 11.862615  * @base_sec, 
                        :saturn  => 29.447498  * @base_sec,
                        :uranus  => 84.016846  * @base_sec,
                        :neptune => 164.79132  * @base_sec }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / @seconds_per_orbit[planet]
  end
end