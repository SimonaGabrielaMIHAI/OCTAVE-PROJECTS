function x = suma_vectori(a, b)

T = 0;

l_a = length(a);
l_b = length(b);

if(l_a > l_b)
	for s = (l_b + 1) : l_a
		b = ['0' b];
	endfor	
	l_b = l_a;

	else
		for s = (l_a + 1) : l_b
			a = ['0' a];
		endfor
		l_a = l_b;
endif
%adaug 0 in string-uri ca sa le fac de aceeasi lungime si sa adun element cu element
%0 nu conteaza la adunare

for i = l_a : -1 : 1 
	%parcurg string-urile de la sfarsit la inceput, la fel si vectorul
	
	vector(i) = str2num(a(i)) + str2num(b(i)) + T; 
	%adun element cu element + transportul
	
	T = floor(vector(i) / 10); 
	%transportul devine numarul fara ultima cifra
	
	vector(i) = mod(vector(i), 10); 
	%in vector ramane doar ultima cifra
endfor

string = ''; 
%string gol
for i = 1 : l_a
	string = [string num2str(vector(i))]; 
	%vectorul nu este inversat, deci concatenez la dreapta
endfor

if(T != 0)
	string = [num2str(T) string]; 
	%ultimul transport se adauga primul, la stanga
endif

x = string;
endfunction
