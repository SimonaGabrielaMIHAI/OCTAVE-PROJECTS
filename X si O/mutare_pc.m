function mutare = mutare_pc(tabla, symbo_calc, mutari)
	

if(verifica_tabla(tabla, symbo_calc) != 3) 
	mutare = -1; %nu mai sunt mutari sau cineva a castigat
	return;
endif

if(tabla(5) == ' ') %daca e liber, pune in mijloc
	mutare = 5;
	return;
endif

if(mutari == 1) 
	%daca jucatorul a inceput cu 'x' si a pus in mijloc
	mutare = randi(4,1,1)	
	%pun intr-un colt, ales random
	if(mutare == 2) 
		mutare = 7;
	endif
	if(mutare == 4) 
		mutare = 9;
	endif 	
	while(tabla(mutare) != ' ') 
		%nu are cum sa fie ocupat, dar nu strica o conditie in plus
		mutare = randi(4,1,1);
		if(mutare == 2) 
			mutare = 7;
		endif
		if(mutare == 4) 
			mutare = 9;
		endif
	endwhile
return;
endif

%PRIMA DATA PROGRAMUL INCEARCA SA CASTIGE(isi cauta propriile casute)

for i=1:8 %cauta orizontal, consecutiv
		if(tabla(i) == tabla(i + 1) && tabla(i) == symbo_calc && i != 3 && i != 6)
			if(i == 1 || i == 4 || i == 7)
				if(tabla(i+2) == ' ') 
					mutare = i + 2; %primele 2 pe rand sunt la fel, se pune 
				return;									%in a 3-a
				endif
			endif
			if(i == 2 || i == 5 || i == 8) %ultimele 2 pe rand sunt la fel
				if(tabla(i-1) == ' ') 
					mutare = i - 1; %se pune in prima casuta de pe rand
					return;
				endif
			endif
		endif
endfor

%cauta orizontal, la capetele liniei
if(tabla(1) == tabla(3) && tabla(1) == symbo_calc) 
	if(tabla(2) == ' ') 
		mutare = 2;
		return;
	endif
endif
if(tabla(4) == tabla(6) && tabla(4) == symbo_calc) 
	if(tabla(5) == ' ') 
		mutare = 5;
		return;
	endif
endif
if(tabla(7) == tabla(9) && tabla(7) == symbo_calc) 
	if(tabla(8) == ' ') 
		mutare = 8;
		return;
	endif
endif

for i=1:6 %cauta vertical, consecutiv
	if(tabla(i) == tabla(i+3) && tabla(i) == symbo_calc)
		if(i == 1 || i == 2 || i == 3) %primele pe coloana sunt la fel
			if(tabla(i + 6) == ' ') 
				mutare = i + 6; 
				%muta pe ultima casuta pe coloana
				return;
			endif
		endif
		if(i == 4 || i == 5 || i == 6) %ultimele pe coloana sunt la fel
			if(tabla(i - 3) == ' ') 
				mutare = i - 3; 
				%muta pe prima casuta pe coloana
			return;
			endif
		endif
	endif
endfor

for i=1:3 %cauta vertical, la capetele coloanei
	if(tabla(i) == tabla(i+6) && tabla(i) == symbo_calc)
		if(tabla(i + 3) == ' ') 
			mutare = i + 3; %muta pe mijlocul coloanei
			return;
		endif
	endif
endfor

%diagonala secundara
calc = 0; %numar cate simboluri are calculatorul
for i=3:2:7
	if(tabla(i) == symbo_calc) 
		calc++;
	endif
endfor
if(calc==2)
	for i=3:2:7
		if(tabla(i) == ' ') 
			mutare = i;
			return;
		endif
	endfor
endif

%diagonala principala
calc = 0;
for i=1:4:9
	if(tabla(i) == symbo_calc) 
		calc++;
	endif
endfor
if(calc==2)
	for i=1:4:9
		if(tabla(i) == ' ') 
			mutare = i;
			return;
		endif
	endfor
endif

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%AICI INCEP SA VERIFIC JUCATORUL(ca mai sus)
for i=1:8 %cauta orizontal
	if(tabla(i) == tabla(i + 1) && tabla(i) != ' ' && i != 3 && i != 6)
		if(i == 1 || i == 4 || i == 7)
			if(tabla(i+2) == ' ') 
				mutare = i + 2;
				return;
			endif
		endif
		if(i == 2 || i == 5 || i == 8)
			if(tabla(i-1) == ' ') 
				mutare = i - 1;
				return;
			endif
		endif
	endif
endfor

if(tabla(1) == tabla(3) && tabla(1) != ' ') 
	if(tabla(2) == ' ') 
		mutare = 2;
		return;
	endif
endif
if(tabla(4) == tabla(6) && tabla(4) != ' ') 
	if(tabla(5) == ' ') 
		mutare = 5;
		return;
	endif
endif
if(tabla(7) == tabla(9) && tabla(7) != ' ') 
	if(tabla(8) == ' ') 
		mutare = 8;
		return;
	endif
endif

for i=1:6 %cauta vertical
	if(tabla(i) == tabla(i+3) && tabla(i) != ' ')
		if(i == 1 || i == 2 || i == 3)
			if(tabla(i + 6) == ' ') 
				mutare = i + 6;
				return;
			endif
		endif
		if(i == 4 || i == 5 || i == 6)
			if(tabla(i - 3) == ' ') 
				mutare = i - 3;
				return;
			endif
		endif
	endif
endfor
for i=1:3 
	if(tabla(i) == tabla(i+6) && tabla(i) != ' ')
		if(tabla(i + 3) == ' ') 
			mutare = i + 3;
			return;
		endif
	endif
endfor

%diagonala secundara
pers = 0;
calc = 0;
for i=3:2:7
	if(tabla(i) == symbo_calc) 
		calc++; %am mai verificat calculatorul, stiu, dar nu e gresit :)
		else 
			if(tabla(i) != ' ') pers++;
			endif
	endif
endfor
if( pers==2 || calc==2)
	for i=3:2:7
		if(tabla(i) == ' ') 
			mutare = i;
			return;
		endif
	endfor
endif

%diagonala principala
pers = 0;
calc = 0;
for i=1:4:9
	if(tabla(i) == symbo_calc) 
		calc++;
		else 
			if(tabla(i) != ' ') 
				pers++;
			endif
	endif
endfor
if( pers==2 || calc==2)
	for i=1:4:9
		if(tabla(i) == ' ') 
			mutare = i;
			return;
		endif
	endfor
endif

%daca totul e ok, mut random
mutare_calc = floor(1 + 9*rand(1,1));
while(tabla(mutare_calc) != ' ')
	mutare_calc = floor(1 + 9*rand(1,1));
endwhile
mutare = mutare_calc;

endfunction

