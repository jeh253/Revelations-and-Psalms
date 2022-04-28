<?xml version="1.0" encoding="UTF-8"?>
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
                <div id="analysis" class="open">
                    <h1>Psalms</h1>
                    <table>
                        <xsl:apply-templates select="$corpus//book[@id = 'PSA']"/>
                    </table>
                    <h1>Revelations</h1>
                    <table>
                        <xsl:apply-templates select="$corpus//book[@id = 'REV']"/>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="book[@id = 'REV']">
        <tr>
            <th>Emotions</th>
            <th>Count</th>
        </tr>
        <tr>
            <td>Anger</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@emotion eq 'anger'])"/>
            </td>
        </tr>
        <tr>
            <td>Joy</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@emotion eq 'joy'])"/>
            </td>
        </tr>
        <tr>
            <td>Contentment</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@emotion eq 'contentment'])"/>
            </td>
        </tr>
        <tr>
            <td>Sorrow</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@emotion eq 'sorrow'])"/>
            </td>
        </tr>
        <tr>
            <td>Fear</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@emotion eq 'fear'])"/>
            </td>
        </tr>
        <tr>
            <th>Tones</th>
            <th>Count</th>
        </tr>
        <tr>
            <td>Petitioning</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'petitioning'])"/>
            </td>
        </tr>
        <tr>
            <td>Pleading</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'pleading'])"/>
            </td>
        </tr>
        <tr>
            <td>Violence</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'violence'])"/>
            </td>
        </tr>
        <tr>
            <td>Boasting</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'boasting'])"/>
            </td>
        </tr>
        <tr>
            <td>Anxiety</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'anxiety'])"/>
            </td>
        </tr>
        <tr>
            <td>Praise</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'praise'])"/>
            </td>
        </tr>
        <tr>
            <td>Fear (tone)</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'fear'])"/>
            </td>
        </tr>
        <tr>
            <td>Righteousness</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'righteousness'])"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="book[@id = 'PSA']">
        <tr>
            <th>Emotions</th>
            <th>Count</th>
        </tr>
        <tr>
            <td>Anger</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@emotion eq 'anger'])"/>
            </td>
        </tr>
        <tr>
            <td>Joy</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@emotion eq 'joy'])"/>
            </td>
        </tr>
        <tr>
            <td>Contentment</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@emotion eq 'contentment'])"/>
            </td>
        </tr>
        <tr>
            <td>Sorrow</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@emotion eq 'sorrow'])"/>
            </td>
        </tr>
        <tr>
            <td>Fear</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@emotion eq 'fear'])"/>
            </td>
        </tr>
        <tr>
            <th>Tones</th>
            <th>Count</th>
        </tr>
        <tr>
            <td>Petitioning</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'petitioning'])"/>
            </td>
        </tr>
        <tr>
            <td>Pleading</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'pleading'])"/>
            </td>
        </tr>
        <tr>
            <td>Violence</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'violence'])"/>
            </td>
        </tr>
        <tr>
            <td>Boasting</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'boasting'])"/>
            </td>
        </tr>
        <tr>
            <td>Anxiety</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'anxiety'])"/>
            </td>
        </tr>
        <tr>
            <td>Praise</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'praise'])"/>
            </td>
        </tr>
        <tr>
            <td>Fear (tone)</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'fear'])"/>
            </td>
        </tr>
        <tr>
            <td>Righteousness</td>
            <td>
                <xsl:value-of select="count(//emo_lang[@tone eq 'righteousness'])"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
