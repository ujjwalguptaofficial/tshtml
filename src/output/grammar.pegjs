value = (expression/html/code)*

html = NewLineOrSpace* word:Word NewLineOrSpace* {
	return word;
}


expression = NewLineOrSpace* At val:Word NewLineOrSpace*{
	return {ex:val};
}

code = NewLineOrSpace* At NewLineOrSpace* '{' NewLineOrSpace* val:Word NewLineOrSpace*'}' NewLineOrSpace* {
	return {
    	code:val
    }
}

NewLineOrSpace = (NewLine/Ws)

At = '@'

Word = l:Letter+ {return l.join("");}

Letter "Html tag"= [a-zA-Z0-9'"#*,; \t !~$+=/|\:.<>?-]

Digit=[0-9]

LineBreak "LineBreak" = [ \n];

NewLine = LineBreak+ {return null;}

Space "Whitespace" = [ \t];

Ws "One or more whitespaces" = space:Space+ {return null;}