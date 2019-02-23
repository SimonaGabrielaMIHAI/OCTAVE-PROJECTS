function x = multiple_encode(str)

index = 1;
r = '';
while(index <= length(str))
	while(index <= length(str) && str(index) != ' ') 
		%parcurg pana la spatiu
		r = [r morse_encode(str(index))];
		r = [r ' '];
		index++;
	endwhile	
	index++;

	%r = [r ' ']; 
	%aceasta linie este pentru spatiu suplimentar intre cuvinte
	%am zis sa o las comentata totusi

endwhile

x = r;
endfunction
