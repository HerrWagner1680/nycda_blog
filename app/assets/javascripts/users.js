


$(document).ready(function() { 

$(window).bind('keydown', function(event) {
    if (event.ctrlKey || event.metaKey) {
        switch (String.fromCharCode(event.which).toLowerCase()) {
        case 'h':
            event.preventDefault();
            window.location.href = "/users";
            break;
        case 'n':
            event.preventDefault();
            alert('ctrl-n');
            break;
        case 'c':
            event.preventDefault();
            window.location.href = "/communities";
            break;
   //      case 'l':
   //          // event.preventDefault();

			// $.ajax({
			//   type: "DELETE",
			//   url: "/sessions",
			// })
			//   .complete(function( ) {
			//     alert( "Successfully Logged Out" );
			//   });
			//   break;
			 
        }
    }
});

$("button").on('click',function(){ $(".grayzone").show()});
$(".grayzone").on('click',function(){ $(".grayzone").hide()});


});
