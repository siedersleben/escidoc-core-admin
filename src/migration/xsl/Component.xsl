<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	fedoraxsi:schemaLocation="info:fedora/fedora-system:def/foxml# http://www.fedora.info/definitions/1/0/foxml1-0.xsd"
	xmlns:audit="info:fedora/fedora-system:def/audit#"
	xmlns:fedoraxsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:foxml="info:fedora/fedora-system:def/foxml#"
	xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:types="http://escidoc.mpg.de/metadataprofile/schema/0.1/types"
	xmlns:dcterms="http://purl.org/dc/terms/"
	exclude-result-prefixes="fedoraxsi xsl types rdf dcterms audit">
	<xsl:output encoding="utf-8" method="xml" />
	<!--    
	<xsl:template match="/">

		<xsl:call-template name="componentTemplate" />
	</xsl:template>
	-->
	<xsl:template name="componentTemplate">
		
				<!-- hier wird das neue XML erzeugt -->
				<xsl:for-each select="foxml:datastream">
					<xsl:choose>
						<!-- falls DC, dann nicht tun -->
						<xsl:when
							test="foxml:datastreamVersion/foxml:xmlContent/oai_dc:dc">
						</xsl:when>
						<xsl:when test="@ID='content'">
							<!-- escidoc data stream einfach kopieren -->
							<xsl:copy-of select="."
								copy-namespaces="no" />
						</xsl:when>
						<!-- falls RELS-EXT, dann Inhalt anpassen  und DC erzeugen-->
						<xsl:when
							test="foxml:datastreamVersion/foxml:xmlContent/rdf:RDF">
							<xsl:element name="foxml:datastream"
								namespace="info:fedora/fedora-system:def/foxml#">
								<!-- Attribute übernehmen -->
								<xsl:for-each select="@*">
									<xsl:copy />
								</xsl:for-each>
								<xsl:for-each
									select="foxml:datastreamVersion">
									<!--  dann das Tagging teilweise original übernehmen -->
									<xsl:element
										name="foxml:datastreamVersion"
										namespace="info:fedora/fedora-system:def/foxml#">
										<!-- Attribute übernehmen -->
										<xsl:for-each select="@*">
											<xsl:copy />
										</xsl:for-each>
										<!-- diesen Tag original übernehmen -->
										<xsl:element
											name="foxml:contentDigest"
											namespace="info:fedora/fedora-system:def/foxml#">
											<xsl:for-each
												select="foxml:contentDigest/@*">
												<xsl:copy />
											</xsl:for-each>
										</xsl:element>
										<xsl:element
											name="foxml:xmlContent"
											namespace="info:fedora/fedora-system:def/foxml#">
											<xsl:element name="rdf:RDF"
												namespace="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
												<xsl:element
													name="rdf:Description"
													namespace="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
													<xsl:attribute
														name="rdf:about"
														namespace="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><xsl:value-of
															select="foxml:xmlContent/rdf:RDF/rdf:Description/@rdf:about" />
													</xsl:attribute>
													<xsl:for-each
														select="foxml:xmlContent/rdf:RDF/rdf:Description/*">
														<xsl:variable
															name="name" select="local-name()" />
														<xsl:if
															test="$name='valid-status'">
															<xsl:element
																name="prop:valid-status"
																namespace="http://escidoc.de/core/01/properties/">
																<xsl:value-of
																	select="." />
															</xsl:element>
														</xsl:if>
														<xsl:if
															test="$name='visibility'">
															<xsl:element
																name="prop:visibility"
																namespace="http://escidoc.de/core/01/properties/">
																<xsl:value-of
																	select="." />
															</xsl:element>
														</xsl:if>
														<xsl:if
															test="$name='created-by'">
															<xsl:element
																name="srel:created-by"
																namespace="http://escidoc.de/core/01/structural-relations/">
																<xsl:attribute
																	name="rdf:resource"
																	namespace="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><xsl:value-of
																		select="@rdf:resource" />
																</xsl:attribute>
															</xsl:element>
														</xsl:if>
														<xsl:if
															test="$name='created-by-title'">
															<xsl:element
																name="prop:created-by-title"
																namespace="http://escidoc.de/core/01/properties/">
																<xsl:value-of
																	select="." />
															</xsl:element>
														</xsl:if>
														<xsl:if
															test="$name='mime-type'">
															<xsl:element
																name="prop:mime-type"
																namespace="http://escidoc.de/core/01/properties/">
																<xsl:value-of
																	select="." />
															</xsl:element>
														</xsl:if>
														<xsl:if
															test="$name='content-category'">
															<xsl:element
																name="prop:content-category"
																namespace="http://escidoc.de/core/01/properties/">
																<xsl:value-of
																	select="." />
															</xsl:element>
														</xsl:if>
														<xsl:if
															test="$name='objectType'">
															<xsl:element
																name="rdf:type"
																namespace="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
																<xsl:attribute
																	name="rdf:resource"
																	namespace="http://www.w3.org/1999/02/22-rdf-syntax-ns#">http://escidoc.de/core/01/resources/Component</xsl:attribute>
															</xsl:element>
														</xsl:if>
														<xsl:if
															test="$name='pid'">
															<xsl:element
																name="prop:pid"
																namespace="http://escidoc.de/core/01/properties/">
																<xsl:value-of
																	select="." />
															</xsl:element>
														</xsl:if>
													</xsl:for-each>
												</xsl:element>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:for-each>
							</xsl:element>
							<xsl:element name="foxml:datastream" namespace="info:fedora/fedora-system:def/foxml#">
								<xsl:for-each select="@*">
									<xsl:variable name="name" select="local-name()"/>
									<!-- die ID muss hier analog zum Tagging in datastreamVersion in DC geändert werden, die restlichen Attribute übernehmen -->
									<xsl:choose>
										<xsl:when test="$name = 'ID'">
											<xsl:attribute name="ID">DC</xsl:attribute>
										</xsl:when>
										<xsl:otherwise>
											<xsl:attribute name="{$name}"><xsl:value-of select="."/></xsl:attribute>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								<xsl:for-each select="foxml:datastreamVersion">
									<xsl:variable name="counter" select="position() -1"/>
									<!-- zunächst XML umbauen -->
									<xsl:element name="foxml:datastreamVersion" namespace="info:fedora/fedora-system:def/foxml#">
										<xsl:attribute name="CREATED" select="@CREATED"/>
										<xsl:attribute name="ID" select="concat('DC.',$counter)"/>
										<xsl:attribute name="LABEL" select="''"/>
										<xsl:attribute name="MIMETYPE" select="'text/xml'"/>
										<xsl:element name="foxml:contentDigest" namespace="info:fedora/fedora-system:def/foxml#">
											<xsl:for-each select="foxml:contentDigest/@*">
												<xsl:copy/>
											</xsl:for-each>
										</xsl:element>
										<xsl:element name="foxml:xmlContent" namespace="info:fedora/fedora-system:def/foxml#">
											<xsl:element name="oai_dc:dc" namespace="http://www.openarchives.org/OAI/2.0/oai_dc/">
												
												<xsl:for-each select="foxml:xmlContent/rdf:RDF/rdf:Description/*">
													<xsl:variable name="name" select="local-name()"/>
													<xsl:choose>
														<xsl:when test="$name = 'file-name'">
															<xsl:element name="dc:title" namespace="http://purl.org/dc/elements/1.1/">
																<xsl:value-of select="text()"/>
															</xsl:element>
														</xsl:when>
														<xsl:when test="$name = 'description'">
															<xsl:element name="dc:description" namespace="http://purl.org/dc/elements/1.1/">
																<xsl:value-of select="text()"/>
															</xsl:element>
														</xsl:when>
													</xsl:choose>
												</xsl:for-each>
												<xsl:element name="dc:identifier" namespace="http://purl.org/dc/elements/1.1/">
													<xsl:value-of select="/foxml:digitalObject/@PID"/>
												</xsl:element>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:for-each>
							</xsl:element>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>
