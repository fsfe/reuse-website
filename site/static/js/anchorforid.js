/**
* Anchor for header ID
* 
* SPDX-License-Identifier: MIT
* SPDX-FileCopyrightText: 2014 Parker Moore <https://byparker.com>
* SPDX-FileCopyrightText: 2020 Free Software Foundation Europe <https://fsfe.org>
**/
var anchorForId = function (id) {
  var anchor = document.createElement("a");
  anchor.className = "header-link";
  anchor.href      = "#" + id;
  anchor.innerHTML = '<i class="fa fa-link" aria-hidden="true"></i>';
  return anchor;
};

var linkifyAnchors = function (level, containingElement) {
  var headers = containingElement.getElementsByTagName("h" + level);
  for (var h = 0; h < headers.length; h++) {
    var header = headers[h];

    if (typeof header.id !== "undefined" && header.id !== "") {
      header.appendChild(anchorForId(header.id));
    }
  }
};

document.onreadystatechange = function () {
  if (this.readyState === "complete") {
    var contentBlock = document.getElementsByClassName("content")[0]
    if (!contentBlock) {
      return;
    }
    for (var level = 2; level <= 4; level++) {
      linkifyAnchors(level, contentBlock);
    }
  }
};
