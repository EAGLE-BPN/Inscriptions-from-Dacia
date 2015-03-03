<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns:gcse="nothing"
	exclude-result-prefixes="xs tei" version="2.0">
	
	
	<xsl:output method="html"/>
	
	<xsl:variable name="inscription">
		<xsl:for-each select="//tei:item/@corresp">
			<xsl:sequence select="document(concat('../xml/',.,'.xml'))"/>
		</xsl:for-each>
	</xsl:variable>
	
	
	
	<xsl:template match="/">
		
		<!-- TO BE USED ON GENERAL INDEX creates directly an HTML index of terms with drop down menus for each value which show each inscription related to the term.-->
		
		
		
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<title>Inscriptions from Dacia</title>
				<link rel="stylesheet" href="graficagenerale.css" type="text/css"/>
				<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css"/>
					<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
					<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
			</head>
			<body>
				<div data-role="header" id="header">
					<h1>Inscriptions by place</h1>
				</div>
				
				<div id="nav">
					<a href="index.html">Home</a>
					<br/>
					<a href="browseinscriptions.html">Browse Inscriptions</a>
					<br/>
					<a href="browsebytype.html">Inscriptions by Type</a>
					<br/>
					<a href="Bibliografia.html">Inscriptions by provenance</a>
					<br/>
					
				</div>
				
				<div id="section">
					
					<div id="placelistorigin">
						<h1>Ancient Places of provenance of the inscriptions</h1>
						
							<xsl:for-each-group select="$inscription//tei:origPlace" group-by="tei:placeName[@type='provincItalicRegion']/@ref">
								
								<xsl:sort order="ascending" select="lower-case(tei:placeName[@type='provincItalicRegion'])"/>
								<h2>
									<a target="_blank" href="{tei:placeName[@type='provincItalicRegion']/@ref}"><xsl:value-of select="tei:placeName[@type='provincItalicRegion']"/></a></h2>
								<xsl:for-each-group select="current-group()" group-by="tei:placeName[not(@type)]/@ref">
									
								
									<div data-role="collapsible"><h3><a target="_blank" href="{tei:placeName[not(@type)]/@ref}"><xsl:value-of select="tei:placeName[not(@type)]"/></a></h3>
										<ul data-role="listview"><xsl:for-each select="current-group()"><li><a target="_blank"
													href="{concat('/text/',ancestor::tei:TEI//tei:idno[@type='localID'],'.html')}">
													<xsl:text> (</xsl:text>
													<xsl:value-of
														select="ancestor::tei:TEI//tei:idno[@type='localID']"/>
													<xsl:text>) </xsl:text>
												</a></li></xsl:for-each></ul>
											</div>
									
										</xsl:for-each-group>
								
							</xsl:for-each-group>
						
					</div>
					
					<div id="palcelistfound">
						<h1>Inscriptions by findspot</h1>
						
							<xsl:for-each-group select="$inscription//tei:provenance[@type='found']" group-by="tei:placeName[@type='modernCountry']">
								
								<xsl:sort order="descending" select="lower-case(tei:placeName[@type='modernCountry'])"/>
								<h2>
									<xsl:value-of select="tei:placeName[@type='modernCountry']"/></h2>
									<xsl:for-each-group select="current-group()" group-by="tei:placeName[@type='modernRegion']">
										
										<xsl:sort order="ascending" select="lower-case(tei:placeName[@type='modernRegion'])"/>
										<h3><xsl:value-of select="tei:placeName[@type='modernRegion']"/></h3>
										
									
										<xsl:for-each-group select="current-group()" group-by="tei:placeName[not(@type)]">
											<div data-role="collapsible"><h4><xsl:value-of select="tei:placeName[not(@type)]"/></h4>
												<ul data-role="listview"><xsl:for-each select="current-group()"><li><a target="_blank"
													href="{concat('/text/',ancestor::tei:TEI//tei:idno[@type='localID'],'.html')}">
													<xsl:text> (</xsl:text>
													<xsl:value-of
														select="ancestor::tei:TEI//tei:idno[@type='localID']"/>
													<xsl:text>) </xsl:text>
												</a></li></xsl:for-each></ul>
											</div>
										</xsl:for-each-group>
									</xsl:for-each-group>
								
							</xsl:for-each-group>
						
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>