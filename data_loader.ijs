NB.    Copyright (C) 2019  Raoul Schorer

NB. this file loads data and analyzes its structure
NB. assumes a csv structure on import


NB. constants that may be reassigned
NIDROWS =: 1
NIDCOLS  =: 1
SKIPROWS =: 1
SKIPCOLS =: 1

NB. loads the head row(s) in array of arrays
NB. each nested array consists of 4 rows
NB. 1 - original names
NB. 2 - sanitized names
NB. 3 - integer head column index
NB. 4 - a concatenation of 2 & 3 -> unique name
NB. will be used for selection by name (replaced by lookup)
load_data=: 3 : 0
	readcsv jpath y
)

sanitize_name=: 3 : 0
NB. replace spaces
	y =. (' ';'_') replace y
NB. TODO add rules
	y
)

sanitize_headrow=: 0 : 0
NB. makes a 2D array of rows 1 - 4 above
	b  =. sanitize_name each y
	c  =. ;/ i. # y
	c1 =. ('_',":) each c
	d  =. <@,@;"1 |: b ,: c1
	|: y ,. b ,. c ,. d
)

sanitize_head=: 3 : 0
NB. y is 2D head rows
NB. returns 3D array with each slice 1 head row
NB. mangled names are guaranteed unique in rows or cols
NB. BUT NOT between rows and cols!
	names         =. sanitize_name each y
	nums          =. ;/"1 a $ i. {: ] a =. $ y	
	num_chars     =. ('_',":) each nums
	prefix_roll   =. |: <@,@:;\"1 |: names
	unique_mangle =. <@,@:;"1 |: prefix_roll ,: num_chars
	(4 , ($y)) ($,) y , names , nums , |: unique_mangle
)

restructure_original =: 4 : 0
NB. uses header info to restructure original data
NB. into a mangled flat array
NB. x is SKIPROWS SKIPCOLS NIDROWS NIDCOLS
NB. y is original data
NB. returns mangled_rows mangled_cols headless_data
	skiprows      =. {. x
	skipcols      =. 1 { x
	nidrows       =. 2 { x
	nidcols       =. {: x
	skipped_data  =. skipcols }."1 skiprows }. y
	headless_data =. nidcols }."1 nidrows }. skipped_data
	mangled_rows  =. sanitize_head nidrows {. nidcols }."1 skipped_data
	mangled_cols  =. sanitize_head |: nidcols {."1 nidrows }. skipped_data
	mangled_rows ; mangled_cols ; < headless_data
)

getcol=: 4 : 0
NB. x is a name, sanitized name, number, or mangled name
NB. y is restructured data
	dataset  =. >{:y
	cols =. >{.y 
	idx =. I. 0< +/ +/ > x-: each cols
	idx {"1 dataset
)