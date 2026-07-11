grid(grid(8, 8,
        [[grid(cell(0,6,null,_)),_],[null,_],[_,_],[_,_],[_,_],[_(_),null,_],
         [_(_),grid(cell(1,7,null,_)),_],[null,_],[_(_),null,_],[_(_),null,_],
         [_(_),grid(cell(0,5,null,_)),_],[null,_],[_(_),null,_],[_(_),null,_],
         [_(_),grid(cell(2,7,null,_)),_],[null,_],[_(_),_,null],
         [_(_),grid(cell(1,4,null,_)),_],[null,_],[_(_),_,null],
         [_(_),grid(cell(0,3,agent('9af04778-08d6-4e40-8c6f-ba123d292a22',orange))),_],
         [_(_),null,_],[_(_),_,null],[null,_],[_(_),grid(cell(1,1,null,_)),_],
         [_(_),grid(dirt(orange),'9af04778-08d6-4e40-8c6f-ba123d292a22'),_],[_(_),_,null],
         [[grid(cell(2,1,dirt(green),'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'))],[grid(north)],
          [grid(cell(0,0,null,_)),_,_],[_(_),[{north, grid(south)}]],\
         [{east,northing},null,{south,null}],
         [[grid(cell(3,1,dirt(orange),'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'))],[north,\_],[grid(north)],
          [{west,south},\_,,{north,northing}],
         [[grid(cell(3,2,null,_))],north,[grid(south)],[{south,northing}]],
         [\_,[grid(cell(4,2,dirt(green),'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'))],
          [{east,south},\_,,{north,northing}],
         [grid(cell(5,1,null,_)),{northing},[{south,north}]],
         [\_,[grid(cell(5,2,dirt(green),'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'))],
          [{west,northing},{north,northing}],
         [[grid(cell(6,1,null,_))],{northing},[\_,{},\_]],\
         [\_,[grid(cell(6,2,dirt(green),'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'))],
          [{east,northing},{north,south}]],
         [_(_),[{northing,east}],grid(cell(7,1,dirt(orange),'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'))],
          [{south,north},\_,,{north,south}]]
      )
)