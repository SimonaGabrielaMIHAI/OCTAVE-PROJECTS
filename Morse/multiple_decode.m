function x = multiple_decode(sir)

index = 1;
%variabila de parcurgere a vectorului

aux = '';
%sir ce retine fiecare reprezentare pentru o litera

r = '';
%sir in care salvez raspunsul

while(index <= length(sir)) 
	%parcurge tot sirul
	while(index <= length(sir) && sir(index) != ' ') 
		%parcurge fiecare reprezentare a literei
		aux = [aux sir(index)];
		index++;
	endwhile

	r = [r morse_decode(aux)];
	%concatenez raspunsul fara spatii

	index++; 
	%sar peste spatiu

	aux = ''; 
	%golesc aux
endwhile

x = r;
endfunction
