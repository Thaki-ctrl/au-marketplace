// Shared client-side helpers for AU Marketplace.
document.addEventListener('DOMContentLoaded', function () {

  // Confirm before destructive actions: <form data-confirm="Delete this listing?">
  document.querySelectorAll('form[data-confirm]').forEach(function (form) {
    form.addEventListener('submit', function (e) {
      if (!window.confirm(form.getAttribute('data-confirm'))) {
        e.preventDefault();
      }
    });
  });

  // Registration: password match check. Needs inputs #password and #confirmPassword.
  var pw = document.getElementById('password');
  var confirmPw = document.getElementById('confirmPassword');
  if (pw && confirmPw) {
    var check = function () {
      confirmPw.setCustomValidity(pw.value === confirmPw.value ? '' : 'Passwords do not match');
    };
    pw.addEventListener('input', check);
    confirmPw.addEventListener('input', check);
  }

  // Bootstrap validation styling for forms with class "needs-validation".
  document.querySelectorAll('form.needs-validation').forEach(function (form) {
    form.addEventListener('submit', function (e) {
      if (!form.checkValidity()) {
        e.preventDefault();
        e.stopPropagation();
      }
      form.classList.add('was-validated');
    });
  });
});
