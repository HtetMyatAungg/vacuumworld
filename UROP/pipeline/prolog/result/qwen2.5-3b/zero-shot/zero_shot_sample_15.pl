grid(domain(0,N), domain(0,N),
[
  [north(east(washes)),west(south(washes))],
  [north(washed)],
  [north(washed)],
  [north(washed), west(south(washes))],
  [north(washed)],
  [north(washed)],
  [north, north(washed), east(northeast(east(washes)), south(washed))],
  [north(washed)],
  [north,west(north(south(washes))),east(washes),east(north(south(washes)))]),
  [],
  [north,west(orange,south(washes)),north(south(washes))]
  [north,washed,north(eastsouth(washes)),south(orange, eastsouth(washes))],
  [north,east(washed),south(washed)],
  [],
  [north,west,west(northeast(north(eastsouth(washes))), west(east(north(south(washes)))),east(north(eastsouth(washes)))]
]
),
boundaries(sw), boundaries(s),
boundaries(se), bounds(ne), boundaries(e),
bounds(borders)