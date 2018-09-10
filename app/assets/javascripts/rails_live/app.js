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