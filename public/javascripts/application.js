// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

/*
 from: http://www.notgeeklycorrect.com/english/2009/05/18/beginners-guide-to-jquery-ruby-on-rails/
 Jquery and Rails powered default application.js
 Easy Ajax replacement for remote_functions and ajax_form based on class name
 All actions will reply to the .js format
 Unostrusive, will only works if Javascript enabled, if not, respond to an HTML as a normal link
 respond_to do |format|
 format.html
 format.js {render :layout  => false}
 end
 */

jQuery.ajaxSetup({ 'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} })

function _ajax_request(url, data, callback, type, method) {
    if (jQuery.isFunction(data)) {
        callback                 = data;
        data                     = {};
    }
    return jQuery.ajax({
        type: method,
        url: url,
        data: data,
        success: callback,
        dataType: type
    });
}

jQuery.extend({
    put: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'PUT');
    },
    delete_: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'DELETE');
    }
});

/*
 Submit a form with Ajax
 Use the class ajaxForm in your form declaration
 <% form_for @comment,:html => {:class => "ajaxForm"} do |f| -%>
 */
jQuery.fn.submitWithAjax  = function() {
    this.unbind('submit', false);
    this.submit(function() {
        $.post(this.action, $(this).serialize(), null, "script");
        return false;
    })

    return this;
};

/*
 Retreive a page with get
 Use the class get in your link declaration
 <%= link_to 'My link', my_path(),:class => "get" %>
 */
jQuery.fn.getWithAjax      = function() {
    this.unbind('click', false);
    this.click(function() {
        $.get($(this).attr("href"), $(this).serialize(), null, "script");
        return false;
    })
    return this;
};

/*
 Post data via html
 Use the class post in your link declaration
 <%= link_to 'My link', my_new_path(),:class => "post" %>
 */
jQuery.fn.postWithAjax     = function() {
    this.unbind('click', false);
    this.click(function() {
        $.post($(this).attr("href"), $(this).serialize(), null, "script");
        return false;
    })
    return this;
};

/*
 Update/Put data via html
 Use the class put in your link declaration
 <%= link_to 'My link', my_update_path(data),:class => "put",:method => :put %>
 */
jQuery.fn.putWithAjax      = function() {
    this.unbind('click', false);
    this.click(function() {
        $.put($(this).attr("href"), $(this).serialize(), null, "script");
        return false;
    })
    return this;
};

/*
 Delete data
 Use the class delete in your link declaration
 <%= link_to 'My link', my_destroy_path(data),:class => "delete",:method => :delete %>
 */
jQuery.fn.deleteWithAjax   = function() {
    this.removeAttr('onclick');
    this.unbind('click', false);
    this.click(function() {
        var del = true;
        if($(this).attr('delete_text').length > 0)
            del = confirm($(this).attr("delete_text"));
        if(del)
        {
            $.delete_($(this).attr("href"), $(this).serialize(), null, "script");
            return false;
        } else {
            //they clicked no.
            return false;
        }
    })
    return this;
};

/*
 Ajaxify all the links on the page.
 This function is called when the page is loaded. You'll probaly need to call it again when you write render new datas that need to be ajaxyfied.'
 */
function ajaxLinks(){
    $('.ajaxForm').livequery(function(){ $(this).submitWithAjax();});
    $('a.get').livequery(function(){ $(this).getWithAjax();});
    $('a.post').livequery(function(){ $(this).postWithAjax();});
    $('a.put').livequery(function(){ $(this).putWithAjax();});
    $('a.delete').livequery(function(){ $(this).deleteWithAjax();});
}

/*
 INITIALISE THE COLLAPSIBLE PANELS

 */
function initialisePanels()
{
    $("div.panel-accordion").addClass("ui-accordion ui-accordion-icons ui-widget ui-helper-reset")
            .find("h3")
            .addClass("ui-accordion-header ui-helper-reset ui-state-default ui-corner-top ui-corner-bottom")
            .hover(function() { $(this).toggleClass("ui-state-hover"); })
            .prepend('<span class="ui-icon ui-icon-triangle-1-e"></span>')
            .click(function() {
        $(this)
                .toggleClass("ui-accordion-header-active ui-state-active ui-state-default ui-corner-bottom")
                .find('span .ui-icon').toggleClass("ui-icon-triangle-1-e ui-icon-triangle-1-s").end()
                .next().toggleClass("ui-accordion-content-active").slideToggle();
        return false;
    })
            .next()
            .addClass("ui-accordion-content  ui-helper-reset ui-widget-content ui-corner-bottom")
            .hide();

}


//APPLICATION SPECIFIC FUNCTIONS
function initialiseNewRoleDialog()
    //function to get the dialog box to pop up, setup done here too
{
    $('#role_dialog').dialog('destroy');
    $.fx.speeds._default     = 1000;
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

    //clicking on the new_role link will cause modal dialog to pop ups
    $('#new_role_link').livequery(function() {
        $(this).click(function(){
            $('#role_dialog').dialog("open");
        });
        //$('#add_new_role_form')[0].reset();
    });

}

//Nice little jQuery scroll to id of any element
function scrollToId(id){
    window.scrollTo(0,$("#"+id).offset().top);
}


//APPLICATION SPECIFIC FUNCTIONS
function initialiseNewStatusDialog()
    //function to get the dialog box to pop up, setup done here too
{
    $.fx.speeds._default    = 1000;
    $('.hidden_dialog').dialog({autoOpen:false,
        //height: 400,
        //width: 400,
        modal:true,
        buttons:{
            OK:function() {
                $(this).dialog('close');
            }// ,
            // 		'Add Status':function() {
            // 			$('#add_new_status_form').submit();
            // 			//$(this).dialog('close');
            // 		}
        }
    });

    //setting the edit_common_name dialog box
    // $('#edit_common_name').dialog({modal : true});
    //hiding the edit common_name div on load
    // $('#edit_common_name').hide();

    //    $('.edit_common').livequery(function(){
    //        $(this).click(function(){
    //           $('#add_common_name').hide('slow');
    //           $('#edit_common_name').show('slow');
    //            scrollToId('edit_common_name');
    //        });
    //    });

    //clicking on the new_role link will cause modal dialog to pop up
    $('#add_new_status_link').livequery(function() {
        $(this).click(function(){
            $(".add_new_tag_form")[0].reset();
            $('#status_dialog').dialog("open");
        });
    });

    //clicking on the new_role link will cause modal dialog to pop up
    $('#add_new_rank_link').livequery(function() {
        $(this).click(function(){
            $(".add_new_tag_form")[0].reset();
            $('#rank_dialog').dialog("open");
        });
    });
}

//FUNCTION TO PREVENT FORM SUBMIT ON ENTER
function detectKeypress()
{
    $('form input, form textarea').keypress(function(event) {
        //alert("here");
        if (event.which == 13)
        {
            //alert('Handler for .keypress() called.' + event.which);
            event.preventDefault();
            //event.keyCode = 9;
            return false;
        }
    });
}

//function for outputting messages as Growl-style
function growlMe(output,notice_type)
{
    // Create a new notification (5 second timeout)

    var theclass  = 'achtungSuccess';
    if (notice_type == 'error')
        theclass      = 'achtungFail';

    noticeid = $.achtung({
        className: theclass ,
        message: output,
        timeout:2
    });

}

function savingNewRoleDialog()
{
    var options             = {
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

function savingEditStatusDialog()
{
    var options             = {
        success:   showResponse,  // post-submit callback
        dataType:  'script',       // 'xml', 'script', or 'json' (expected server response type)
        clearForm: true        // clear all form fields after successful submit
        //resetForm: true        // reset the form after successful submit

        // $.ajax options can be used here too, for example:
        //timeout:   3000
    };
    // bind 'myForm' and provide a simple callback function
    $('.edit_tag_form').ajaxForm(options);

    function showResponse(responseText, statusText, xhr, $form)  {
        growlMe('Status updated!');
        $('.edit_tag_div').hide('slow');
        //alert('status: ' + statusText + '\n\nresponseText: \n' + responseText +
        //   '\n\nThe output div should have already been updated with the responseText.');
    }
}


function savingNewStatusDialog()
{
    var options             = {
        success:   showResponse,  // post-submit callback
        dataType:  'script',       // 'xml', 'script', or 'json' (expected server response type)
        clearForm: true        // clear all form fields after successful submit
        //resetForm: true        // reset the form after successful submit

        // $.ajax options can be used here too, for example:
        //timeout:   3000
    };
    // bind 'myForm' and provide a simple callback function
    $('.add_new_tag_form').ajaxForm(options);

    function showResponse(responseText, statusText, xhr, $form)  {
        growlMe('New status inserted');
        $('.add_tag_div').hide('slow');
        //alert('status: ' + statusText + '\n\nresponseText: \n' + responseText +
        //   '\n\nThe output div should have already been updated with the responseText.');
    }
}


function savingNewComment()
{
    var options             = {
        success:   showResponse,  // post-submit callback
        dataType:  'script',       // 'xml', 'script', or 'json' (expected server response type)
        clearForm: true        // clear all form fields after successful submit

    };
    // bind 'myForm' and provide a simple callback function
    $('.add_new_comment_form').ajaxForm(options);

    function showResponse(responseText, statusText, xhr, $form)  {
        growlMe('New comment inserted');

    }
}

function ajaxifySavingForm()
{
    var options             = {
        success:   showResponse,  // post-submit callback
        dataType:  'script',       // 'xml', 'script', or 'json' (expected server response type)
        clearForm: true        // clear all form fields after successful submit

    };
    // bind 'myForm' and provide a simple callback function
    $('.ajaxify_form').ajaxForm(options);

    function showResponse(responseText, statusText, xhr, $form)  {
        //growlMe('New Common Name inserted');

    }
}

//JQUERY UI AUTOCOMPLETE
function autocompleteCommonNames2()
{


    $('#common_name_name').livequery(function(){

        $(this).autocomplete({
            minLength: 0,
            source:"/common_names/get_common_names/1" ,
            //			focus: function(event, ui) {
            //				$('#project').val(ui.item.label);
            //				return false;
            //			},
            select: function(event, ui) {
                //alert(ui.item.common_name.name);
                $(this).val(ui.item.name);
                return false;
            }
        })
                .data( "autocomplete" )._renderItem = function( ul, item ) {
            //alert(item[0].common_name.name)
            return $( "<li></li>" )
                    .data( "item.autocomplete", item )
                    .append( "<a>" + item.name + " - " + item.name + "</a>" )
                    .appendTo( ul );
        };
    });

}

//COMMON NAME INITIALISATIONS
function commonNameInit()
{
    $('#cancel_common_name_edit').livequery(function(){
        $(this).click(function(){
            var form_submit = $(this).offsetParent().find('form');
            form_submit.effect("highlight", {}, 3000);
            form_submit.attr('action',"/taxon_concepts/cancel_common_name/1");
            form_submit.submit();
        });
    });

}

//Before attaching a TaxonConcept to another one, first check
//if it is not already attached
function checkNodeBeforeAttach(node, taxon_concept)
{
    var is_child = false;
   $.ajax({
            url:"/rank_tree/check_node_status",
            dataType : 'json',
            async : false,
            data : {operation : "get_children",
                    parent : node.attr('id'),
                    child : taxon_concept},
            success: function(json){
                          growlMe("from getJSON:" + json,null);
                        is_child = json;

                    }
    });
     //   alert(is_child);
     return is_child;

}

//attaching a taxonconcept to another node in the Tree
function attachChildToNode(node)
{
    var taxon_concept = $('#taxon_parent').val();
    growlMe(taxon_concept,null);
    $.ajax({
        url : "/rank_tree/add_child_to_node",
        dataType : 'script',
        data : {
            operation : "get_children",
            parent : node.attr('id'),
            child : taxon_concept
        }  ,

        beforeSend : function(data, textStatus, XMLHttpRequest)
        {
            //alert (textStatus);
            var is_child = checkNodeBeforeAttach(node, taxon_concept);

            growlMe("in beforesend:" + is_child,null);
            //checkBeforeAttach();
            if (is_child)
                return confirm($('#taxon_tree').jstree("get_text",node) + ' is already attached to a another Taxon. Are you sure you want to continue?');

            return false;
        },
        success : function(data, textStatus, XMLHttpRequest)
        {
            //alert (textStatus);
        }
    });
}

//FUNCTION TO RETRIEVE THE RANK OF THE TAXONCONCEPT ON HOVER
function getTaxonNodeRank(node)
{
    var rank = undefined;
    $.getJSON("/rank_tree/get_node_rank",
    {node_id : node},
            function(json){
                growlMe('rank:' + json, null);
                rank = json;}
            );
    return rank;
}

function initialiseTaxonTree()
{
    $.jstree._themes = RAILS_ROOT + "/stylesheets/jstree/themes/";

    $('#taxon_tree').bind("loaded.jstree", function  (event, data) {
        growlMe("tree is loaded",null);
    })
            .bind("open_node.jstree close_node.jstree", function  (e) {
        growlMe(e.type,null);
    })
            .bind("select_node.jstree", function(event, data) {

        var href = data.rslt.obj.attr("href");
        var path = window.location.href.toLowerCase();

        //alert(data.inst.get_text(data.rslt.obj));
        // growlMe(data.inst.get_text(data.rslt.obj)) ;

        var nodeId = data.rslt.obj.attr("id");

        growlMe(data.inst.get_text(data.rslt.obj) + ': id =' + nodeId + '',null) ;

    })
            .bind("hover_node.jstree", function(event, data) {

        var href = data.rslt.obj.attr("href");
        var path = window.location.href.toLowerCase();

        //data.rslt.obj.find('a').tipsy({title : 'href',fade:true, gravity: $.fn.tipsy.autoNS , opacity:0.8, delayIn:0, delayOut:200});
        //alert(data.inst.get_text(data.rslt.obj));
        //growlMe(data.rslt.obj.find('a').attr('href')) ;

        var nodeId = data.rslt.obj.attr("id");
        var rank = getTaxonNodeRank(nodeId);

        growlMe(data.inst.get_text(data.rslt.obj) + ': id =' + nodeId + ', :href = ' + href + ', rank = ' + rank) ;

    })

        .jstree({
        "themes" : {
            "theme" : "default",
            "dots" : true,
            "icons" : true
        },
        "contextmenu":{
            "items" :function (node) {
                //NEED TO IMPLEMENT SELECTIVE NODE RIGHT-CLICK
                growlMe((node.attr('id')) + '--' + this.get_text(node) ,null);
                return {
                    // the context menu object here
                    'refresh':{
                        label: 'Refresh',
                        action : function (obj) {
                            this.refresh(obj) },

                        "separator_before"	: false,	// Insert a separator before the item
                        "separator_after"	: false		// Insert a separator after the item
                        //                        submenu			: {
                        //                            'test' : {
                        //                                label : 'Test',
                        //                                action : function (obj){
                        //                                    growlMe ('You are in test',null);
                        //                                }
                        //                            }
                        //                        }
                        /* Collection of objects (the same structure) */
                    }  ,
                    // the context menu object here
                    'attach':{
                        label: 'Attach here',
                        action : function (obj) {
                            growlMe(obj.attr('id'),null);
                            attachChildToNode(obj);
                        //    this.refresh(obj)
                        },
                        "separator_before"	: false,	// Insert a separator before the item
                        "separator_after"	: false		// Insert a separator after the item
                    }

                }
            }
        },

        "json_data" : {
            correct_state : true,
            "data" : [
                {
                    attr : { id : "ranks"},
                    state: 'closed',
                    icon : "folder",
                    data : {title : "Ranks", attr : { href : "#" }}
                }
            ],
            "ajax" :{
                url : "/rank_tree/get_ranks_jstree2",
                data : function  (n) {
                    return {
                        operation : "get_children",
                        id : n.attr ? n.attr("id") : 0 };
                }  ,
                success : function(data, textStatus, XMLHttpRequest)
                {
                    //alert (textStatus);
                }
            }
        },

        "plugins" : [ "themes", "json_data", "ui","crrm","contextmenu" ]

    });

    $("#tree").dynatree({
        onActivate: function(dtnode) {
            // A DynaTreeNode object is passed to the activation handler
            // Note: we also get this event, if persistence is on, and the page is reloaded.
            growlMe("You activated " + dtnode.data.title,null);
            // alert("You activated " + dtnode.data.title);
        },
        onLazyRead: function(dtnode){
            dtnode.appendAjax({url: "/rank_tree/get_ranks",
                data: {"key": dtnode.data.key, // Optional url arguments
                    "mode": "all"
                },
                success: function(dtnode) {
                    // Called after nodes have been created and the waiting icon was removed.
                    // 'this' is the options for this Ajax request
                    //alert(dtnode);
                },
                error: function(dtnode, XMLHttpRequest, textStatus, errorThrown) {
                    // Called on error, after error icon was created.
                },
                cache: false // Append random '_' argument to url to prevent caching.
            });
        },

        persist: true,
        children: [ // Pass an array of nodes.
            {title: "Folder 2",
                isFolder: true,
                children: [
                    {title: "Sub-item 2.1"},
                    {title: "Sub-item 2.2"}
                ]
            },
            {title: "Ranks", key : "ranks", isLazy :true, isFolder : true, state : "closed"}
        ]
    });


    $("#tree2").jstree({
        "json_data" : {"data" : [
            {
                "data" : "A aaanode",
                "children" : [ "Child 1", "Child 2" ]
            },
            {
                "attr" : { "id" : "li.node.id" },
                "data" : {
                    "title" : "Long format demo",
                    "attr" : { "href" : "#" }
                }
            }
        ]
        },
        "plugins" : [ "themes", "json_data" ]
    });

}

//AUTOCOMPLETE FOR COMMON_NAMES
function autocompleteCommonNames()
{

    $('#common_name_name').livequery(function(){

        $(this).autocomplete("/common_names/get_common_names/1",
        {
            dataType: 'json',
            width: 320,
            max: 20,
            highlight: false,
            scroll: true,
            scrollHeight: 300,

            parse: function(data) {
                //alert('in parse : ' + data.length );
                var rows = new Array();
                for (var i = 0; i < data.length; i++)
                {
                    rows[i] = { data: data[i], value: data[i].name, result: data[i].name };
                    //alert(data[i].toString() + ':' + data[i][0])
                }
                return rows;

            },
            formatItem: function(row, i,n, max) {
                // alert('test: ' + max + ':' + i + row.common_name.name);
                return row.name + " <" + row.name + ">";
            },
            formatResult: function(data, value) {
                //alert('in format result');
                //return value.split(".")[0];
                return data.name;
            }
        }).result(function(event, item, formatted) {
            //alert(item.common_name.name);
        });
    });

}


//INITIALISE VALUES
function initialiseControls()
{
    //Highlight current table row

    //setting autogrow to all textareas
    $('textarea').livequery(function(){
        $(this).elastic();

    });
    //setting the tabs in TaxonConcept to work
    $(".otherinfo-tabs").tabs(
    {
        collapsible: true

    }).find(".ui-tabs-nav").sortable({axis:'x'});

    //setting accordion on the TaxonConcept page
    //Hide (Collapse) the toggle containers on load
    $(".toggle_container").hide();

    //Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)

    $('.ui-accordion-header').livequery(function()
    {
        $(this).click(function(){

            $(this).siblings('.hideme').slideToggle();
            if ($(this).find('span').is('.ui-icon-triangle-1-s'))
            {
                $(this).children('span').removeClass('ui-icon-triangle-1-s').addClass('ui-icon-triangle-1-e');

            }
            else
            {
                $(this).find('span').removeClass('ui-icon-triangle-1-e').addClass('ui-icon-triangle-1-s');
            }
        });
    });


    //Using tipsy
    $('.tipsyme').tipsy({fade:true, gravity: $.fn.tipsy.autoNS , offset:10, opacity:0.8, delayIn:0, delayOut:200});

    // $("[title]").tooltip();
    $('.add_tag_div, .edit_tag_div').hide();
    //using tipTip
    $('.tipme').livequery(function(){
        $(this).tipTip({edgeOffset:10, delay :100});
    });


    $('#add_tag_button, .add_tag_class').livequery(function()
    {
        $(this).click(function()
        {
            //alert('click in ' + $(this).attr("id"));
            $('.add_tag_div').slideToggle();
            $('.edit_tag_div').hide();
        });
    });

    //This section is looking working with editing status
    $('.edit_tag_class').livequery(function()
    {
        $(this).click(function()
        {
            $('.edit_tag_div').show('slow');
            $('.add_tag_div').hide();
            //$('#taxon_concept_has_taxon_status').val($(this).attr("id"));
            var old_status = $(this).attr("id");
            //alert('value is: ' + old_status);
            $('.new_tag').val(old_status);
            $('.old_tag').val(old_status);
        });
    });
}

function TaxonConceptStatusRefresh(message)
{
    growlMe(message);
    $('.add_tag_div, .edit_tag_div').hide();

}

//DOM STARTS HERE

$(document).ready(function() {
    // All non-GET requests will add the authenticity token
    // if not already present in the data packet
    $(document).ajaxSend(function(event, request, settings) {
        if (typeof(window.AUTH_TOKEN) == "undefined") return;
        // <acronym title      = "Internet Explorer 6">IE6</acronym> fix for http://dev.jquery.com/ticket/3155
        if (settings.type == 'GET' || settings.type == 'get') return;

        settings.data  = settings.data || "";
        settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(window.AUTH_TOKEN);
    });


    // do stuff when DOM is ready
    var noticeid;

    $("ul.sf-menu").superfish({
        delay:       1000,                            // one second delay on mouseout
        animation:   {opacity:'show',height:'show'},  // fade-in and slide-down animation
        speed:       'fast'                          // faster animation speed

    });

    //setting tablesorter
    //$('.tablesorter').tablesorter();
    $('.tableformat').livequery(function(){
        $(this).colorize({altColor:'#ECF6FC' ,
            bgColor:'#EAF6CC',
            hoverColor:'#658093',
            hiliteColor:'#ffcccc',
            oneClick:'true'});
    });

    $('#click').click(function(){

        // Create a new notification (5 second timeout)
        // noticeid            = $.achtung({
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

    //setting the menu
    $('#potato_menu').ptMenu();

    //Ajaxify actions
    ajaxLinks();
    //Initialise controls in all application
    initialiseControls();

    /*call new role modal dialog*/
    initialiseNewRoleDialog();
    // Call the new status dialog
    initialiseNewStatusDialog();
    savingNewRoleDialog();
    savingNewStatusDialog();
    savingEditStatusDialog();
    savingNewComment();
    initialisePanels();
    //autocompleteCommonNames();
    autocompleteCommonNames2();
    //enterAsTab(document.forms.form, false);
    detectKeypress();
    commonNameInit();
    initialiseTaxonTree();
   // tiptipMe();

});
