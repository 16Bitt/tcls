#Configuration for the server goes here

puts "Loading TCLS configuration..."

puts "Loading routes..."
#Routes
route /404	/404.html
route /		/test.html

puts "Loading extensions..."
#Extensions
extension ico	"image/ico"
extension jpg	"image/jpeg"
extension gif	"image/gif"
extension html	"text/html"
extension js	"text/javascript"
extension css	"text/css"

puts "Moving to server content directory..."
#Move to server directory
cd content

puts "Done."
