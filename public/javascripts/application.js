// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

/*
 Jquery and Rails powered default application.js
 Easy Ajax replacement for remote_functions and ajax_form based on class name
 All actions will reply to the .js format
 Unostrusive, will only works if Javascript enabled, if not, respond to an HTML as a normal link
 respond_to do |format|
 format.html
 format.js {render :layout => false}
 end
 */

jQuery.ajaxSetup({ 'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} })

// function _ajax_request(url, data, callback, type, method) {
//     if (jQuery.isFunction(data)) {
//         callback = data;
//         data = {};
//     }
//     return jQuery.ajax({
//         type: method,
//         url: url,
//         data: data,
//         success: callback,
//         dataType: type
//         });
// }
// 
// jQuery.extend({
//     put: function(url, data, callback, type) {
//         return _ajax_request(url, data, callback, type, 'PUT');
//     },
//     delete_: function(url, data, callback, type) {
//         return _ajax_request(url, data, callback, type, 'DELETE');
//     }
// });

/*
 Submit a form with Ajax
 Use the class ajaxForm in your form declaration
 <% form_for @comment,:html => {:class => "ajaxForm"} do |f| -%>
 */
// jQuery.fn.submitWithAjax = function() {
//   this.unbind('submit', false);
//   this.submit(function() {
//     $.post(this.action, $(this).serialize(), null, "script");
//     return false;
//   })
// 
//   return this;
// };

/*
 Retreive a page with get
 Use the class get in your link declaration
 <%= link_to 'My link', my_path(),:class => "get" %>
 */
// jQuery.fn.getWithAjax = function() {
//   this.unbind('click', false);
//   this.click(function() {
//     $.get($(this).attr("href"), $(this).serialize(), null, "script");
//     return false;
//   })
//   return this;
// };

/*
 Post data via html
 Use the class post in your link declaration
 <%= link_to 'My link', my_new_path(),:class => "post" %>
 */
// jQuery.fn.postWithAjax = function() {
//   this.unbind('click', false);
//   this.click(function() {
//     $.post($(this).attr("href"), $(this).serialize(), null, "script");
//     return false;
//   })
//   return this;
// };

/*
 Update/Put data via html
 Use the class put in your link declaration
 <%= link_to 'My link', my_update_path(data),:class => "put",:method => :put %>
 */
// jQuery.fn.putWithAjax = function() {
//   this.unbind('click', false);
//   this.click(function() {
//     $.put($(this).attr("href"), $(this).serialize(), null, "script");
//     return false;
//   })
//   return this;
// };

/*
 Delete data
 Use the class delete in your link declaration
 <%= link_to 'My link', my_destroy_path(data),:class => "delete",:method => :delete %>
 */
// jQuery.fn.deleteWithAjax = function() {
//   this.removeAttr('onclick');
//   this.unbind('click', false);
//   this.click(function() {
//     $.delete_($(this).attr("href"), $(this).serialize(), null, "script");
//     return false;
//   })
//   return this;
// };

/*
 Ajaxify all the links on the page.
 This function is called when the page is loaded. You'll probaly need to call it again when you write render new datas that need to be ajaxyfied.'
 */
// function ajaxLinks(){
//     $('.ajaxForm').submitWithAjax();
//     $('a.get').getWithAjax();
//     $('a.post').postWithAjax();
//     $('a.put').putWithAjax();
//     $('a.delete').deleteWithAjax();
// }


//APPLICATION SPECIFIC FUNCTIONS
function initialiseNewRoleDialog()
    //function to get the dialog box to pop up, setup done here too
{
    $.fx.speeds._default = 1000;
    $('#role_dialog').dialog({autoOpen:false, height: 400, width: 400,  modal:true,
        buttons:{
            Cancel:function() {
                $(this).dialog('close');
            },
            'Add Role':function() {
                $('#add_new_role_form').submit();
                $(this).dialog('close');
            }
        }
    });

    //clicking on the new_role link will cause modal dialog to pop up

    $('#new_role_link').livequery(function() {
        $(this).click(function(){
            $('#role_dialog').dialog("open");
        });
        //$('#add_new_role_form')[0].reset();
    });

}

//APPLICATION SPECIFIC FUNCTIONS
function initialiseNewStatusDialog()
    //function to get the dialog box to pop up, setup done here too
{
    $.fx.speeds._default = 1000;
    $('#status_dialog').dialog({autoOpen:false, height: 400, width: 400,  modal:true,
        buttons:{
            Cancel:function() {
                $(this).dialog('close');
            },
            'Add Status':function() {
                $('#add_new_status_form').submit();
                $(this).dialog('close');
            }
        }
    });

    //clicking on the new_role link will cause modal dialog to pop up

    $('#new_role_link').livequery(function() {
        $(this).click(function(){
            $('#role_dialog').dialog("open");
        });
        //$('#add_new_role_form')[0].reset();
    });

}

//function for outputting messages as Growl-style
function growlMe(output,notice_type)
{
    // Create a new notification (5 second timeout)

    var theclass = 'achtungSuccess';
    if (notice_type == 'error')
        theclass = 'achtungFail';

    noticeid = $.achtung({
        className: theclass ,
        message: output,
        timeout:2
    });

}

function savingNewRoleDialog()
{
    var options = {
        //target:        '#output1',   // target element(s) to be updated with server response
        //beforeSubmit:  showRequest,  // pre-submit callback
        success:       showResponse,  // post-submit callback

        // other available options:
        //url:       url         // override for form's 'action' attribute
        //type:      type        // 'get' or 'post', override for form's 'method' attribute
        dataType:  'script'        // 'xml', 'script', or 'json' (expected server response type) 
        //clearForm: true        // clear all form fields after successful submit
        //resetForm: true        // reset the form after successful submit

        // $.ajax options can be used here too, for example:
        //timeout:   3000
    };
    // bind 'myForm' and provide a simple callback function
    $('#add_new_role_form').ajaxForm(options);

    function showResponse(responseText, statusText, xhr, $form)  {
        // for normal html responses, the first argument to the success callback
        // is the XMLHttpRequest object's responseText property

        // if the ajaxForm method was passed an Options Object with the dataType
        // property set to 'xml' then the first argument to the success callback
        // is the XMLHttpRequest object's responseXML property

        // if the ajaxForm method was passed an Options Object with the dataType
        // property set to 'json' then the first argument to the success callback
        // is the json data object returned by the server
        growlMe('New role inserted');
        //alert('status: ' + statusText + '\n\nresponseText: \n' + responseText +
        //   '\n\nThe output div should have already been updated with the responseText.');
    }
}

//DOM STARTS HERE

$(document).ready(function() {
    // do stuff when DOM is ready
    var noticeid;

    $("ul.sf-menu").superfish({
        delay:       1000,                            // one second delay on mouseout
        animation:   {opacity:'show',height:'show'},  // fade-in and slide-down animation
        speed:       'fast'                          // faster animation speed

    });

    //setting tablesorter
    //$('.tablesorter').tablesorter();
    $('.tableformat').colorize({altColor:'#ECF6FC' ,
        bgColor:'#EAF6CC',
        hoverColor:'#658093',
        hiliteColor:'#ffcccc',
        oneClick:'true'});

    $('#click').click(function(){

        // Create a new notification (5 second timeout)
        // noticeid = $.achtung({
        //          message: 'title',
        //          timeout:3})
        growlMe('Test me for all that you want. I want to try a bigger paragraph.');
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

    /*call new role modal dialog*/
    initialiseNewRoleDialog();
    savingNewRoleDialog();
});
