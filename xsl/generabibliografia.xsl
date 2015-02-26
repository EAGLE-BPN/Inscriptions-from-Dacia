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

		<!-- TO BE USED ON GENERAL INDEX creates directly an HTML list of bibliographical references from an UNSTRUCTURED BIBLIOGRAPHY-->



		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<title>Inscriptions from Dacia</title>
				<link rel="stylesheet" href="graficagenerale.css" type="text/css"/>


			</head>
			<body>
				<div id="header">
					<h1>List of bibliographic references</h1>
				</div>

				<div id="nav">
					<a href="index.html">Home</a>
					<br/>
					<a href="browseinscriptions.html">Browse Inscriptions</a>
					<br/>
					<a href="browsebytype.html">Inscriptions by Type</a>
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


					<div id="biblist">
						<ul>
							<xsl:for-each-group select="$inscription//tei:bibl" group-by="if (text()[contains(.,'p.')]) then (substring-before(text(), 'p.')) else text()">

								<xsl:sort order="ascending" select="lower-case(.)"/>
								<li>
									<xsl:value-of select="if (text()[contains(.,'p.')][not(contains(.,'AE'))][not(contains(.,'CIL'))]) then (substring-before(text(), 'p.')) else text()"/>
									<ul>
										<xsl:for-each select="current-group()">
											<li>
												<a target="_blank"
												href="{concat('/text/',ancestor::tei:TEI//tei:idno[@type='localID'],'.html')}">
												<xsl:text> (</xsl:text>
												<xsl:value-of
												select="ancestor::tei:TEI//tei:idno[@type='localID']"/>
												<xsl:text>) </xsl:text>
												</a>
											</li>
										</xsl:for-each>
									</ul>
								</li>
							</xsl:for-each-group>
						</ul>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
