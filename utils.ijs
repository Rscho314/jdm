NB.    Copyright (C) 2019  Raoul Schorer

NB. Stringutils=======================
replace=: 4 : 0
NB. x is the replacement: boxed array
NB. y the input string : str
	replaced=.>{.x
	replacement=.>{:x
	replacement (y I.@:= replaced)} y
)