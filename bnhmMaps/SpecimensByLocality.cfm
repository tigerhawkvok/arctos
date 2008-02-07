Retrieving map data - please wait....
<cfflush>
<cfoutput>
	<cfif isdefined("client.roles") and listfindnocase(client.roles,"coldfusion_user")>
		<cfset flatTableName = "flat">
	<cfelse>
		<cfset flatTableName = "filtered_flat">
	</cfif>
	<cfset dlPath = "#Application.webDirectory#/bnhmMaps/">
	<cfset dlFile = "tabfile#cfid##cftoken#.txt">
	<cfquery name="data" datasource="#Application.web_user#">
		select 
			#flatTableName#.collection_object_id,
			#flatTableName#.cat_num,
			lat_long.dec_lat,
			lat_long.dec_long,
			decode(lat_long.accepted_lat_long_fg,
				1,'yes',
				0,'no') isAcceptedLatLong,
			to_meters(lat_long.max_error_distance,lat_long.max_error_units) errorInMeters,
			lat_long.datum,
			#flatTableName#.scientific_name,
			#flatTableName#.collection,
			#flatTableName#.spec_locality,
			#flatTableName#.locality_id,
			#flatTableName#.verbatimLatitude,
			#flatTableName#.verbatimLongitude,
			lat_long.lat_long_id
		 from 
		 	#flatTableName#,
		 	lat_long
		 where
		 	#flatTableName#.locality_id = lat_long.locality_id and
		 	#flatTableName#.locality_id IN (
		 		select #flatTableName#.locality_id from #table_name#,#flatTableName#
		 		where #flatTableName#.collection_object_id = #table_name#.collection_object_id)
	</cfquery>
	<cfdump var=#data#>
	table_name: #table_name#
	<cfquery name="loc" dbtype="query">
		select 
			dec_lat,
			dec_long,
			isAcceptedLatLong,
			errorInMeters,
			datum,
			spec_locality,
			locality_id,
			verbatimLatitude,
			verbatimLongitude,
			lat_long_id
		from
			data
		group by
			dec_lat,
			dec_long,
			isAcceptedLatLong,
			errorInMeters,
			datum,
			spec_locality,
			locality_id,
			verbatimLatitude,
			verbatimLongitude,
			lat_long_id
	</cfquery>
	<cffile action="write" file="#dlPath##dlFile#" addnewline="no" output="" nameconflict="overwrite">
	<cfloop query="loc">
		<cfquery name="sdet" dbtype="query">
			select 
				collection_object_id,
				cat_num,
				scientific_name,
				collection
			from
				data
			where
				locality_id = #locality_id#
		</cfquery>
		<cfset specLink = "">
		<cfloop query="sdet">
			<cfif len(#specLink#) is 0>
				<cfset specLink = "#collection# #cat_num# #scientific_name#">
			<cfelse>
				<cfset specLink = "#specLink#<br>#collection# #cat_num# #scientific_name#">
			</cfif>
		</cfloop>
		<cfset relInfo='<a href="#Application.ServerRootUrl#/editLocality.cfm?locality_id=#locality_id#" target="_blank">#spec_locality#</a>'>
		<cfset oneLine="#relInfo##chr(9)##locality_id##chr(9)##lat_long_id##chr(9)##spec_locality##chr(9)##dec_lat##chr(9)##dec_long##chr(9)##errorInMeters##chr(9)##datum##chr(9)##isAcceptedLatLong##chr(9)##specLink##chr(9)##verbatimLatitude#/#verbatimLongitude#">
		<cfset oneLine=trim(oneLine)>
		<cffile action="append" file="#dlPath##dlFile#" addnewline="yes" output="#oneLine#">
	</cfloop>

	<cfset bnhmUrl="http://berkeleymapper.berkeley.edu/index.php?ViewResults=tab&tabfile=#Application.ServerRootUrl#/bnhmMaps/#dlFile#&configfile=#Application.ServerRootUrl#/bnhmMaps/SpecByLoc.xml&sourcename=Locality">
	

	<script type="text/javascript" language="javascript">
		document.location='#bnhmUrl#';
	</script>
</cfoutput>