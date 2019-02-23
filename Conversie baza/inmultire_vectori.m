function x = inmultire_vectori(a, b)

T = 0; 
%transportul, ce ramane dupa inmultire si trebuie adaugat la elementele de dupa
l_a = length(a);
l_b = length(b);
lungime_vector = length(a) + length(b) - 1; 
%lungimea rezultatului dupa inmultire

for i = 1 : (length(a) + length(b)) 
	%initializez un vector de 0
	vector(i) = 0;
endfor

for j = 1 : length(a)
	for k = 1 : length(b) 
		%inmultesc fiecare element din a cu fiecare element din b
		vector(j + k - 1) += (str2num(a(l_a - j + 1)) * str2num(b(l_b - k + 1)));
	endfor 
	%a si b se parcurg de la sfarsit la inceput, iar v de la 1 la sfarsit
endfor 
%in vector am numere de 1 sau 2 cifre

for i = 1 : lungime_vector 
	%le fac pe toate de o cifra si adaug transportul spre dreapta
	%vectorul este scris invers (ca numar)
	vector(i) += T; 
	T = floor(vector(i) / 10); 
	%transportul e partea intreaga din impartirea la 10
	vector(i) = mod(vector(i), 10);
endfor

string = ''; 
%string gol care va salva solutia

for i = 1 : lungime_vector
	string = [num2str(vector(i)) string]; 
	%concatenez fiecare element la stanga
	%inversez vectorul
endfor 

if(T != 0)
	string = [num2str(T) string]; 
	%daca ramane un transport se adauga primul in string
endif

x = string;

endfunction
