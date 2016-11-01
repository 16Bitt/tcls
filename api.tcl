#This file contains how we route and handle POST requests for APIs

set apiRoutes [dict create]

#Add a new route for our API handler
proc addApi {path cmd} {
	global apiRoutes
}

#Resolve API request to the correct handler
proc resolveApi {path} {
	global apiRoutes
}

#Read JSON from an API request
proc getApiRequest {channel reqInfo} {
	
}

#Send our content back in JSON form
proc sendApiRequest {channel dictionary} {

}
