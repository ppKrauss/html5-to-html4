<?php

print XSL_transf('./ex1.htm','../converHtml5Tags.xsl');

function XSL_transf($htmFile,$xslFile) {

	$xmldoc = new DOMDocument();
	// if errors here, try https://github.com/Masterminds/html5-php
	$xmldoc->resolveExternals = true;
	@$xmldoc->loadHTMLFile($htmFile,LIBXML_NOWARNING | LIBXML_NOERROR);

	$xsldoc = DOMDocument::load($xslFile);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xsldoc);
	return $proc->transformToXML($xmldoc);
}
?>