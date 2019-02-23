function Z = zigzag(n)

linia = 1;
coloana = 1;

for i = 0:(n*n - 1)
	if (linia <= n && coloana <= n) 	
		%verific linia si coloana inainte, just in case
		Z(linia,coloana) = i;
	endif
	if mod(linia + coloana, 2) == 0 	
		%se merge "spre coltul din dreapta sus"(nu e mereu coltul) pe diagonala
		%suma coordonatelor e para
		if linia > 1
			linia = linia - 1; 
			%linia scade, se urca in matrice
		endif

		if coloana < n
			coloana = coloana + 1; 
			%coloana creste, se deplaseaza la dreapta
		else 
			if linia == 1 && mod(n, 2) != 0  	
			%aici am ajuns pe prima linie
				linia = linia + 1; 				
				%aici a ajuns in colt, trebuie doar sa coboare un rand
			else 
				linia = linia + 2; 			
				%pe else: daca n e par, elementul din colt este pe
				%diagonala parcursa de sus in jos
			endif
		endif 				
		%la 'linia + 2' se ajunge cand se termina diagonala de sub cea secundara
		%a intrat in if-ul de mai sus cu linia - 1, deci este fix coltul
		%in else e nevoie sa sara 2 linii in acest caz, sa continue completarea
	else
		%suma coordonatelor e impara, se merge spre coltul stanga-jos
		if linia < n
			linia = linia + 1; 
			%linia creste, se coboara
		else 
			coloana = coloana + 2; 
			%aici e pe ultima linie 
		endif

		if coloana > 1
			coloana = coloana - 1;
			%coloana scade, merge spre stanga
		endif                
					%cand e pe ultima linie se reduce un + 1 de pe else-ul  
					%de mai sus si revine pe coloana de unde se continua umplerea
	endif 			%pe cealalta diagonala, cazul pe pare.

endfor

endfunction
