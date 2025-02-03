#! /bin/csh

set n = 2

while ( $n < ${1} )

csh makedirs.csh ${n}

@ n = $n + 1

end
