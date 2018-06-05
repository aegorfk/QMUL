<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version ="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>Boat Listing</head>
            <body>
                <p>Your search was: price &lt; 100000, length &lt; 40 feet.</p>
                
                <br/>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <xsl:for-each select="boats/boat">
                            <xsl:if test = "price &lt; 100000">
                                <xsl:if test="length &lt; 40">
                                    <tr>
                                        <td><xsl:value-of select="name"/></td>
                                        <td><xsl:value-of select="make"/></td>
                                        <td><xsl:value-of select="type"/></td>
                                        <td><xsl:value-of select="year"/></td>
                                        <td><xsl:value-of select="length"/></td>
                                        <td><xsl:value-of select="price"/></td>
                                        <!-- a table cell per feature of the boat -->
                                    </tr>
                                    <!-- a table row per boat -->
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                        <!-- a table row per boat -->
                    </tr>
                </table>
                
                <!-- Counting of average for all boats-->
                <p>avg price: all boats: <xsl:value-of select="sum(boats/boat//price) div count(boats//boat)"/></p>
                
                <!--Sub-set of relevant boats-->
                <xsl:variable name="relevantBoats" select="boats/boat[price&lt;100000 and length&lt;40]"/>
                
                <!-- Counting of average for relevant boats-->
                <p>avg price: relevant boats: <xsl:value-of select="sum($relevantBoats//price) div count($relevantBoats)"/></p>
                
                
                <p>avg length: all boats: <xsl:value-of select="sum(boats/boat//length) div count(boats//boat)"/></p>
                <p>avg length: relevant boats: <xsl:value-of select="sum($relevantBoats//length) div count($relevantBoats)"/></p>  
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>