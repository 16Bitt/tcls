#Simple HTTP implementation

proc readHeader {channel} {
	#The first line will be similar to "GET /index.html HTTP/1.1"
	gets $channel line
	set verb [lindex $line 0]
	set path [lindex $line 1]
	set prot [lindex $line 2]

	#The second line will look like "Host: example.com"
	gets $channel line
	set client [lindex $line 1]
	
	#The last line will look like "Connection: close"
	gets $channel line
	set conAction [lindex $line 1]

	puts "$client request: $verb $path"

	set output [dict create "verb" "$verb" "path" "$path"]
	return $output
}

proc writeFile {channel path type code} {
	set curdate [clock seconds]
	puts $channel "HTTP/1.1 $code"
	puts $channel "Date: [clock format $curdate -gmt 1]"
	puts $channel "Server: TCLS (Linux)"
	puts $channel "Connection: close"
	puts $channel "Content-Type: $type"
	puts $channel ""
	
	set f [open $path r]
	set data [read $f]
	close $f

	set data [split $data "\n"]
	foreach line $data {
		puts $channel "$line"
	}
}
