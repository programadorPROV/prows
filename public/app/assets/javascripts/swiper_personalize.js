// slide 
var swiper = new Swiper('.swiper_default', {
    slidesPerView: 1,
    speed: 200,
    autoHeight: true,
    loop: true,
    autoplay: {
    delay: 5000,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    }
});


// slide stocks
var swiper = new Swiper('.swiper_default_sm', {
    slidesPerView: 1,
    speed: 200,
    autoHeight: false,
    loop: true,
    navigation: {
      nextEl: '.swiper_button_prev_container',
      prevEl: '.swiper_button_next_container',
    }
});