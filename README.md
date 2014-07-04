html5-to-html4
==============
XSLT for tag convertions: preserves all HTML, only HTML5 tags are converted to HTML4-equivalent ones. 
*Testkit* is a very simple DomDocument function 
that reads an HTML file (any HTML DTD version!) and converts (by the XSLT) to HTML4 standard, even the input is HTML5.

See the general conversion idea at [this apihtml5.blogspot's article](http://apihtml5.blogspot.com.br/2011/11/automatically-convert-html5-to-html4-if.html), used here: for each HTML5's "invalid tag for HTML4", transform tag into div or into span, and add to class the tag's name.
<br/>Example: `<nav>etc.</nav>` turns into `<div class="nav">etc.</div>`.

Need some control:

* (optional) class prefix (ex. `_tag_`):  turns into `<div class="_tag_nav">etc.</div>`

* class aditiction rule (ex. tag with existing `class="old"`):  turns into `<div class="nav old">etc.</div>`

## Goals ##

For a complete translation you need something as a framework (some Javascript for client-side and handling forms at server-side)... But the goal here is only to **transform contents**. In this project we work to find *a better way to understand HTML5 contents with HTML4 syntax and semantics*.

## Context and motivation ##

A database was storing contents in HTML4 format: when receiving some new HTML5 files, that are not compatible with the storage format, it produce some errors. The first idea is to filter the HTML5 tags... And that we are doing here in this little open project.

You mind boggles as to why your database would know or care if something is HTML 4 or 5? Maybe we must redesign the database... But we will preserve this little XSLT project because there are **other possible scenarios of using an "HTML5-to-HTML4 filter"**:

* A old and complex HTML-to-X parser that converts HTML4, but not knows HTML5, and no one think to redo the old complex software.

* Reuse templates, CSS, structures, etc. that expects HTML4 tags and not knows HTML5 tags, so, its more easy to adapt divs and spans than redo all.

* An "isolated environment" where all HTML applications will never read HTML5, but where some input from "external world" must be used.

* A template system, a server or a plataform, where content is produced with HTML5; but distribution must stay with HTML4, still supported by all browsers in 2014.

* ...

The XSLT is also a good starting point for programmers that want to understand and to summarise the HTML5 changes, and the impact of then in old HTML4 frameworks.
