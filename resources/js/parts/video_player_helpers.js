var fileVideoPlayer;

window.makeVideoPlayerHtml = function (path, storage, height, tagId) {
    let html = '';
    let options = {
        autoplay: false,
        controls: ['play', 'progress', 'current-time', 'mute', 'volume', 'settings', 'fullscreen'],
    };

    // Responsive parent container
    const parentStyle = `
        position: relative;
        width: 100%;
        height: 100%;
        display: flex;
        align-items: stretch;
        overflow: hidden;
        z-index: 0;
        outline: 0;
        font-family: "YouTube Noto", Roboto, Arial, Helvetica, sans-serif;
        color: #eee;
        text-align: left;
        direction: ltr;
        font-size: 11px;
        line-height: 1.3;
        -webkit-font-smoothing: antialiased;
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        touch-action: manipulation;
        background: #000;
    `;

    // Responsive video/embed wrapper
    const videoWrapperStyle = `width:100%;height:100%;display:flex;align-items:stretch;`;

    if (storage === 'youtube' || storage === 'vimeo') {
        html = `
            <div id="${tagId}-parent" style="${parentStyle}">
                <div class="plyr__video-embed" id="${tagId}" style="${videoWrapperStyle};position:relative;">
                    <iframe
                        src="https://www.${storage}.com/embed/${path}"
                        allowfullscreen
                        allowtransparency
                        allow="autoplay"
                        style="width:100%;height:100%;display:block;"
                    ></iframe>
                    ${
                        storage === 'youtube'
                            ? `<div id="${tagId}-overlay" style="position:absolute;top:0;left:0;width:100%;height:100%;z-index:2;pointer-events:auto;cursor:pointer;"></div>`
                            : ''
                    }
                </div>
            </div>
        `;
    } else if (storage === "secure_host") {
        html = `<iframe src="${path}" class="img-cover bg-gray200" frameborder="0" allowfullscreen="true" loading="lazy" allow="accelerometer;gyroscope;autoplay;encrypted-media;picture-in-picture;" style="width:100%;height:100%;display:block;"></iframe>`;
    } else {
        html = `
            <div id="${tagId}-parent" style="${parentStyle}">
                <video id="${tagId}" class="plyr w-100" controls style="width:100%;height:100%;display:block;object-fit:contain;">
                    <source src="${path}" type="video/mp4"/>
                </video>
            </div>
        `;
    }

    return {
        html: html,
        options: options,
    };
};

window.handleVideoByFileId = function (fileId, $contentEl, callback) {

    closeVideoPlayer();

    // Responsive height: let CSS handle it, but you can set a fallback here if needed
    const height = $(window).width() > 991 ? 426 : 264;

    $.post('/course/getFilePath', {file_id: fileId}, function (result) {

        if (result && result.code === 200) {
            const storage = result.storage;
            const videoTagId = 'videoPlayer' + fileId;
            const {html, options} = makeVideoPlayerHtml(result.path, storage, height, videoTagId);

            if ($contentEl) {
                $contentEl.html(html);
            }

            if (storage !== "secure_host") {
                if (fileVideoPlayer && fileVideoPlayer.destroy) {
                    fileVideoPlayer.destroy();
                }
                if (storage === 'youtube' || storage === 'vimeo') {
                    fileVideoPlayer = new window.Plyr(`#${videoTagId}`, options);

                    // --- Overlay logic for YouTube: only allow play/pause on video area ---
                    if (storage === 'youtube') {
                        setTimeout(function() {
                            const overlay = document.getElementById(videoTagId + '-overlay');
                            if (overlay && fileVideoPlayer) {
                                overlay.onclick = function() {
                                    if (fileVideoPlayer.playing) {
                                        fileVideoPlayer.pause();
                                    } else {
                                        fileVideoPlayer.play();
                                    }
                                };
                            }
                        }, 300);
                    }
                } else {
                    const videoElement = document.getElementById(videoTagId);
                    if (videoElement) {
                        fileVideoPlayer = new window.Plyr(videoElement, options);
                    }
                }
            }

            callback();
        } else {
            $.toast({
                heading: notAccessToastTitleLang,
                text: notAccessToastMsgLang,
                bgColor: '#f63c3c',
                textColor: 'white',
                hideAfter: 10000,
                position: 'bottom-right',
                icon: 'error'
            });
        }
    }).fail(err => {
        $.toast({
            heading: notAccessToastTitleLang,
            text: notAccessToastMsgLang,
            bgColor: '#f63c3c',
            textColor: 'white',
            hideAfter: 10000,
            position: 'bottom-right',
            icon: 'error'
        });
    });
};

window.closeVideoPlayer = function () {
    if (fileVideoPlayer && fileVideoPlayer.destroy) {
        fileVideoPlayer.destroy();
        fileVideoPlayer = undefined;
    }
};

window.pauseVideoPlayer = function () {
    if (fileVideoPlayer && fileVideoPlayer.pause) {
        fileVideoPlayer.pause();
    }
};


