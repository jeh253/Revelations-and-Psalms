<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>

    <xsl:variable name="corpus" as="document-node()+" select="collection('?select=*.xml')"/>

    <xsl:template name="xsl:initial-template">
        <html>
            <head>
                <xsl:if test="$corpus//book/@id = 'PSA'">
                    <title>Psalms</title>
                </xsl:if>
                <xsl:if test="$corpus//book/@id = 'REV'">
                    <title>Revelations</title>
                </xsl:if>
            </head>
            <body>
                <div class="text">
                    <p> Not sure where to start? You can explore the corpus by clicking on any
                        individual tone or emotion, or you can combine them to see where they
                        overlap! If you would like to look at one specific book in particular, check
                        the box specified “Psalms” or “Revelations”. If you would like to look at
                        the corpus as a whole, check the box labeled “All”. Emotions and tones can
                        be checked independently of each other, but for best results, they should be
                        checked together. Once checked, emotions will show up as color coded text,
                        and tones will be underlined with color. </p>
                </div>
                <xsl:if test="$corpus//book/@id = 'PSA'">
                    <h1>Psalms</h1>
                </xsl:if>
                <xsl:if test="$corpus//book/@id = 'REV'">
                    <h1>Revelations</h1>
                </xsl:if>
                <div>
                    <xsl:apply-templates select="$corpus//c"/>
                </div>
                <!-- not sure if this is in the right place but
                    for the moment i'm gonna leave it here -->
                <script scr="colorcode.js"/> 
            </body>
        </html>
    </xsl:template>
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
    <xsl:template match="emo_lang">
        <span class="{@emotion}" class2="{@tone}" class3="color">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>
