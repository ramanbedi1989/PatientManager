//= require rails-timeago
//= require faye

var client = new Faye.Client('/faye');


$(function(){
    client.subscribe('/chats',function(payload){
        if(payload.message != null){
            var message_container = $('.msg_container_base');
            message_container.append(payload.message);
            var topBar = $('.top-bar');
            if($('.chat-window').find('.panel-collapsed').length > 0){
                topBar.addClass('collapsed-message');
            }else{
                message_container.scrollTop(message_container.prop('scrollHeight'));
            }
        }
    });

    var message_container = $('.chat-window').find('.panel-body');
    message_container.show();
    message_container.scrollTop(message_container.prop('scrollHeight'));
    message_container.hide();
});



$(document).on('click', '.panel-heading span.icon_minim', function (e) {
    e.preventDefault();
    var $this = $(this);
    if (!$this.hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').hide();
        $this.addClass('panel-collapsed');
        $this.removeClass('fa-minus').addClass('fa-plus');
        $this.parents('.chat-window').addClass('collapsed-chat');
        var allChatWindows = $('.chat-window');
        if(allChatWindows.filter('.collapsed-chat').length == allChatWindows.length){
            allChatWindows.each(function(){
                var self = $(this);
                self.removeClass('collapsed-chat');
            });
        }
    } else {
        var allChatWindows = $('.chat-window');
        if(allChatWindows.find('.fa-minus').length == 0){
            allChatWindows.each(function(){
                var self = $(this);
                self.addClass('collapsed-chat');
            });
        }
        $this.parents('.panel').find('.top-bar').removeClass('collapsed-message');
        var message_container = $this.parents('.panel').find('.panel-body');
        message_container.show();
        $this.parents('.chat-window').removeClass('collapsed-chat');
        $this.removeClass('panel-collapsed');
        $this.removeClass('fa-plus').addClass('fa-minus');
    }
});
$(document).on('click', '.panel-heading span.icon-align', function (e) {
    e.preventDefault();
    var $this = $(this);
    var parentContainer = $this.parents('.chat-window');
    if(parentContainer.hasClass('pull-right')){
        parentContainer.removeClass('pull-right');
        $this.removeClass('fa-align-left').addClass('fa-align-right');
    }else{
        parentContainer.addClass('pull-right');
        $this.removeClass('fa-align-right').addClass('fa-align-left');
    }
});
$(document).on('focus', '.panel-footer input.chat_input', function (e) {
    var $this = $(this);
    if ($('#minim_chat_window').hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').slideDown();
        $('#minim_chat_window').removeClass('panel-collapsed');
        $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
    }
});
$(document).on('click', '#new_chat', function (e) {
    var size = $( ".chat-window:last-child" ).css("margin-left");
     size_total = parseInt(size) + 400;
    alert(size_total);
    var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
    clone.css("margin-left", size_total);
});
$(document).on('click', '.icon_close', function (e) {
    $(this).parents('.chat-window').remove();
});
