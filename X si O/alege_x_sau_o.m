function [tabla, mutari, symbo_jucator, symbo_calc] = alege_x_sau_o()

mutari = 0;
tabla = [' ',' ',' ',' ',' ',' ',' ',' ',' ']; %golesc tabla
x_sau_o = input("O noua runda este pe punctul de a incepe. Cu ce joci de data asta?", "s");
if(x_sau_o == "X" || x_sau_o == "x") 
	disp("Ai ales X, tu incepi");
	symbo_jucator = 'X';
	symbo_calc = 'O';
	else 
		disp("Ai ales O sau n-ai ales nimic, deci eu sunt X si incep :D")
		symbo_jucator = 'O';
		symbo_calc = 'X';
		mutare_calc = floor(1 + 9*rand(1,1)); %incepe tot cu mutare random
		tabla(mutare_calc) = symbo_calc;
		mutari++; %s-a facut prima mutare

endif
endfunction
