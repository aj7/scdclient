// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


function initialiseModalTestDialog()
{
	$.fx.speeds._default = 1000;
	$('#user_dialog').dialog({autoOpen: false, height: 250, width: 320,  modal:true});

    //clicking on the new_user link will cause modal dialog to pop up
	$('#new_user').livequery(function() {
                //e.preventDefault();
        $(this).click(function(){
				$('#user_dialog').dialog("open");	
				});
    });
}

function initialiseNewRoleDialog()
//function to get the dialog box to pop up, setup done here too
{
	$.fx.speeds._default = 1000;
	$('#new_role').dialog({autoOpen:false, height: 250, width: 320,  modal:true});

    //clicking on the new_user link will cause modal dialog to pop up
	$('#new_role').livequery('click',function(e) {
                e.preventDefault();
				$('#new_role').dialog("open");
				});
}

$(document).ready(function() {
    // do stuff when DOM is ready
    var noticeid;

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

	/*call modal dialog*/
	initialiseModalTestDialog();
    initialiseNewRoleDialog();
});
