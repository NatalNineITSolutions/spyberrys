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

function openVideoModal(title, path, type) {
    document.getElementById('videoTitle').innerText = title;

    let embedHtml = '';
    if (type === 'Youtube') {
        const youtubeEmbed = path.replace("watch?v=", "embed/");
        embedHtml = `<iframe src="${youtubeEmbed}" frameborder="0" allowfullscreen></iframe>`;
    } else if (type === 'Vimeo') {
        embedHtml = `<iframe src="${path}" frameborder="0" allowfullscreen></iframe>`;
    } else if (type === 'iFrame') {
        embedHtml = `<iframe src="${path}" frameborder="0" allowfullscreen></iframe>`;
    } else {
        // Default: uploaded or external
        embedHtml = `<video controls src="${path}"></video>`;
    }

    document.getElementById('videoContainer').innerHTML = embedHtml;
    document.getElementById('videoModal').style.display = 'flex';
}

function closeVideoModal() {
    document.getElementById('videoContainer').innerHTML = '';
    document.getElementById('videoModal').style.display = 'none';
}