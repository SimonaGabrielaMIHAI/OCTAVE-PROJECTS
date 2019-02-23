function [] = joc()

scor_jucator = 0;
scor_calc = 0;
runda = 1;
tabla = [' ',' ',' ',' ',' ',' ',' ',' ',' ']; 		
%salvez mutarile in vector, initial gol
disp("Salut, hai sa jucam X si O. Asta e prima ta runda, mult succes!")
x_sau_o = input("Alege, joci cu X sau cu O? ", "s");
disp("Casutele sunt numerotate de la 1 la 9. Trebuie doar sa imi specifici unde vrei sa pui.")
disp("Daca vrei sa inchizi jocul poti sa folosesti q, but pls don't leave me yet")
if(x_sau_o == "X" || x_sau_o == "x") 
	disp("Ai ales X, tu incepi");
	symbo_jucator = 'X';    
	%salvez simbolurile fiecaruia
	symbo_calc = 'O';
	else 
		disp("Ai ales O sau n-ai ales nimic, deci eu sunt X si incep :D")
		mutare_calc = floor(1 + 9*rand(1,1));	
		symbo_jucator = 'O';
		symbo_calc = 'X';
		tabla(mutare_calc) = symbo_calc;
endif

A = actualizeaza(tabla); 
%matricea A este zona de joc, se actualizeaza cu valorile din vector
disp(A); %afisez zona de joc


if(symbo_calc == 'X') mutari = 1; 
	%calculatorul a mutat deja, tin evidenta mutarilor
	else mutari = 0;
endif

mutare_jucator_curent = input("Mutarea ta:", "s");

while (mutare_jucator_curent != 'q' && mutare_jucator_curent != 'Q') 
	%ies cand primesc 'q' sau 'Q'
	mutare_jucator_curent = str2num(mutare_jucator_curent);
	if(tabla(mutare_jucator_curent) == ' ') 
		%daca mutarea jucatorului e valida
		tabla(mutare_jucator_curent) = symbo_jucator;
		A = actualizeaza(tabla);
		disp(A);
		mutari++;
		mutare_calc = mutare_pc(tabla, symbo_calc, mutari);
		if(mutare_calc != -1) 
			%daca se returneaza o mutare valida
			tabla(mutare_calc) = symbo_calc;
			mutari++;
			A = actualizeaza(tabla);
			disp("Mutarea mea:");
			disp(mutare_calc);
			disp(A);
		endif
		stare = verifica_tabla(tabla, symbo_calc);
		if(stare == 1) %a castigat pc-ul
			scor_calc++;
			disp("Ai pierdut runda:");
			disp(runda);
			disp("Scorul tau:");
			disp(scor_jucator);
			disp("Scorul meu:");
			disp(scor_calc);
		endif
		if(stare == 2)%a castigat jucatorul
			scor_jucator++;
			disp("Ai castigat runda:");
			disp(runda);
			disp("Scorul tau:");
			disp(scor_jucator);
			disp("Scorul meu:");
			disp(scor_calc);
		endif
		if(stare == 0) %remiza
			disp("Runda s-a incheiat cu o remiza. Ai jucat runda:");
			disp(runda);
			disp("Scorul tau:");
			disp(scor_jucator);
			disp("Scorul meu:");
			disp(scor_calc);
		endif
		if(stare != 3) %daca e 3, jocul continua normal, nu se intra in acest if
			runda++;
			[tabla, mutari, symbo_jucator, symbo_calc] = alege_x_sau_o;
			A=actualizeaza(tabla);
			disp(A);
		endif
	else
		disp("Nu poti sa pui acolo, nu e o mutare valida. Mai incearca.");
		A = actualizeaza(tabla);
		disp(A);
	endif

	mutare_jucator_curent = input("Mutarea ta:", "s");
endwhile

if(mutare_jucator_curent(1) == 'q') %la 'Q' nu primesti mesaj special de iesire
	disp("Ai ales sa inchizi jocul. Paa!");
	return;
endif

endfunction
