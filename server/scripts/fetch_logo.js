var Nightmare = require('nightmare');
var vo = require('vo');
var request = require('request');
var path = require('path');
var fs = require('fs');

vo(function* () {
  var nightmare = Nightmare({ show: false });
  var link = yield nightmare
    .goto('http://www.australianuniversities.com.au/images/logos/')
    .evaluate(function () {
      var linksNode = document.querySelectorAll('a');
      var index = 0, links = [];
      for( index=0; index < linksNode.length; index++ ) {
        links.push(linksNode[index].href)
      }
      return links;
    });
  yield nightmare.end();
  return link;
})(function (err, result) {
  if (err) return console.log(err);
  result.shift();
  result.shift();
  var images = result.forEach(function(imageUrl) {
    var fileName = path.parse(imageUrl).name + path.parse(imageUrl).ext;
    request(imageUrl).pipe(fs.createWriteStream('../db/logos/' + fileName));
  });
});
