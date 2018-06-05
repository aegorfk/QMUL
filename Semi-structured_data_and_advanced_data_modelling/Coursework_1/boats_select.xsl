<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <xsl:template match="/">
        <boats>
            <xsl:apply-templates/>
        </boats>      
    </xsl:template>
    
    <xsl:template match="boat">
        <xsl:if test = "price &lt; 100000 and length &lt; 40">
                 <boat>
                    <name><xsl:value-of select="name"/></name>
                    <make><xsl:value-of select="make"/></make>
                    <type><xsl:value-of select="type"/></type>
                    <year> <xsl:value-of select="year"/></year>
                    <length><xsl:value-of select="length"/></length>  
                    <price><xsl:value-of select="price"/></price>  
                </boat>
        </xsl:if>
        
    </xsl:template>
    
</xsl:stylesheet>