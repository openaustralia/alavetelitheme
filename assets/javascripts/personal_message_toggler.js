$(document).ready(function() {
  $switcherFieldGroup = $("#request_personal_switch");
  $formSubmitButton = $("#request_form input[type='submit']")[0];

  if ($switcherFieldGroup.length) {
    // If an error is showing they must have selected 'no'
    // so set this and don't hide the form.
    if ($(".errorExplanation").length) {
      $("#request_personal_switch_no").prop("checked", true);
    } else {
      $switcherFieldGroup.addClass("personal_request_switcher_focused");
      $formSubmitButton.disabled = true;
    }

    $("#request_personal_switch_no").click(function(e) {
      $switcherFieldGroup.removeClass("personal_request_switcher_focused");
      $formSubmitButton.disabled = false;
    });

    $("#request_personal_switch_yes").click(function(e) {
      $switcherFieldGroup.addClass("personal_request_switcher_focused");
      $formSubmitButton.disabled = true;
    });
  }
});
