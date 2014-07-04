<?php
/**
 * Testkit core, runs the XSLT with a requested input.
 *
 * On terminal (STDIN as default): $php index.php example1.htm > lix.htm
 * Online (example1 as default) or: http://localhost/html5-to-html4/testkit?file=example2.htm
 */

if (isset($argv[0])) {
	// TERMINAL:
	array_shift($argv);
	$file = empty($argv)? 'php://stdin': $argv[0];
} else {
	// ONLINE:
	$file = isset($_REQUEST['file'])? $_REQUEST['file']: './example1.htm';
}
print filterHTML($file);


/**
 * Generic XSLT filter that inputs an HTML file and outputs it as filtered string.
 */
function filterHTML($htmFile,$xslFile='../html5-to-html4.xsl') {
	$xmldoc = new DOMDocument();
	$xmldoc->resolveExternals = true;
	@$xmldoc->loadHTMLFile($htmFile,LIBXML_NOWARNING | LIBXML_NOERROR); 	
	// another (ugly) way to load is https://github.com/Masterminds/html5-php

	$xsldoc = DOMDocument::load($xslFile);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsldoc);
	return $proc->transformToXML($xmldoc);
}
?>