<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
  method="text" />

<xsl:template match="/generation">

 <xsl:text> { "at": "</xsl:text>
  <xsl:value-of select="/generation/th" />
  <xsl:text>",</xsl:text>
<xsl:for-each select="td">
    <xsl:if test='span[@class="name"]' >
        <xsl:text>"</xsl:text> <xsl:value-of select='span[@class="name"]' /><xsl:text>": </xsl:text>
    </xsl:if>
     <xsl:if test='span[@class="generation"]' >
     <xsl:value-of select='span[@class="generation"]' />
      <xsl:text>,
      </xsl:text>
      </xsl:if>
</xsl:for-each>

<xsl:text> "Magic" : 0 }</xsl:text>
</xsl:template>
</xsl:stylesheet>

<!--
<xsl:template match="/generation">

 <xsl:text> { "at": "</xsl:text>
  <xsl:value-of select="/generation/th" />
  <xsl:text>", "generation" : [ </xsl:text>
<xsl:for-each select="td">
    <xsl:if test='span[@class="name"]' >
        <xsl:text>{ "type" : "</xsl:text>
        <xsl:value-of select='span[@class="name"]' />
        <xsl:text>",</xsl:text>
    </xsl:if>
     <xsl:if test='span[@class="generation"]' >
      <xsl:text>"generated" : </xsl:text>
     <xsl:value-of select='span[@class="generation"]' />
      <xsl:text>},
      </xsl:text>
      </xsl:if>
</xsl:for-each>

<xsl:text>{}] }</xsl:text>
</xsl:template>

-->