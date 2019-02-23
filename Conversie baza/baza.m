function r = baza(sursa, b1, b2)

str_baza_putere = '';
str_baza_putere = ['1' str_baza_putere]; 
%string cu ridicarea la putere a bazei 1, puterea 0 fiind 1

str_baza1= num2str(b1); 
%fac conversia bazei 1 in string

if(b1 != 10) %in acest if trec sursa in baza 10 daca nu este deja
	lungime = length(sursa);
	nr_baza10 = cell(1,lungime);%creez un cell array, este o coloana cu "lungime" linii
		%salveaza inmultirea fiecarui element din sursa cu puterea corespunzatoare

	for i = lungime : -1 : 1 %parcurg invers sursa pentru a avea puterile crescatoare

		nr_baza10{i} = inmultire_vectori(str_baza_putere, myswitch(sursa(i))); 
		%trimit elementul ca string si functia face inmultirea cu numarul respectiv

		str_baza_putere = inmultire_vectori(str_baza_putere, str_baza1); 
		%inmultesc cu baza 1 pentru cresterea puterii cu 1
		
	endfor

	for i = 1 : (lungime-1) 
		%adun toate elementele salvate, 2 cate 2, 
		%incepand cu cele mai mari(ultimele adaugate)
		
		nr_baza10{i + 1} = suma_vectori(nr_baza10{i}, nr_baza10{i + 1}); 
		%salvez suma in al doilea element de adaugat

	endfor
	

	sursa = nr_baza10{lungime}; 
	%ultimul element devine suma totala, adica numarul in baza 10

endif

lungime = length(sursa);
ceva_cu_0 = '';
for i = 1 : lungime
	ceva_cu_0 = [ceva_cu_0 '0']; 
	%creez un string cu '0' ca sa pot sa compar cu sursa
endfor


str_baza_noua = cell(1,1); 
%aici este un singur string, dar mi-a placut sa folosesc cell :D

while(strcmp(ceva_cu_0, sursa) == 0) %cat timp sursa nu e 0, comparare cu string-uri
	R = 0; 
	for i = 1 : lungime
		R = 10 * R + str2num(sursa(i)); 
		%echivalent coborarii unei noi cifre la impartire
		sursa(i) = num2str(idivide(R, b2, "fix")); 
		%sursa devine catul si va fi impartita pana cand ajunge la 0
		R = mod(R, b2);
	endfor

	rest = num2str(R); 
	%am nevoie doar de restul final de la impartire pentru rezultatul final
	str_baza_noua{1} = [(newswitch(rest)) str_baza_noua{1}]; 
	%adaug restul in string-ul cu baza noua, mereu in fata
endwhile
r = str_baza_noua{1};


endfunction

