<cfinclude template="/includes/alwaysInclude.cfm">


	<script>
		function t(){alert('t');}


		$("form#formEdit").submit(function(event){
			event.preventDefault();
alert('hi');

/*
			for ( i = 1; i < $("#numberOfIDs").val(); i++ ) {
				// Logs "try 0", "try 1", ..., "try 4".
				console.log( "try " + i );
			}
*/


			console.log('good to go');
			return false;
		});




	</script>
<form  id="formEdit">

	<input type="submit" name="not_submit" value="Save Changes" class="savBtn">
</form>



	<input type="button" name="t" value="t" class="savBtn" onclick="t()">