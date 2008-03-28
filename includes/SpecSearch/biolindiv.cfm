<cfif len(#exclusive_collection_id#) gt 0>
	<cfset partTable = "cctspecimen_part_name#exclusive_collection_id#">
	<cfset presTable = "cCTSPECIMEN_PRESERV_METHOD#exclusive_collection_id#">
	<cfset pmodTable = "cCTSPECIMEN_PART_MODIFIER#exclusive_collection_id#">
<cfelse>
	<cfset partTable = "ctspecimen_part_name">
	<cfset presTable = "CTSPECIMEN_PRESERV_METHOD">
	<cfset pmodTable = "CTSPECIMEN_PART_MODIFIER">
</cfif>
<cfquery name="pres" datasource="#Application.web_user#">
	select distinct(preserve_method) from #presTable#
	ORDER BY preserve_method
</cfquery>
<cfquery name="ctpart_mod" datasource="#Application.web_user#">
	select distinct part_modifier from #pmodTable# order by part_modifier
</cfquery>
<cfquery name="ctbiol_relations" datasource="#Application.web_user#">
	select biol_indiv_relationship  from ctbiol_relations
</cfquery>
<cfquery name="ctAttributeType" datasource="#Application.web_user#">
	select distinct(attribute_type) from ctattribute_type order by attribute_type
</cfquery>				
<table id="t_identifiers" class="ssrch">
	<tr>
		<td class="lbl">
			Preservation Method:
		</td>
		<td class="srch">
			<select name="preserv_method" size="1">
				<option value=""></option>
				<cfloop query="pres"> 
					<option value="#pres.preserve_method#">#pres.preserve_method#</option>
				</cfloop>
			</select>
			<span class="infoLink" onclick="getCtDoc('ctspecimen_preserv_method',SpecData.preserv_method.value);">Define</span>
		</td>
	</tr>
	<tr>
		<td class="lbl">
			Part Modifier:
		</td>
		<td class="srch">
			<select name="part_modifier" size="1">
				<option value=""></option>
				<cfloop query="ctpart_mod"> 
					<option value="#ctpart_mod.part_modifier#">#ctpart_mod.part_modifier#</option>
				</cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td class="lbl">
			Relationship:
		</td>
		<td class="srch">
			<select name="relationship" size="1">
				<option value=""></option>
				<cfloop query="ctbiol_relations">
					<option value="#ctbiol_relations.biol_indiv_relationship#">
						#ctbiol_relations.biol_indiv_relationship#</option>
				</cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td class="lbl">
			Derived Relationship:
		</td>
		<td class="srch">
			<select name="derived_relationship" size="1">
				<option value=""></option>
					<option value="offspring of">offspring of</option>
			</select>	
		</td>
	</tr>
	<tr>
		<td class="lbl">
			<select name="attribute_type_1" size="1">
				<option selected value=""></option>
					<cfloop query="ctAttributeType">
						<option value="#ctAttributeType.attribute_type#">#ctAttributeType.attribute_type#</option>
					</cfloop>			
			  </select>
		</td>
		<td class="srch">
			<select name="attOper_1" size="1">
				<option selected value="">equals</option>
				<option value="like">contains</option>
				<option value="greater">greater than</option>
				<option value="less">less than</option>
			</select>
			<input type="text" name="attribute_value_1" size="20">
			<span class="infoLink" 
				onclick="windowOpener('/info/attributeHelpPick.cfm?attNum=1&attribute='+SpecData.attribute_type_1.value,'attPick','width=600,height=600, resizable,scrollbars');">
				Pick
			</span>
			<input type="text" name="attribute_units_1" size="6">
		</td>
	</tr>		
</table>