function x = morse_encode(c)

arbore = morse();

litera = toupper(c); 
%transform in litera mare indiferent de input

a = 2;
b = 2;
c = 2;
d = 2;
%variabile de parcurgere

x = ''; 
%initializez x, string gol

stop = 0; 
%variabila de oprire

for i = 1:4
	s(i) = 0;
endfor
%vector ce salveaza calea pana la litera

while (a < 4 && stop == 0)
	b = 2;
	while (b < 4 && stop == 0)
		c = 2;
		while (c < 4 && stop == 0)
			d = 2;
			while (d < 4 && stop == 0)
				if(isempty(arbore{a}) == 0) 
					arbore = arbore{a};
					s(1) = a;
				endif
				if(arbore{1} == litera) 
					stop = 1; 			
					%schimb variabila de oprire si se iese din 
					%while-ul curent, urmand sa se iasa si din restul
					break;
				endif

				if(isempty(arbore{b}) == 0) 
					arbore = arbore {b};
					s(2) = b;
				endif
				if(arbore{1} == litera) 
					stop = 1;
					break;
				endif

				if(isempty(arbore{c}) == 0) 
					arbore = arbore {c};
					s(3) = c;
				endif
				if(arbore{1} == litera) 
					stop = 1;
					break;
				endif

				if(isempty(arbore{d}) == 0) 
					arbore = arbore {d};
					s(4) = d;
				endif
				if(arbore{1} == litera) 
					stop = 1;
					break;
				endif

				
				arbore = morse();
				%se revine in radacina, se sterge drumul anterior din vector
				s(1) = 0;
				s(2) = 0;
				s(3) = 0;
				s(4) = 0;
				d++;
			endwhile
			c++;
		endwhile
		b++;
	endwhile
	a++;
endwhile
%verific fiecare celula, pe fiecare drum posibil, pana cand gasesc litera cautata

for i = 1:4
	if(s(i) == 2) x = [x '.'];
	endif
	if(s(i) == 3) x = [x '-'];
	endif
endfor
%afisez in functie de coordonatele salvate in vector

endfunction
