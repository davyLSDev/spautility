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

<!-- copy and make sample -->

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
    
    
    <!-- copy only 001, 002, 003, 105b, 235 -->
    <xsl:template match="jaa:entry[starts-with(jaa:title,'001')]">
        <xsl:copy-of select="."/>
        <!-- keep this one -->
    </xsl:template>
    <xsl:template match="jaa:entry[starts-with(jaa:title,'002')]">
        <xsl:copy-of select="."/>
        <!-- keep this one -->
    </xsl:template>
    <xsl:template match="jaa:entry[starts-with(jaa:title,'003')]">
        <xsl:copy-of select="."/>
        <!-- keep this one -->
    </xsl:template>
    <xsl:template match="jaa:entry[starts-with(jaa:title,'105b')]">
        <xsl:copy-of select="."/>
        <!-- keep this one -->
    </xsl:template>
    <xsl:template match="jaa:entry[starts-with(jaa:title,'235')]">
        <xsl:copy-of select="."/>
        <!-- keep this one -->
    </xsl:template>
    <xsl:template match="jaa:entry">
        <!-- toss out -->
    </xsl:template>
    


    <!-- identity transform -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>