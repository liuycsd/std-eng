<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>
<xsl:template match="/document">
<html>
	<head>
		<title><xsl:value-of select="h"/></title>
		<style><![CDATA[*{background-color:#ccc;}.key{color:#800;}]]></style>
		<script><![CDATA[
var getans=function(obj){
	obj=obj.parentNode;
	var key=document.createTextNode(obj.getAttribute("key"));
	obj.appendChild(key);
}
]]></script>
	</head>
	<body>
		<xsl:apply-templates select="x"/>
	</body>
</html>
</xsl:template>
<xsl:template match="c">
	<h1><xsl:value-of select="h"/></h1>
	<xsl:apply-templates select="x"/>
</xsl:template>
<xsl:template match="s">
	<h2><a><xsl:attribute name="name"><xsl:value-of select="r"/></xsl:attribute><xsl:value-of select="h"/></a></h2>
	<xsl:apply-templates select="x"/>
</xsl:template>
<xsl:template match="ss">
	<h3><a><xsl:attribute name="name"><xsl:value-of select="../../r"/>-<xsl:value-of select="r"/></xsl:attribute><xsl:value-of select="h"/></a></h3>
	<xsl:apply-templates select="x"/>
</xsl:template>
<xsl:template match="z">
	<ul>
		<xsl:for-each select="i">
			<li>
			<xsl:value-of select="t"/>
			<xsl:apply-templates select="x"/>
			</li>
		</xsl:for-each>
	</ul>
</xsl:template>
<xsl:template match="e">
	<ol>
		<xsl:for-each select="i">
			<li>
			<xsl:value-of select="t"/>
			<xsl:apply-templates select="x"/>
			</li>
		</xsl:for-each>
	</ol>
</xsl:template>
<xsl:template match="d">
	<dl>
		<xsl:for-each select="i">
			<dt><xsl:value-of select="t"/></dt>
			<dd><xsl:value-of select="desp/t"/><xsl:apply-templates select="desp/x"/></dd>	
		</xsl:for-each>
	</dl>
</xsl:template>
<xsl:template match="div"><div><xsl:apply-templates/></div></xsl:template>
<xsl:template match="p"><p><xsl:apply-templates/></p></xsl:template>
<!--<xsl:template match="html"><xsl:copy-of select="*"><xsl:apply-templates/></xsl:copy-of></xsl:template>-->
<xsl:template match="html"><xsl:copy-of select="*"/></xsl:template>
<xsl:template match="ahref"><a><xsl:attribute name="href"><xsl:value-of select="r"/></xsl:attribute><xsl:value-of select="h"/><xsl:apply-templates select="x"/></a></xsl:template>
<xsl:template match="aname"><a><xsl:attribute name="name"><xsl:value-of select="r"/></xsl:attribute><xsl:value-of select="h"/><xsl:apply-templates select="x"/></a></xsl:template>
<xsl:template match="q">
<xsl:attribute name="key"><xsl:value-of select="k"/></xsl:attribute><xsl:value-of select="t"/><xsl:copy-of select="hbox/*"/><xsl:apply-templates select="x"/><input type="text" size="6"/><span class="key" onclick="javascript:getans(this);">Answer:</span>
</xsl:template>
<xsl:template match="b">
<xsl:attribute name="key"><xsl:value-of select="k"/></xsl:attribute><xsl:value-of select="t"/><xsl:apply-templates select="x"/><div class="key" onclick="javascript:getans(this);">Answer:</div>
</xsl:template>
</xsl:stylesheet>
