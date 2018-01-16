include(setunion).
include(setintersection).
include(setdiff).
setsymetricdiff(L1, L2, L):-
    setunion(L1, L2, Lu),
    setintersection(L1, L2, Li),
    setdiff(Lu, Li, L).