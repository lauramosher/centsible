//= require_tree ./components

function resetForm(formSelector) {
  document.querySelector(formSelector).reset();
  document.querySelector(formSelector + " input:first-child").focus();
}
