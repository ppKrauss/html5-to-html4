<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!-- ======================================================== -->
<!--  MODULE: HTML5 to HTML4, convert content tags.           -->
<!--  VERSION: 1.0                     DATE: 2014-07-02       -->
<!--  https://github.com/ppKrauss/html5-to-html4              -->
<!-- ======================================================== -->

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
<xsl:output encoding="UTF-8" method="html" version="4.0" indent="yes" />

<xsl:variable name="prefix">_tag_</xsl:variable>

  <!-- TAG FILTERS: -->

  <!-- block tags -->
  <xsl:template match="article|aside|figure|figcaption|footer|header|main|nav|section|template">
    <xsl:variable name="addSp"><xsl:if test="normalize-space(@class)"><xsl:text> </xsl:text></xsl:if></xsl:variable>
    <div>
      <xsl:attribute name="class"><xsl:value-of select="concat($prefix,local-name(),$addSp,@class)" /></xsl:attribute>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <!-- inline tags -->
  <xsl:template match="bdi|mark|rp|rt|ruby|time">
    <xsl:variable name="addSp"><xsl:if test="normalize-space(@class)"><xsl:text> </xsl:text></xsl:if></xsl:variable>
    <span>
      <xsl:attribute name="class"><xsl:value-of select="concat($prefix,local-name(),$addSp,@class)" /></xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <!-- special tags -->
  <xsl:template match="data"><span data-value="{@value}"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="wbr"><br/></xsl:template>

  <!-- convention for standard header -->
  <xsl:template match="meta[@charset='utf-8' or @charset='utf8' or @charset='UTF-8' or @charset='UTF8']">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </xsl:template>


  <!-- IDENTITY -->
  <xsl:template match="@*|node()"><xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy></xsl:template>

</xsl:transform>
