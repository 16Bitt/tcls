#Content type handling for TCLS

set contentTypes [dict create]

proc extension {ext contype} {
	global contentTypes
	dict set contentTypes ".$ext" $contype
}

proc getExtension {path} {
	return [file extension $path]
}

proc getType {path} {
	global contentTypes
	set ext [getExtension $path]
	return [dict get $contentTypes "$ext"]
}

