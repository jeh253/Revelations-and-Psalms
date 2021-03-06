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
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <title>Psalms and Revelations</title>
            </head>
            <body>
                <xsl:comment>#include virtual="menu.xhtml"</xsl:comment>
                <div class="readingView">
                <section class="sidebar">

                    <div class="text">
                        <p> Not sure where to start? You can explore the corpus by clicking on any
                            individual tone or emotion, or you can combine them to see where they
                            overlap! If you would like to look at one specific book in particular,
                            check the box specified “Psalms” or “Revelations”. If you would like to
                            look at the corpus as a whole, check both boxes. Emotions and
                            tones can be checked independently of each other, but for best results,
                            they should be checked together. Once checked, emotions will show up as
                            color coded text, and tones will be underlined with color. </p>
                    </div>
                    <div class="texts-filtering-box">
                        <h2 class="sidebar-header">I want to view:</h2>
                        <div class="texts-filtering-container">

                            <input type="checkbox" id="psalms" name="psalms"/>
                            <label for="psalms">Psalms</label>

                            <br/>
                            <input type="checkbox" id="revelations" name="revelations"/>
                            <label for="revelations">Revelations</label>     
                        </div>
                    </div>
                    <div class="attribute-filtering-box">
                        <div class="emotion-filtering-box">
                            <h2 class="sidebar-header">I want to look at:</h2>
                            <div class="emotion-filtering-container">
                                <h3 class="sidebar-header">Emotion</h3>
                                <input type="checkbox" id="joy" name="joy"/>
                                <label for="joy">Joy</label>
                                <br/>
                                <input type="checkbox" id="sorrow" name="sorrow"/>
                                <label for="sorrow">Sorrow</label>
                                <br/>
                                <input type="checkbox" id="anger" name="anger"/>
                                <label for="anger">Anger</label>
                                <br/>
                                <input type="checkbox" id="contentment" name="contentment"/>
                                <label for="contentment">Contentment</label>
                                <br/>
                                <input type="checkbox" id="fearE" name="fearE"/>
                                <label for="fearE">Fear</label>
                                <br/>
                            </div>
                        </div>
                        <div class="tone-filtering-box">
                            <div class="tone-filtering-container">
                                <h3 class="sidebar-header">Tone</h3>
                                <input type="checkbox" id="pleading" name="pleading"/>
                                <label for="pleading">Pleading</label>
                                <br/>
                                <input type="checkbox" id="petitioning" name="petitioning"/>
                                <label for="petitioning">Petitioning</label>
                                <br/>
                                <input type="checkbox" id="violence" name="violence"/>
                                <label for="violence">Violence</label>
                                <br/>
                                <input type="checkbox" id="boasting" name="boasting"/>
                                <label for="boasting">Boasting</label>
                                <br/>
                                <input type="checkbox" id="anxiety" name="anxiety"/>
                                <label for="anxiety">Anxiety</label>
                                <br/>
                                <input type="checkbox" id="praise" name="praise"/>
                                <label for="praise">Praise</label>
                                <br/>
                                <input type="checkbox" id="fear2" name="fear2"/>
                                <label for="fear2">Fear</label>
                                <!-- slight problem here, we can't have duplicate IDs but we have two different 'fears' (in different areas) -->
                                <br/>
                                <input type="checkbox" id="righteousness" name="righteousness"/>
                                <label for="righteousness">Righteousness</label>
                                <br/>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="corpus open">
                    <xsl:if test="$corpus//book/@id = 'PSA'">
                        <div class="corpora psalms">
                            <h1>Psalms</h1>
                            <xsl:apply-templates select="$corpus//book[@id = 'PSA']//c"/>
                        </div>
                    </xsl:if>
                    <xsl:if test="$corpus//book/@id = 'REV'">
                        <div class="corpora revelations">
                            <h1>Revelations</h1>
                            <xsl:apply-templates select="$corpus//book[@id = 'REV']//c"/>
                        </div>
                    </xsl:if>
                </div>
                <!-- not sure if this is in the right place but
                    for the moment i'm gonna leave it here -->
                <script src="filter.js"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="c">
        <h2>
            <xsl:text>Chapter: </xsl:text>
            <xsl:apply-templates select="@id"/>
        </h2>
        <div class="chapter">
            <p>
                <xsl:apply-templates/>
            </p>
        </div>

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
        <xsl:choose>
            <xsl:when test="@emotion = 'fear'">
                <span class="fearE {@tone}">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="{@emotion} {@tone}">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
