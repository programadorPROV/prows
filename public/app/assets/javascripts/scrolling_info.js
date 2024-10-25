var lastScroll = 0;
jQuery(document).ready(function(e) {
    e(".itsmoving"), e(window).scroll(function() {
        setTimeout(function() {
            var t = e(window).scrollTop();
            t > lastScroll + 0 ? e(".itsmoving").removeClass("scrollingup") : lastScroll - 0 > t && e(".itsmoving").addClass("scrollingup"), lastScroll = t
        }, 0)
    })
}), $(document).ready(function() {
    var e = $(".ontop").offset().top,
        t = function() {
            var t = $(window).scrollTop();
            var b = $(document).height() - $(window).height();
            t > e ? $(".ontop").removeClass("top_position") : $(".ontop").addClass("top_position")
            b != t ? $(".ontop").removeClass("bottom_position") : $(".ontop").addClass("bottom_position")
            // console.log(t, '---', b);
        };
    t(), $(window).scroll(function() {
        t()
    })
})