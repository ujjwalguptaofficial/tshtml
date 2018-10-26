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

