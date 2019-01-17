NB.    Copyright (C) 2019  Raoul Schorer

NB. Stringutils=======================
replace=: 4 : 0
NB. x is the replacement: boxed array
NB. y the input string : str
	replaced=.>{.x
	replacement=.>{:x
	replacement (y I.@:= replaced)} y
)

NB. Boxutils==========================
NB. https://code.jsoftware.com/wiki/Vocabulary/bslashdot
fillboxedfromleft =: [^:((<'') ~: [)/\.&.(,&a:)&.|.


NB. Generalutils======================
negateselect =: 4 : 0
NB. gives indices of elems not selected by x
NB. x is int array of shape 1 _
NB. y is array
	I. -.+/ (,x) =/ i.#y
)