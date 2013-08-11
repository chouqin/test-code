var auto_register = {
  getAllLinks_: function() {
    var tds = document.getElementByTagName('td');
    var result = [];
    for (var i = 0; i < tds.length; ++i) {
      var a = tds[i].getElementByTagName('a');
      for (var j = 0; j < a.length; ++j) {
        console.log(a);
        result.push(a);
      }
    }
  }
}
