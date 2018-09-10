(function () {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();
}).call(this);

function objs2list(p) {
  r = [];
  for (var key in p)
    if (p.hasOwnProperty(key)) {
      r.push({
        "@key": key,
        "@val": p[key]
      });
    }
  return r;
}

$(document).ready(function() {
  // Check for click events on the navbar burger icon
  $(".navbar-burger").click(function() {
      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      $(".navbar-burger").toggleClass("is-active");
      $(".navbar-menu").toggleClass("is-active");
  });
});