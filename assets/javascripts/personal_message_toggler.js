$(document).ready(function() {
  $switcherFieldGroup = $("#request_personal_switch");

  if ($switcherFieldGroup.length) {
    $switcherFieldGroup.addClass("personal_request_switcher_focused");

    $("#request_personal_switch_no").click(function(e) {
      $switcherFieldGroup.removeClass("personal_request_switcher_focused");
    });

    $("#request_personal_switch_yes").click(function(e) {
      $switcherFieldGroup.addClass("personal_request_switcher_focused");
    });
  }
});
