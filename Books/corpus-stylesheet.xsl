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
                <section class="sidebar">
                    <!--#include virtual="menu.xhtml"-->
                    <div class="text">
                        <p> Not sure where to start? You can explore the corpus by clicking on any
                            individual tone or emotion, or you can combine them to see where they
                            overlap! If you would like to look at one specific book in particular,
                            check the box specified “Psalms” or “Revelations”. If you would like to
                            look at the corpus as a whole, check the box labeled “All”. Emotions and
                            tones can be checked independently of each other, but for best results,
                            they should be checked together. Once checked, emotions will show up as
                            color coded text, and tones will be underlined with color. </p>
                    </div>
                    <div class="texts-filtering-box">
                        <h2 class="sidebar-header">I want to view:</h2>
                        <div class="texts-filtering-container">
                            <h3 class="sidebar-header">Psalms</h3>
                            <input type="checkbox" id="psalms" name="psalms" checked="checked"/>
                            <label for="psalms">Psalms</label>
                        </div>
                        <div class="texts-filtering-container">
                            <h3 class="sidebar-header">Revelations</h3>
                            <input type="checkbox" id="revelations" name="revelations"
                                checked="checked"/>
                            <label for="revelations">Revelations</label>
                        </div>
                        <div class="texts-filtering-container">
                            <h3 class="sidebar-header">Both</h3>
                            <input type="checkbox" id="both" name="both" checked="checked"/>
                            <label for="both">Both</label>
                        </div>
                    </div>
                    <div class="attributes-filtering-box">
                        <h2 class="sidebar-header">I want to look at:</h2>
                        <div class="attributes-filtering-container">
                            <h3 class="sidebar-header">Emotion</h3>
                            <input type="checkbox" id="joy" name="joy" checked="checked"
                                class="color"/>
                            <label for="joy">Joy</label>
                            <br/>
                            <input type="checkbox" id="sorrow" name="sorrow" checked="checked"
                                class="color"/>
                            <label for="sorrow">Sorrow</label>
                            <br/>
                            <input type="checkbox" id="anger" name="anger" checked="checked"
                                class="color"/>
                            <label for="anger">Anger</label>
                            <br/>
                            <input type="checkbox" id="contentment" name="contentment"
                                checked="checked" class="color"/>
                            <label for="contentment">Contentment</label>
                            <br/>
                            <input type="checkbox" id="fear" name="fear" checked="checked"
                                class="color"/>
                            <label for="fear">Fear</label>
                            <br/>
                        </div>
                        <div class="attributes-filtering-container">
                            <h3 class="sidebar-header">Tone</h3>
                            <input type="checkbox" id="pleading" name="pleading" checked="checked"
                                class="color"/>
                            <label for="pleading">Pleading</label>
                            <br/>
                            <input type="checkbox" id="petitioning" name="petitioning"
                                checked="checked" class="color"/>
                            <label for="petitioning">Petitioning</label>
                            <br/>
                            <input type="checkbox" id="violence" name="violence" checked="checked"
                                class="color"/>
                            <label for="violence">Violence</label>
                            <br/>
                            <input type="checkbox" id="boasting" name="boasting" checked="checked"
                                class="color"/>
                            <label for="boasting">Boasting</label>
                            <br/>
                            <input type="checkbox" id="anxiety" name="anxiety" checked="checked"
                                class="color"/>
                            <label for="anxiety">Anxiety</label>
                            <br/>
                            <input type="checkbox" id="praise" name="praise" checked="checked"
                                class="color"/>
                            <label for="praise">Praise</label>
                            <br/>
                            <input type="checkbox" id="fear2" name="fear2" checked="checked"
                                class="color"/>
                            <label for="fear2">Fear</label>
                            <!-- slight problem here, we can't have duplicate IDs but we have two different 'fears' (in different areas) -->
                            <br/>
                            <input type="checkbox" id="righteousness" name="righteousness"
                                checked="checked" class="color"/>
                            <label for="righteousness">Righteousness</label>
                            <br/>
                        </div>
                    </div>
                </section>
                <div class="corpus">
                    <xsl:if test="$corpus//book/@id = 'PSA'">
                        <div class="corpora PSA">
                            <h1>Psalms</h1>
                            <xsl:apply-templates select="$corpus//book[@id = 'PSA']//c"/>
                        </div>
                    </xsl:if>
                    <xsl:if test="$corpus//book/@id = 'REV'">
                        <div class="corpora REV">
                            <h1>Revelations</h1>
                            <xsl:apply-templates select="$corpus//book[@id = 'REV']//c"/>
                        </div>
                    </xsl:if>
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
        <div>
            <xsl:apply-templates/>
        </div>
        
    </xsl:template>
    <xsl:template match="v">
        <xsl:apply-templates select="@id"/>
        <xsl:text>. </xsl:text>
        <xsl:apply-templates/>
        <!--<xsl:if test="following-sibling::v">
            <br/>
        </xsl:if>-->
    </xsl:template>
    <xsl:template match="emo_lang">
        <span class="{@emotion} {@tone} color">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>