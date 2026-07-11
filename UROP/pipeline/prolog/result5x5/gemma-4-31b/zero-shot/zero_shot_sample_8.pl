wall(0, _, west).
wall(_, 0, north).
wall(4, _, east).
wall(_, 4, south).
wall(0, 4, south).
wall(1, 4, south).
wall(2, 4, south).
wall(3, 4, south).
wall(4, 4, south).

dirt(2, 3, orange).
dirt(1, 2, green).
dirt(3, 1, orange).

agent(2, 0, c942b0ce-6c70-4311-a5b7-6b2640fe417c, green).
agent(4, 2, ec1d58f6-6db4-473d-af3e-518ca49c39f9, orange).

location(0, 0, empty).
location(1, 0, empty).
location(2, 0, agent).
location(3, 0, empty).
location(4, 0, empty).
location(0, 1, empty).
location(1, 1, empty).
location(2, 1, empty).
location(3, 1, dirt).
location(4, 1, empty).
location(0, 2, empty).
location(1, 2, dirt).
location(2, 2, empty).
location(3, 2, empty).
location(4, 2, agent).
location(0, 3, empty).
location(1, 3, empty).
location(2, 3, dirt).
location(3, 3, empty).
location(4, 3, empty).
location(0, 4, empty).
location(1, 4, empty).
location(2, 4, empty).
location(3, 4, empty).
location(4, 4, empty).