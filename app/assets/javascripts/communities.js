
// $(document).ready(function() { 
//  $("button").on('click',function(){ $(".grayzone").show()});
//  $(".grayzone").on('click',function(){ $(".grayzone").hide()});
// // $( "button" ).on('click',function(){ $(".grayzone").toggle( showOrHide );   
//  });


// another way to toggle visibility of menu

(function($) {
    $.fn.invisible = function() {
        return this.each(function() {
            $(this).css("visibility", "hidden");
        });
    };
    $.fn.visible = function() {
        return this.each(function() {
            $(this).css("visibility", "visible");
        });
    };
}(jQuery));

$("div").invisible();