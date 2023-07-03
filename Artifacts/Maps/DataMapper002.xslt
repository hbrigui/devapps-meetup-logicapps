<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dm="http://azure.workflow.datamapper" xmlns="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="xsl xs math dm" version="3.0" expand-text="yes">
  <xsl:output indent="yes" media-type="text/json" method="text" omit-xml-declaration="yes" />
  <xsl:template match="/">
    <xsl:variable name="xmlinput" select="json-to-xml(/)" />
    <xsl:variable name="xmloutput">
      <xsl:apply-templates select="$xmlinput" mode="azure.workflow.datamapper" />
    </xsl:variable>
    <xsl:value-of select="xml-to-json($xmloutput,map{'indent':true()})" />
  </xsl:template>
  <xsl:template match="/" mode="azure.workflow.datamapper">
    <map>
      <array key="items">
        <xsl:for-each select="/*/*[@key='products']/*">
          <map>
              <string key="id">{*[@key='id']}</string>              
              <string key="name">{*[@key='name']}</string>
              <string key="tags">{*[@key='features']}</string>
              <string key="category">{*[@key='category']}</string>
              <string key="price">{*[@key='price']}</string>
          </map>
        </xsl:for-each>
      </array>
    </map>
  </xsl:template>
</xsl:stylesheet>