#Simple HTTP server implementation

source "./http.tcl"
source "./security.tcl"
source "./routing.tcl"
source "./contentTypes.tcl"
source "./config.tcl"

proc handleRequest {channel path} {
	set path [resolvePath $path]
	set ctype [getType $path]
	writeFile $channel "./$path" "$ctype" "200 OK"
}

proc sockServer {channel client port} {
	set reqDict [readHeader $channel]
	handleRequest $channel [dict get $reqDict path]
	close $channel
}

proc serverUp {} {
	socket -server sockServer 8000
	vwait forever
}

serverUp
