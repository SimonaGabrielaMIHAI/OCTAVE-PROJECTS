function x = morse_decode(sir)

arbore = morse();
%initializez arborele

index = 1;
%variabila de parcurgere

while (index <= length(sir))

	if(sir(index) == '.') 

		if(isempty(arbore{2}) == 1) 
			%daca nu exista o celula pe ramura 
			%raspunsul e '*' si iese din functie
			x = '*';
			return;
		endif

		arbore = arbore{2}; 
		%trec la urmatoarea celula pe ramura
		else 
			%am presupus ca primesc doar '-' si '.' la input

			if(isempty(arbore{3}) == 1)
				x = '*';
				return;
			endif
			arbore = arbore{3};

	endif
	index++;
endwhile

x = arbore{1};
endfunction
