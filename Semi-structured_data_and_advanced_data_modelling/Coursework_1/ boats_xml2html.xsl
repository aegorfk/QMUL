<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    <xsl:template match="/">
        <html>
            <head>Boat Listing</head>
            <body>
                <p>Your search was: price &lt; 100000, length &lt; 40 feet.</p>
                <br/>
                <table border="1">
                    <tr bgcolor="#9acd32">
                    <xsl:for-each select="boats/boat">
                        <tr>
                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="make"/></td>
                            <td><xsl:value-of select="type"/></td>
                            <td><xsl:value-of select="year"/></td>
                            <td><xsl:value-of select="length"/></td>
                            <td><xsl:value-of select="price"/></td>
                            <!-- a table cell per feature of the boat -->
                        </tr>
                    </xsl:for-each>
                    <!-- a table row per boat -->
                </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>