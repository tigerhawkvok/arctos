<cfinclude template="/includes/_header.cfm">

<cfform name="atts" method="post" enctype="multipart/form-data">
	<input type="hidden" name="Action" value="getFile">
	<input type="file" name="FiletoUpload" size="45">
	<input type="submit" value="Upload this file" class="savBtn">
  </cfform>
<cfif action is "getFile">
	<cfif listlast(FiletoUpload,".") is not "csv">
		only csv allowed.
	</cfif>
	<cfdump var=#form#>
</cfif>