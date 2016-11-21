package gigasecond

import "time"

const testVersion = 4

const GIGSEC = time.Duration(1000000000) * time.Second

func AddGigasecond(now time.Time) time.Time {
	return now.Add(GIGSEC)
}
