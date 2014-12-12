


$(document).ready(function() { 

$(window).bind('keydown', function(event) {
    if (event.ctrlKey || event.metaKey) {
        switch (String.fromCharCode(event.which).toLowerCase()) {
      
		case 'h':
            event.preventDefault();
            window.location.href = "/users";
            break;
        case 'o':
            event.preventDefault();
            window.location.href = "/users/contact";
            break;
        case 'c':
            event.preventDefault();
            window.location.href = "/communities";
            break;
        case 'p':
            event.preventDefault();
            window.location.href = "/users/" + document.cookie.split("=")[1];
            break;
        case 'u':
            event.preventDefault();
            window.location.href = "/users/students";
            break;
        case 't':
            event.preventDefault();
            window.location.href = "/users/staff";
            break;
        case 'l':
            event.preventDefault();


			$.ajax({
			  type: "DELETE",
			  url: "/sessions",
			})
			  .complete(function( ) {
			    alert( "Successfully Logged Out" );
			  });
			  break;
			 
        }
    }
});

});
