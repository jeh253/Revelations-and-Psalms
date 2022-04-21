<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- books -->
    <xsl:variable name="books" as="document-node()+" select="collection('Revelations-and-Psalms/Books/?select=*.xml')"/>
    <!-- stylesheet variables -->
    <xsl:variable name="maxWide" as="xs:integer" select="800"/>
    <xsl:variable name="maxHigh" as="xs:integer" select="500"/>
    <xsl:variable name="yScale" as="xs:integer" select="10"/>
    <xsl:variable name="space" as="xs:integer" select="50"/>
    
    <!-- initial template and axes -->
    <xsl:template name="xsl:initial-template">
        <svg viewBox="75 100 1000 1000" width="100%">
            <g transform="translate(100, {$maxWide + 200})">
                <!-- axes -->
                <line x1="50" x2="{$maxWide + 100}" y1="0" y2="0" stroke="black"/>
                <line x1="50" x2="50" y1="0" y2="-{$maxHigh + 50}" stroke="black"/>
                
                <!-- labels -->
                <text x="{($maxWide + 150)  div 2}" y="-600" stroke="black" fill="black" text-anchor="middle" font-size="20">
                    Emotion and Tone Intersections</text>
                <text x="{($maxWide + 150)  div 2}" y="60" fill="black" stroke="black" font-size="20" text-anchor="middle">
                    Tone</text>
                <text x="{($maxHigh)  div 2}" y="-75" transform="rotate(-90)" stroke="black" fill="black" font-size="20" text-anchor="middle">
                    Emotion</text>
                
                <!-- ruling lines and labels  for emotions (y-axis)-->
                <xsl:for-each-group select="$books//emo_lang" group-by="@emotion">
                    <xsl:variable name="yPos" as="xs:double"
                        select="($space * 2) + (position() - 1) * ($space * 2)"/>
                    <xsl:for-each select=".">
                        <line x1="50" x2="{$maxWide + 100}" y1="-{$yPos}" y2="-{$yPos}" stroke="grey" stroke-dasharray="2"/>
                        <text x="40" y="-{$yPos - 2}" stroke="black" text-anchor="end">
                            <xsl:value-of select="current-grouping-key()"/>
                        </text>
                    </xsl:for-each>                  
                </xsl:for-each-group>   
                <!-- ruling lines and labels for tone (x-axis)
                -->
                <xsl:for-each-group select="$books//emo_lang" group-by="distinct-values(tokenize(@tone))">
                    <xsl:variable name="xPos" as="xs:double"
                        select="($space * 2) + (position() - 1) * ($space * 2)"/>
                    <xsl:for-each select=".">
                        <line x1="{$xPos + 50}" x2="{$xPos + 50}" y1="0" y2="-{$maxHigh + 50}" stroke="grey" stroke-dasharray="2"/>
                        <text x="{$xPos + 50}" y="20" stroke="black" text-anchor="middle">
                            <xsl:value-of select="current-grouping-key()"/>
                        </text>
                    </xsl:for-each>  
                    <xsl:for-each-group select="current-group()" group-by="@emotion">
                        <xsl:variable name="area" as="xs:double" select="count(current-group())"/>
                        <xsl:variable name="r" as="xs:double"
                            select="5 * math:sqrt($area div math:pi())"/>
                        <xsl:variable name="yPos" as="xs:double"
                            select="($space * 2) + (position() - 1) * ($space * 2)"/>
                        <xsl:for-each select=".">
                            <circle cx="{$xPos + 50}" cy="-{$yPos}"
                                r="{$r}" fill="purple" opacity=".75"/>
                            <text x="{$xPos + 50}" y="-{$yPos - 5}" text-anchor="middle" stroke="black">
                                <xsl:value-of select="$area"/>
                            </text>
                        </xsl:for-each>
                    </xsl:for-each-group>
                </xsl:for-each-group>
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>