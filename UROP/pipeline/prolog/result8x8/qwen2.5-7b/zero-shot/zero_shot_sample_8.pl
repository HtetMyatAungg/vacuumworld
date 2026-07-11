grid(8, 8).

wall([0,6], west).
wall([1,6], north).
wall([2,6], north).
wall([0,7], south+north).
wall([1,7], south).
wall([2,7], south).
wall([0,5], west).
wall([1,5], north).
wall([2,5], north).
wall([0,4], west).
wall([1,4], north).
wall([2,4], north).
wall([3,0], east+north).
wall([3,1], north).
wall([3,2], north).
wall([3,3], south+north).
wall([3,4], north).
wall([3,5], north).
wall([3,6], north).
wall([3,7], south).
wall([4,5], north).
wall([4,6], south+north).
wall([4,7], south).
wall([4,4], north).
wall([4,3], north).
wall([4,2], north).
wall([4,1], north).
wall([4,0], south+north).
wall([5,0], south+north).
wall([5,1], south+north).
wall([5,2], north).
wall([5,4], south+north).
wall([6,0], south+north).
wall([6,1], north).
wall([6,3], south+north).
wall([6,4], north).
wall([6,6], north).
wall([7,0], east+south+north).
wall([7,1], east+south).
wall([7,2], east+south).
wall([7,3], east+south).
wall([7,4], east+south).
wall([7,5], east+south).
wall([7,6], east+south).

agent([0,3], '9af04778-08d6-4e40-8c6f-ba123d292a22', orange).
agent([4,0], '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', green).

dirt([0,2]).
dirt([1,2]).
dirt([3,4]).
dirt([5,1]).
dirt([6,1]).
dirt([6,3]).  