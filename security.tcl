#These are strings that SHOULD NOT be in a URL
set INVALID_CHARACTERS [list .. ~]

#Check to see if a path is valid to avoid foolery
proc validatePath {path} {
	global INVALID_CHARACTERS
	foreach c $INVALID_CHARACTERS {
		
	}
}
