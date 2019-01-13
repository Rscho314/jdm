NB.    Copyright (C) 2019  Raoul Schorer

NB. this file loads data and analyzes its structure
NB. 'decorate' means 'add metadata'


NB. constants that should be reassigned
NHEDROWS=:1
NIDCOLS=:0

loaddata=: 3 : 0
	readcsv jpath y
)

NB. loads the head row(s) in array of arrays
NB. each nested array consists of 4 rows
NB. 1 - original names
NB. 2 - sanitized names
NB. 3 - integer head column index
NB. 4 - a concatenation of 2 & 3 -> unique name
NB. will be used for selection by name (replaced by lookup)

sanitize_name=: 3 : 0
NB. replace spaces
	y =. (' ';'_') replace y
NB. TODO add rules
	y
)

process_headrow=: 3 : 0
NB. makes a 2D array of rows 1 - 4 above
	a  =. y
	b  =. sanitize_name each y
	c  =. ;/ i. # y
	c1 =. ('_',":) each ;/ i. # y
	d  =. <@,@;"1 |: b ,: c1
	|: a ,. b ,. c ,. d
)

process_head=: 4 : 0
NB. x is NHEDROWS, y is DATA
 TODO
)