<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!-- ==================================================================== -->
<!--  MODULE: onlyContentHTML, simplify HTML for non-interactive content. -->
<!--  VERSION: 1.0                     DATE: 2014-07-03                   -->
<!--  https://github.com/ppKrauss/html5-to-html4                          -->
<!-- ==================================================================== -->

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
<xsl:output encoding="UTF-8" />

  <!-- FILTERS: -->

  <!-- delete blocks -->
  <xsl:template match="script|form|iframe|object|menu|menuitem|noscript|option|textarea|input|processing-instruction()"></xsl:template>
    <!-- delete HTML5 -->
    <xsl:template match="nav|canvas|datalist|details|keygen|optgroup|progress"></xsl:template>
    <!-- delete HTML4 -->
    <xsl:template match="applet|frame|frameset|noframes"></xsl:template>


  <!-- IDENTITY -->
  <xsl:template match="@*|node()"><xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy></xsl:template>

</xsl:transform>
