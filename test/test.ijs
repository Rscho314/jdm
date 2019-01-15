NB.    Copyright (C) 2019  Raoul Schorer

NB. a. {~ 97+i.26
NB. 6 4 $ ;/ a. {~ 97+i.26

NB.Data===============================
test_loaddata=: 3 : 0
	d=.load_data '~Projects/jdm/test/Admission_Predict.csv'
	if. _1 = d do. d else. t =. 1 end.
	assert. t
)

test_sanitize_headrow_space=: 3 : 0
	d =. process_headrow ' a' ; 'b c' ; 'd ' ; '' ; ' '
	t =. 4 5 $ ' a' ; 'b c' ; 'd ' ; '' ; ' ' ; '_a' ; 'b_c' ; 'd_' ; '' ; '_' ; 0 ; 1 ; 2 ; 3 ; 4 ; '_a_0' ; 'b_c_1' ; 'd__2' ; '_3' ; '__4'	
	assert. t = d
)

test_sanitize_head=: 3 : 0
	d =. sanitize_head 2 3 $ 'a ';' b';'c';'d';' e';'f'
	t =. 4 2 3 $ 'a ';' b';'c';'d';' e';'f';'a_';'_b';'c';'d';'_e';'f';0;1;2;0;1;2;'a__0';'_b_1';'c_2';'a_d_0';'_b_e_1';'cf_2'
	assert. t = d
)

test_data=: 3 : 0
	test_loaddata''
	NB.test_sanitize_headrow_space''
	test_sanitize_head''
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