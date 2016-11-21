package clock

import "fmt"

const testVersion = 4

// Lets call it minutes since midnight, so an integer
type Clock int

func New(hour, minute int) Clock {
	time := (hour*60 + minute) % (60 * 24)
	if time < 0 {
		time += 60 * 24
	}
	return Clock(time)

}

func (clock Clock) String() string {
	return fmt.Sprintf("%02d:%02d", clock/60, clock%60)
}

func (clock Clock) Add(minutes int) Clock {
	return New(0, int(clock)+minutes)
}
