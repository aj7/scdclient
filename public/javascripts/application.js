// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function() {
    // do stuff when DOM is ready
    var noticeid;


    //lavalamp stuff 
    //         $('ul#menu')
    //
    //                 .lavaLamp(
    //                 { fx: "easeOutBounce",
    //                    speed: 1000
    //                 }
    //                 );
    $("ul.sf-menu").superfish({
        delay:       1000,                            // one second delay on mouseout
        animation:   {opacity:'show',height:'show'},  // fade-in and slide-down animation
        speed:       'fast'                          // faster animation speed

    });


    $('#click').click(function(){

        // Create a new notification (5 second timeout)
            noticeid = $.achtung({
                message: 'title',
                timeout:3})
    });

    $('#changecolor').click(function()
    {

        if(noticeid)
        {
          //  noticeid.css({backgroundColor: '#455099'});
            noticeid.achtung('update', {message: "Message changed! " });
            noticeid.css({backgroundColor: '#455099'});
        }


    });


    //setting timeout for notice flash
    setTimeout( function()
    {
        $("#flash_notice").fadeOut("fast");
    }, 2000);

});
