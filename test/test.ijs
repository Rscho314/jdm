NB.    Copyright (C) 2019  Raoul Schorer


NB.Data===============================
test_loaddata=: 3 : 0
	d=.loaddata '~Projects/jdm/test/Admission_Predict.csv'
	if. _1 = d do. d else. t =. 1 end.
	assert. t
)

test_process_headrow_space=: 3 : 0
	d =. process_headrow ' a' ; 'b c' ; 'd ' ; '' ; ' '
	t =. 4 5 $ ' a' ; 'b c' ; 'd ' ; '' ; ' ' ; '_a' ; 'b_c' ; 'd_' ; '' ; '_' ; 0 ; 1 ; 2 ; 3 ; 4 ; '_a_0' ; 'b_c_1' ; 'd__2' ; '_3' ; '__4'	
	assert. t = d
)

test_data=: 3 : 0
	test_loaddata''
	test_process_headrow_space''
)

NB.String=============================
test_replace=: 3 : 0
	d =.(' ';'z') replace 'ra ou l'
	assert. d = 'razouzl'
)

NB.Run================================
testall=: 3 : 0
	test_data''
	test_replace''
	'all tests passed'
)