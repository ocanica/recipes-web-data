<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Web Data TMA</title>
				<meta charset="utf-8"/>
				<link rel="stylesheet" href="recipes.css"/>
			</head>
			<body>
				
				<div id="heading">
					<h1>BBC Good Food Recipes</h1>
				</div>
				
				<xsl:for-each select="//recipe">
					
					<xsl:sort data-type="number" select="time/cook" order="ascending"/>
					<xsl:sort select="title" order="ascending"/>
					
					<xsl:variable name="cook_time">
						<xsl:choose>
							<xsl:when test="time/cook &gt;= 60">Slow Burner</xsl:when>
							<xsl:when test="time/cook &lt; 60 and time/cook &gt;= 30">Medium Burner</xsl:when>
							<xsl:otherwise>Quick and Easy</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<table class="details">
						<tr>
							<th colspan="10"><xsl:value-of select="title"/></th>
						</tr>
						<tr>
							<th colspan="10"><xsl:value-of select="description"/></th>
						</tr>
						<tr>
							<td>Nutrition</td>
							<td class="nutri">kcal <xsl:value-of select="nutrition/kcal"/></td>
							<td class="nutri">fat <xsl:value-of select="nutrition/fat"/></td>
							<td class="nutri">sats <xsl:value-of select="nutrition/saturates"/></td>
							<td class="nutri">carbs <xsl:value-of select="nutrition/carbs"/></td>
							<td class="nutri">sugar <xsl:value-of select="nutrition/sugars"/></td>
							<td class="nutri">fibre <xsl:value-of select="nutrition/fibre"/></td>
							<td class="nutri">protein <xsl:value-of select="nutrition/protein"/></td>
							<td class="nutri">salt <xsl:value-of select="nutrition/salt"/></td>
							
							<td class="ingred" rowspan="7"> <strong>Ingredients</strong>
								<ul>
									<xsl:for-each select="ingredients/ingredient">
										<li><xsl:value-of select="."/></li>
									</xsl:for-each>
								</ul>
							</td>
							
						</tr>
						<tr>
							<td>Cooking time</td>
							<td colspan="8"><xsl:value-of select="time/cook"/> minutes, <xsl:value-of select="$cook_time"/></td>
						</tr>
						<tr>
							<td>Preparation time</td>
							<td colspan="8"><xsl:value-of select="time/prep"/> minutes</td>
						</tr>
						<tr>
							<td>Difficulty</td>
							<td colspan="8"><xsl:value-of select="difficulty"/></td>
						</tr>
						<tr>
							<td>Serves</td>
							<td colspan="8"><xsl:value-of select="serves"/> people</td>
						</tr>
						<tr>
							<td>Method</td>
							<td colspan="8">
								<ul>
									<xsl:for-each select="method/step">
										<li><xsl:value-of select="."/></li>
									</xsl:for-each>
								</ul>
							</td>
						</tr>
					</table>
				</xsl:for-each>	
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>