$(document).ready(function() {
  $switcherFieldGroup = $("#request_personal_switch");
  $formSubmitButton = $("#request_form input[type='submit']")[0];
  personalRequestClass = "personal_request_switcher_focused";

  if ($switcherFieldGroup.length) {
    // If an error is showing or the subject has been filled then
    // they must have selected 'no' already
    // so set this and don't hide the form.
    if ($(".errorExplanation").length || $("#request_subject input")[0].value) {
      $("#request_personal_switch_no").prop("checked", true);
    } else {
      $switcherFieldGroup.addClass(personalRequestClass);
      $formSubmitButton.disabled = true;
    }

    $("#request_personal_switch_no").click(function(e) {
      $switcherFieldGroup.removeClass(personalRequestClass);
      $formSubmitButton.disabled = false;
    });

    $("#request_personal_switch_yes").click(function(e) {
      $switcherFieldGroup.addClass(personalRequestClass);
      $formSubmitButton.disabled = true;
    });
  }
});
