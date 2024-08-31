<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE
   stylesheet
   PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
   [
     <!ENTITY nbsp  " ">
     <!ENTITY bull  "&#8226;">
     <!ENTITY ldquo "&#8220;">
     <!ENTITY rdquo "&#8221;">
     <!ENTITY nbsp  "&#160;">
   ]
>

<!-- copy and exclude some -->

<xsl:stylesheet
    xmlns:jaa="http://www.w3.org/2005/Atom"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs html"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    version="2.0">

    <xsl:output indent="yes" omit-xml-declaration="yes" method="xml" />

    <!-- comments are added to the text like this -->


 <!-- keep links with image/png as type -->
    <xsl:template match="jaa:link[@type='image/png']">
 <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template match="jaa:link[@type='application/bloomSource+zip']">
 <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template match="jaa:link">
 <!-- omit -->
    </xsl:template>

    <!-- identity transform -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>