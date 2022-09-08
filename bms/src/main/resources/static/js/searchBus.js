$(document).ready(function () {
    //Min Date
    var today = new Date();
    var dd = today.getDate() + 1;
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    today = yyyy + '-' + mm + '-' + dd;
    document.getElementById("travelDate").setAttribute("min", today);
    //Max Date
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 2;
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    today = yyyy + '-' + mm + '-' + dd;
    document.getElementById("travelDate").setAttribute("max", today);

    // Scroll to top on page reload
    $(this).scrollTop(0);

    // SET BOOLEAN
    var scrolled = false;

    //SCROLL
    $(window).on("scroll", function () {
        //SOCIAL ICONS
        if ($(this).scrollTop() > 150 && !scrolled) {
            $(".promise-heading").each(function (i) {
                // store the item around for use in the 'timeout' function
                var $item = $(this);
                // execute this function sometime later:
                $item.animate({
                    opacity: 1
                },
                    {
                        easing: 'swing',
                        duration: 1500,
                    });
                // each element should animate half a second after the last one.
            });
            $(".card").each(function (i) {
                // store the item around for use in the 'timeout' function
                var $item = $(this);
                // execute this function sometime later:
                setTimeout(function () {
                    $item.animate({
                        opacity: 1,
                        bottom: "0px"
                    },
                        {
                            // easing: 'swing',
                            duration: 1000,
                        })
                }, 500 * i);
                // each element should animate half a second after the last one.
            });
            scrolled = true;
        } else {
            scrolled = false;
        }
    });
})