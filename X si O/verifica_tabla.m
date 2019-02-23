function raspuns = verifica_tabla(tabla, symbo_calc)

%returneaza 1 daca a castigat calculatorul si 2 daca a castigat jucatorul
%returneaza 0 daca nu mai sunt mutari si 3 daca se continua normal

%diagonala secundara
calc = 0;
pers = 0;
for i=3:2:7
		if(tabla(i) == symbo_calc) 
			calc++;
			else 
				if(tabla(i) != ' ') 
					pers++;
				endif
		endif
endfor
if(calc == 3) 
	raspuns = 1;
	return;
endif
if(pers == 3) 
	raspuns = 2;
	return;
endif

%diagonala principala
calc = 0;
pers = 0;
for i=1:4:9
		if(tabla(i) == symbo_calc) 
			calc++;
			else 
				if(tabla(i) != ' ') 
					pers++;
				endif
		endif
endfor
if(calc == 3) 
	raspuns = 1;
	return;
endif
if(pers == 3) 
	raspuns = 2;
	return;
endif

%orizontal
for i=1:3:7
	if(tabla(i) == tabla(i + 1) && tabla(i + 1) == tabla(i + 2))
		if(tabla(i) == symbo_calc)
			raspuns = 1;
			return;
		else 
			if(tabla(i) != ' ')
				raspuns = 2
				return;
			endif
		endif
	endif
endfor

%vertical
for i=1:1:3
	if(tabla(i) == tabla(i + 3) && tabla(i + 3) == tabla(i + 6))
		if(tabla(i) == symbo_calc)
			raspuns = 1;
			return;
		else 
			if(tabla(i) != ' ')
				raspuns = 2;
				return;
			endif
		endif
	endif
endfor
raspuns = 0;
for i=1:1:9 %verific daca mai sunt mutari
	if(tabla(i) == ' ')
		raspuns = 3;
	endif
endfor

endfunction


