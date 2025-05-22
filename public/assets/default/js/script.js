document.addEventListener('DOMContentLoaded', function () {
    const buttons = document.querySelectorAll('.category-button');

    buttons.forEach(button => {
        const video = button.querySelector('video');

        button.addEventListener('mouseenter', () => {
            video.currentTime = 0;
            video.play();
        });

        button.addEventListener('mouseleave', () => {
            video.pause();
            video.currentTime = 0;
        });
    });
});