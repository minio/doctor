$(document).on('page:change', function () {
   
    /*---------------------------
        Mobile Detect
    ----------------------------*/
    var isMobile = function() {
        return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
    };

    /*---------------------------
        Sidecar
    ----------------------------*/
    if (!isMobile()) {
        $sidecarScript = '<script src="https://sidecar.gitter.im/dist/sidecar.v1.js" />';
        $('body').append($sidecarScript);
        ((window.gitter = {}).chat = {}).options = {
            room: $('#settings').data('url')
        };
    }

    $('body').on('click', '.gitter-open-chat-button', function() {
        var backdrop;
        backdrop = '<div class="backdrop gitter--backdrop" />';
        $('body').append(backdrop);
        $('body').addClass('prevent-scroll');
    });

    $('body').on('click', 'gitter--backdrop, .gitter-chat-embed-action-bar-item-collapse-chat', function() {
        $('body').removeClass('prevent-scroll');
        $('.gitter--backdrop').remove();
    });

    $('body').on('click', '.gitter--backdrop', function() {
        $('.gitter-chat-embed-action-bar-item-collapse-chat').trigger('click');
    });
});
