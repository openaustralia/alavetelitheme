$(document).ready(function() {
  // check if the Google Analytics function is available
  if (typeof ga == 'function') {
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
  }
})
