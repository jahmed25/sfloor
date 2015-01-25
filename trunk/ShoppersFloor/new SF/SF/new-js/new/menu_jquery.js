jQuery( document ).ready(function() {
jQuery('#cssmenu > ul > li > a').click(function() {
  jQuery('#cssmenu li').removeClass('active');
  jQuery(this).closest('li').addClass('active');	
  var checkElement = jQuery(this).next();
  if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
    jQuery(this).closest('li').removeClass('active');
    checkElement.slideUp('normal');
  }
  if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
    jQuery('#cssmenu ul ul:visible').slideUp('normal');
    checkElement.slideDown('normal');
  }
  if(jQuery(this).closest('li').find('ul').children().length == 0) {
    return true;
  } else {
    return false;	
  }		
});
});


// Login Form
jQuery(function() {
    var button = jQuery('#loginButton');
    var box = jQuery('#loginBox');
    var form = jQuery('#loginForm');
    button.removeAttr('href');
    button.mouseup(function(login) {
        box.toggle();
        button.toggleClass('active');
    });
    form.mouseup(function() { 
        return false;
    });
    jQuery(this).mouseup(function(login) {
        if(!(jQuery(login.target).parent('#loginButton').length > 0)) {
            button.removeClass('active');
            box.hide();
        }
    });
});