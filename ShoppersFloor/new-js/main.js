$(document).ready(function () {

    $('#cssmenu > ul > li:has(ul)').addClass("has-sub");

    $('#cssmenu > ul > li > a').click(function () {
        var checkElement = $(this).next();

        $('#cssmenu > ul > li:has(ul)').removeClass("has-sub");
     //   $('#cssmenu li').removeClass('active');
       // $(this).closest('li').addClass('active');


        if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
            $(this).closest('li').addClass('active');
            checkElement.slideUp('normal');
        }

        if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
            $('#cssmenu ul ul:visible').slideUp('normal');

            $(this).closest('li').removeClass('active');
            $('#cssmenu > ul > li:has(ul)').addClass("has-sub");
            checkElement.slideDown('normal');
        }

        if (checkElement.is('ul')) {
            return false;
        } else {
            return true;
        }
    });

});