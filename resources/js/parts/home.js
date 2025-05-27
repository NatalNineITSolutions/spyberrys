(function ($) {
    "use strict";


    const defaultBreakpoints = {
        991: {
            slidesPerView: 3,
        },

        660: {
            slidesPerView: 2,
        },
    }

    const sliders = [
        {
            container: 'features-swiper-container',
            pagination: "features-swiper-pagination",
            breakpoints: false
        },
        {
            container: 'upcoming-courses-swiper',
            pagination: "upcoming-courses-swiper-pagination",
            breakpoints: defaultBreakpoints
        },
        {
            container: 'latest-webinars-swiper',
            pagination: "latest-webinars-swiper-pagination",
            breakpoints: defaultBreakpoints
        },
        {
            container: 'latest-bundle-swiper',
            pagination: "bundle-webinars-swiper-pagination",
            breakpoints: defaultBreakpoints
        },
        {
            container: 'best-sales-webinars-swiper',
            pagination: "best-sales-webinars-swiper-pagination",
            breakpoints: defaultBreakpoints
        },
        {
            container: 'best-rates-webinars-swiper',
            pagination: "best-rates-webinars-swiper-pagination",
            breakpoints: defaultBreakpoints
        },
        {
            container: 'has-discount-webinars-swiper',
            pagination: "has-discount-webinars-swiper-pagination",
            breakpoints: defaultBreakpoints
        },
        {
            container: 'free-webinars-swiper',
            pagination: "free-webinars-swiper-pagination",
            breakpoints: defaultBreakpoints
        },
        {
            container: 'new-products-swiper',
            pagination: "new-products-swiper-pagination",
            breakpoints: {
                1200: {
                    slidesPerView: 4,
                },

                991: {
                    slidesPerView: 3,
                },

                660: {
                    slidesPerView: 2,
                },
            }
        },
        {
            container: 'testimonials-swiper',
            pagination: "testimonials-swiper-pagination",
            breakpoints: defaultBreakpoints
        },
        {
            container: 'subscribes-swiper',
            pagination: "subscribes-swiper-pagination",
            breakpoints: defaultBreakpoints
        },
        {
            container: 'organization-swiper-container',
            pagination: "organization-swiper-pagination",
            breakpoints: {
                991: {
                    slidesPerView: 4,
                },

                660: {
                    slidesPerView: 2,
                },
            }
        },
        {
            container: 'trend-categories-swiper',
            pagination: "trend-categories-swiper-pagination",
            breakpoints: {
                1200: {
                    slidesPerView: 6,
                },
                991: {
                    slidesPerView: 4,
                },
                660: {
                    slidesPerView: 2,
                },
            }
        },
    ]

    for (const slider of sliders) {
        const swip = new Swiper('.' + slider.container, {
            slidesPerView: 1,
            spaceBetween: 16,
            loop: false,
            autoplay: {
                delay: 5000,
                disableOnInteraction: true,
                pauseOnMouseEnter: true,
            },
            pagination: {
                el: '.' + slider.pagination,
                clickable: true,
            },
            breakpoints: slider.breakpoints
        });

        const $el = $("." + slider.container);

        $el.mouseenter(() => {
            swip.autoplay.stop();
        });

        $el.mouseleave(() => {
            swip.autoplay.start();
        });
    }


    $('.instructors-swiper-container').owlCarousel({
        loop: true,
        center: true,
        items: 3,
        margin: 0,
        autoplay: true,
        dots: true,
        autoplayTimeout: 5000,
        smartSpeed: 450,
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2
            },
            1170: {
                items: 4
            }
        }
    });

    $(document).ready(function () {
        for (var i = 1; i <= 6; i++) {
            new Parallax(document.getElementById('parallax' + i), {
                relativeInput: true
            });
        }
    });
})(jQuery);

document.addEventListener('DOMContentLoaded', function () {
    if (window.Plyr) {
        console.log('Initializing Plyr for video players');
        document.querySelectorAll('.plyr, .plyr__video-embed').forEach(function (el) {
            console.log('Initializing Plyr for element:', el);
            new window.Plyr(el, {
                controls: ['play', 'progress', 'current-time', 'mute', 'volume', 'settings', 'fullscreen'],
            });
        });
    }
});


window.toggleLiveWebinarVideo = function(id, source) {
    var player = document.getElementById('liveWebinarPlayer' + id);
    var btn = document.getElementById('playPauseBtn' + id);

    if (!player) return;

    if (player.tagName.toLowerCase() === 'video') {
        // Attach handlers BEFORE toggling
        player.onplay = function() {
            if (btn) btn.innerHTML = '<i class="fa fa-pause"></i>';
        };
        player.onpause = function() {
            if (btn) btn.innerHTML = '<i class="fa fa-play"></i>';
        };

        if (player.paused) {
            player.play();
            if (btn) btn.innerHTML = '<i class="fa fa-pause"></i>';
        } else {
            player.pause();
            if (btn) btn.innerHTML = '<i class="fa fa-play"></i>';
        }
    } else if (source === 'youtube') {
        var iframe = player;
        if (btn && btn.innerHTML.includes('fa-play')) {
            btn.innerHTML = '<i class="fa fa-pause"></i>';
            iframe.contentWindow.postMessage('{"event":"command","func":"playVideo","args":""}', '*');
        } else {
            btn.innerHTML = '<i class="fa fa-play"></i>';
            iframe.contentWindow.postMessage('{"event":"command","func":"pauseVideo","args":""}', '*');
        }
    } else if (source === 'vimeo') {
        var iframe = player;
        if (btn && btn.innerHTML.includes('fa-play')) {
            btn.innerHTML = '<i class="fa fa-pause"></i>';
            iframe.contentWindow.postMessage('{"method":"play"}', '*');
        } else {
            btn.innerHTML = '<i class="fa fa-play"></i>';
            iframe.contentWindow.postMessage('{"method":"pause"}', '*');
        }
    }
};

// document.addEventListener('DOMContentLoaded', function () {
//     if (window.Swiper) {
//         new Swiper('.live-webinars-swiper', {
//             slidesPerView: 1.5,
//             centeredSlides: false,
//             spaceBetween: 100, // Adjust as needed
//             loop: false, // Enable infinite loop
//             navigation: {
//                 nextEl: '.live-webinars-next',
//                 prevEl: '.live-webinars-prev',
//             },
//             pagination: {
//                 el: '.swiper-pagination',
//                 clickable: true,
//             },
//             breakpoints: {
//                 576: { slidesPerView: 1.5, centeredSlides: false, spaceBetween: 20 },
//                 768: { slidesPerView: 2, centeredSlides: false, spaceBetween: 24 },
//                 992: { slidesPerView: 3, centeredSlides: false, spaceBetween: 28 },
//                 1200: { slidesPerView: 4, centeredSlides: false, spaceBetween: 100 }
//             }
//         });
//     }
// });

document.addEventListener('DOMContentLoaded', function () {
    if (window.Swiper) {
        var swiper = new Swiper('.live-webinars-swiper', {
            slidesPerView: 1.5,
            centeredSlides: false,
            spaceBetween: 120, // Adjust as needed
            loop: false,
            navigation: {
                nextEl: '.live-webinars-next',
                prevEl: '.live-webinars-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            breakpoints: {
                576: { slidesPerView: 1.5, centeredSlides: false, spaceBetween: 20 },
                768: { slidesPerView: 2, centeredSlides: false, spaceBetween: 24 },
                992: { slidesPerView: 3, centeredSlides: false, spaceBetween: 50 },
                1200: { slidesPerView: 3, centeredSlides: false, spaceBetween: -30 }
            },
            on: {
                slideChange: function () {
                    lazyLoadActiveVideo();
                },
                init: function () {
                    lazyLoadActiveVideo();
                }
            }
        });

        function lazyLoadActiveVideo() {
            document.querySelectorAll('.swiper-slide').forEach(function (slide) {
                var placeholder = slide.querySelector('.video-placeholder');
                if (placeholder && slide.classList.contains('swiper-slide-active')) {
                    if (!placeholder.dataset.loaded) {
                        var type = placeholder.dataset.type;
                        var src = placeholder.dataset.src;
                        var id = placeholder.dataset.id;
                        if (type === 'youtube' || type === 'vimeo') {
                            var iframe = document.createElement('iframe');
                            iframe.id = 'liveWebinarPlayer' + id;
                            iframe.src = src;
                            iframe.frameBorder = 0;
                            iframe.allow = 'autoplay; encrypted-media';
                            iframe.allowFullscreen = true;
                            iframe.tabIndex = -1;
                            iframe.style = 'width:100%;height:100%;object-fit:cover;position:absolute;top:0;left:0;';
                            placeholder.innerHTML = '';
                            placeholder.appendChild(iframe);
                        } else if (type && src) {
                            var video = document.createElement('video');
                            video.id = 'liveWebinarPlayer' + id;
                            video.className = 'video-bg';
                            video.autoplay = true;
                            video.muted = true;
                            video.loop = true;
                            video.playsInline = true;
                            video.tabIndex = -1;
                            video.style = 'width:100%;height:100%;object-fit:cover;position:absolute;top:0;left:0;';
                            var source = document.createElement('source');
                            source.src = src;
                            source.type = 'video/mp4';
                            video.appendChild(source);
                            placeholder.innerHTML = '';
                            placeholder.appendChild(video);
                        }
                        placeholder.dataset.loaded = '1';
                    }
                }
            });
        }
    }
});

