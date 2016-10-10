$(document).ready(function() {
  // check if the Google Analytics function is available
  if (typeof ga == 'function') {
    function trackFollow() {
      ga('send', 'event', 'following', 'click Follow buttom');
    };

    function trackUnsubscribe() {
      ga('send', 'event', 'following', 'click Unsubscribe buttom');
    };

    $('.track-request-action').click(function(e) { trackFollow(); });
    $('.track__action').click(function(e) { trackFollow(); });

    $('.unsubscribe__action').click(function(e) { trackUnsubscribe() });
    $('.unsubscribe-request-action').click(function(e) { trackUnsubscribe() });
  }
})
