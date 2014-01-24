<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>
<xsl:template match="/document">
<html>
	<head>
		<title><xsl:value-of select="h"/></title>
		<style><![CDATA[*{background-color:#ccc;}ol.c{list-style-type:decimal;}ol.s{list-style-type:decimal-leading-zero;}ol.ss{list-style-type:lower-roman;}]]></style>
	</head>
	<body>
		<ol class="c">
		<xsl:apply-templates select="x"/>
		</ol>
	</body>
</html>
</xsl:template>
<xsl:template match="part">
<h1><xsl:value-of select="h"/></h1>
<xsl:apply-templates select="x"/>
</xsl:template>
<xsl:template match="include">
<xsl:call-template name="extern">
	<xsl:with-param name="include"><xsl:value-of select="."/></xsl:with-param>
</xsl:call-template>
</xsl:template>
<xsl:template match="c">
<li><h2><a><xsl:attribute name="href"><xsl:value-of select="r"/></xsl:attribute><xsl:value-of select="h"/></a></h2>
<ol class="s">
<xsl:apply-templates select="x"/>
</ol>
</li>
</xsl:template>
<xsl:template match="s">
<li><h3><a><xsl:attribute name="href"><xsl:value-of select="../../r"/>#<xsl:value-of select="r"/></xsl:attribute><xsl:value-of select="h"/></a></h3>
</li>
</xsl:template>
<xsl:template name="extern">
	<xsl:param name="include"/>
	<xsl:apply-templates select="document($include)/document/x"/>
</xsl:template>
</xsl:stylesheet>
