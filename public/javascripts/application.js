// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function() {
   // do stuff when DOM is ready

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


      $('#admin').click(
              $.jGrowl("Stick this!", { life: 1000,
                                        sticky: false,
                                        header: 'Important'
                                        })

              ).addClass('jGrowl bottom-right');


 });
