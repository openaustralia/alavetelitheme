$(document).ready(function() {
  // check if the Google Analytics function is available
  if (typeof ga == 'function') {
    // Following
    function trackFollow() {
      ga('send', 'event', 'Following', 'click Follow button');
    };

    function trackUnsubscribe() {
      ga('send', 'event', 'Following', 'click Unsubscribe button');
    };

    $('.track-request-action').click(function(e) { trackFollow(); });
    $('.track__action').click(function(e) { trackFollow(); });

    $('.unsubscribe__action').click(function(e) { trackUnsubscribe() });
    $('.unsubscribe-request-action').click(function(e) { trackUnsubscribe() });

    // Request for personal information question
    $("#request_personal_switch_yes").click(function(e) {
      ga('send', 'event', 'Request for personal information question', 'click Yes');
    });

    $("#request_personal_switch_no").click(function(e) {
      ga('send', 'event', 'Request for personal information question', 'click No');
    });

    $(".request_personal_message .request_email a").click(function(e) {
      ga('send', 'event', 'Request for personal information question', 'click Authority email address');
    });

    // Making a request
    $("#request_new input[type='submit']").click(function(e) {
      ga('send', 'event', 'Make a request', 'click Preview Request button');
    });

    $(".new_info_request .preview-pane #reedit_button").click(function(e) {
      ga('send', 'event', 'Make a request', 'click Edit Your Request button from preview');
    });

    $(".new_info_request .preview-pane #submit_button").click(function(e) {
      ga('send', 'event', 'Make a request', 'click Send Request button from preview');
    });
  }
})
