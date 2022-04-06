<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    
    <!-- This will be the stylesheet for the Corpus page of our website! -->
    
    <!-- 1. Intro & Navigation for Corpus 
    written directly as text inside stylesheet (not pulled from anywhere) -->
    
    <!-- text for Intro & Nav (Caelin) -->
    
    <!-- 2. Actual Corpus: Psalms & Revelations 
    generic template to match whole body (Frances)
    <p> for each chapter
    line break after every verse -->
    <!-- Psalms -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Psalms</title>
            </head>
            <body>
                <h1>Psalms</h1>
                <p>
                    <xsl:apply-templates select="//c"/>
                </p>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="c">
        <xsl:apply-templates select="v"/>
        <br/>
    </xsl:template>
    <!-- Revelations -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Revelations</title>
            </head>
            <body>
                <h1>Revelations</h1>
                <p>
                    <xsl:apply-templates select="c"/>
                </p>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="c">
        <xsl:apply-templates select="v"/>
        <br/>
    </xsl:template>
    <!-- chapter/verse (Feral) -->
    
    <!-- Chapters and Verses/Verse #s are all attributes -->
    
    <!-- Link to JavaScript for the filtering system (Caelin) --> 
    
</xsl:stylesheet>
