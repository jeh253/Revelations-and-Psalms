<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>

    <!-- This will be the stylesheet for the Corpus page of our website! -->

    <!-- 1. Intro & Navigation for Corpus 
    written directly as text inside stylesheet (not pulled from anywhere) -->

    <!-- text for Intro & Nav (Caelin) -->

    <!-- 2. Actual Corpus: Psalms & Revelations 
    generic template to match whole body (Frances)
     -->

    <xsl:template match="/">
        <html>
            <head>
                <xsl:if test="//book/@id = 'PSA'">
                    <title>Psalms</title>
                </xsl:if>
                <xsl:if test="//book/@id = 'REV'">
                    <title>Revelations</title>
                </xsl:if>
            </head>
            <body>
                <xsl:if test="//book/@id = 'PSA'">
                    <h1>Psalms</h1>
                </xsl:if>
                <xsl:if test="//book/@id = 'REV'">
                    <h1>Revelations</h1>
                </xsl:if>
                <div>
                    <xsl:apply-templates select="//c"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- chapter/verse <p> for each chapter
    line break after every verse (Feral) -->
    <xsl:template match="c">
        <h2>
            <xsl:text>Chapter: </xsl:text>
            <xsl:apply-templates select="@id"/>
        </h2>
        <p>
            <xsl:apply-templates/>
        </p>

    </xsl:template>
    <xsl:template match="v">
        <xsl:apply-templates select="@id"/>
        <xsl:text>. </xsl:text>
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::v">
            <br/>
        </xsl:if>
    </xsl:template>

    <!-- Chapters and Verses/Verse #s are all attributes -->

    <!-- Link to JavaScript for the filtering system (Caelin) -->

</xsl:stylesheet>
