<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!-- ============================================================= -->
<!--  MODULE:    HTML5 to HTML4, convert tags                      -->
<!--  VERSION:    1.0                      DATE: 2014-07-02        -->
<!-- ============================================================= -->

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
<xsl:output encoding="UTF-8" method="html" version="4.0" indent="yes" />

<xsl:variable name="prefix">_tag_</xsl:variable>

  <!-- TAG FILTERS: -->

  <xsl:template match="section|footer"><!-- display block tags -->
    <xsl:variable name="addSp"><xsl:if test="normalize-space(@class)">' '</xsl:if></xsl:variable>
    <div>
      <xsl:attribute name="class"><xsl:value-of select="concat($prefix,local-name(),$addSp,@class)" /></xsl:attribute>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="q"><!-- display inline tags -->
    <xsl:variable name="addSp"><xsl:if test="normalize-space(@class)">' '</xsl:if></xsl:variable>
    <span>
      <xsl:attribute name="class"><xsl:value-of select="concat($prefix,local-name(),$addSp,@class)" /></xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>


  <!-- IDENTITY -->
  <xsl:template match="@*|node()"><xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy></xsl:template>


</xsl:transform>
