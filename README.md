html5-to-html4
==============
XSLT for tag convertions: preserves all HTML, only HTML5 tags that are converted to HTML4-equivalent ones. 
Testkit is a very simple PHP DomDocument function 
that reads an HTML file (any HTML DTD version!) and converts (by the XSLT) to HTML4 standard, even the input is HTML5.


See specs at [this apihtml5.blogspot's article](http://apihtml5.blogspot.com.br/2011/11/automatically-convert-html5-to-html4-if.html), the basic idea is: for each HTML5's "invalid tag for HTML4", transform tag into div or into span, and add to class the tag's name. 
<br/>Example: `<nav>etc.</nav>` turns `<div class="nav">etc.</div>`.

Need some control: 

* class prefix (ex. `_tag_`):  `<nav>etc.</nav>` turns `<div class="_tag_nav">etc.</div>`

* class aditiction rule (when there are already a class):  `<nav class="old">etc.</nav>` turns `<div class="nav old">etc.</div>`

