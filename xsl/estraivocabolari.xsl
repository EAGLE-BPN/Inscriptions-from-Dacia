<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:gcse="nothing"
    exclude-result-prefixes="xs tei" version="2.0">
    
    <xsl:variable name="inscription">
        <xsl:for-each select="//tei:item/@corresp">
            <xsl:sequence select="document(concat('../xml/',.,'.xml'))"/>
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:output method="html"/>
    
    <xsl:template match="/">
       
        <!-- TO BE USED ON GENERAL INDEX creates directly an HTML index of terms with links to inscriptions which have that value-->

        

        
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Inscriptions from Dacia</title>
                <link rel="stylesheet" href="graficagenerale.css" type="text/css"/>
                
                
            </head>
            <body>
                <div id="header">
                    <h1>Inscriptions by type and material</h1>
                </div>

                <div id="nav">
                    <a href="index.html">Home</a>
                    <br/>
                    <a href="browseinscriptions.html">Browse Inscriptions</a>
                    <br/>
                    <a href="Bibliografia.html">Bibliography</a>
                    <br/>
                    <a href="inscriptionsbyplace.html">Inscriptions by provenance</a>
                    <br/>
                    
            <br />
           <script>
  (function() {
    var cx = '004934001066682767631:o6msemn59ww';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//www.google.com/cse/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:search></gcse:search>
                </div>

                <div id="section">
                    <p>Definitions point to the EAGLE controlled Vocabularies. To see inscriptions
                        related to one concept click on SHOW. Multiple choices are not
                        supported.</p>


                    <div id="material" class="material list">
                        <h1>Material</h1>
                        <table>
                            <xsl:for-each-group select="$inscription//tei:material" group-by="@ref">
                               
                                <xsl:sort order="ascending" select="lower-case(.)"/>
                                <tr>
                                    <td><a target="_blank">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="@ref"/>
                                    </xsl:attribute>
                                        <xsl:value-of select="."/>
                                </a></td>
<td>                                    <xsl:text> (total: </xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>)</xsl:text>
                                    </td>
                                        
                                        <td>
                                            <xsl:for-each select="current-group()"><a target="_blank" href="{concat('/text/',../../../../../../../tei:publicationStmt/tei:idno[@type='localID'],'.html')}"><xsl:value-of select="../../../../../../../tei:titleStmt/tei:title"/><xsl:text> (</xsl:text><xsl:value-of select="../../../../../../../tei:publicationStmt/tei:idno[@type='localID']"/><xsl:text>)</xsl:text></a><br/></xsl:for-each>
                                        </td>

                               </tr>
                            </xsl:for-each-group>
                        </table>
                    </div>
                    
                    
                    <div id="instyp" class="instyp list">
                        <h1>Type of Inscription</h1>
                        <table>
                            <xsl:for-each-group select="$inscription//tei:TEI//tei:term" group-by="@ref">
                                
                                <xsl:sort order="ascending" select="lower-case(.)"/>
                                <tr>
                                    <td>                                    <a target="_blank">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="@ref"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="."/>
                                    </a>
</td>                                  <td>  <xsl:text> (total: </xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>)</xsl:text></td>
                                    <td>
                                        <xsl:for-each select="current-group()"><a target="_blank" href="{concat('/text/',../../../../tei:fileDesc/tei:publicationStmt/tei:idno[@type='localID'],'.html')}"><xsl:value-of select="../../../../tei:fileDesc/tei:titleStmt/tei:title"/><xsl:text> (</xsl:text><xsl:value-of select="../../../../tei:fileDesc/tei:publicationStmt/tei:idno[@type='localID']"/><xsl:text>)</xsl:text></a><br/></xsl:for-each>
                                    </td>
                                    
                                </tr>
                            </xsl:for-each-group>
                        </table>
                    </div>
                    
                    <div id="objtyp" class="objtyp list">
                        <h1>Object Types</h1>
                        <table>
                            <xsl:for-each-group select="$inscription//tei:TEI//tei:objectType" group-by="@ref">
                                
                                <xsl:sort order="ascending" select="lower-case(.)"/>
                                <tr>
                                    <td>                                    <a target="_blank">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="@ref"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="."/>
                                    </a></td>
<td>                                    <xsl:text> (total: </xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>)</xsl:text>
</td>                                 
                                    
                                    
                                    
                                    <td>
                                        <xsl:for-each select="current-group()"><a target="_blank" href="{concat('/text/',../../../../../../../tei:publicationStmt/tei:idno[@type='localID'],'.html')}"><xsl:value-of select="../../../../../../../tei:titleStmt/tei:title"/><xsl:text> (</xsl:text><xsl:value-of select="../../../../../../../tei:publicationStmt/tei:idno[@type='localID']"/><xsl:text>)</xsl:text></a><br/></xsl:for-each>
                                    </td>                                    
                                </tr>
                            </xsl:for-each-group>
                        </table>
                    </div>
                    </div>
                <div id="footer">UNIVERSITATEA BABES BOLYAI - This file is licensed under the
                    Creative Commons Attribution-NonCommercial-ShareAlike 3.0.</div>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
