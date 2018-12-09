var http = require("http");
setInterval(function() {
    http.get("http://cors-events.herokuapp.com");
}, 300000); 
