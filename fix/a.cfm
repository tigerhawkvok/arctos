<cfinclude template="/includes/_header.cfm">
<script type='text/javascript' src='/includes/jquery/jquery-autocomplete/jquery.autocomplete.pack.js'></script>



<form >
<input type="text" name="partname" id="partname">

</form>



<script>
jQuery("#partname").autocomplete("/ajax/part_name.cfm", {
		width: 320,
		max: 20,
		autofill: true,
		highlight: false,
		multiple: true,
		multipleSeparator: "|",
		scroll: true,
		scrollHeight: 300
	});
	
</script>