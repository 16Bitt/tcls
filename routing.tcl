#Routing configuration for TCLS

#This is the globa routing dictionary
#The key is the intercepted path, the value is where we want to redirect
set ROUTES [dict create]

#Add a new route
proc route {src dest} {
	global ROUTES
	dict append ROUTES $src $dest
}

#This finds a valid URL for a given path
proc resolvePath {path} {
	global ROUTES

	if {[dict exists $ROUTES $path]} {
		puts "ROUTE: $path -> [dict get $ROUTES $path]"
		return [dict get $ROUTES $path]
	}
	
	if {![file exists "./$path"] || ![file isfile "./$path"]} {
		puts "ROUTE: $path -> 404 not found"
		return [resolvePath "/404"]
	}

	return $path
}
