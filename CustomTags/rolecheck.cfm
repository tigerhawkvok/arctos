<cfoutput>

<cfset escapeGoofyInstall=replace(cgi.SCRIPT_NAME,"/cfusion","","all")>
<!--- check password --->
<cfif isdefined("session.force_password_change") and 
	#session.force_password_change# is "yes" and 
	#escapeGoofyInstall# is not "/ChangePassword.cfm">
	<cflocation url="/ChangePassword.cfm">	
</cfif>

<cfset logfile = "#Application.webDirectory#/log/UnauthAccess.log">

<!---  --->
<cfquery name="isValid" datasource="#Application.web_user#" cachedWithin="#CreateTimeSpan(0,1,0,0)#">
	select ROLE_NAME from cf_form_permissions 
	where form_path = '#escapeGoofyInstall#'
</cfquery>

<!---
<hr>
escapeGoofyInstall: #escapeGoofyInstall#
select ROLE_NAME from cf_form_permissions 
	where form_path = '#escapeGoofyInstall#'
	<hr>
isValid.recordcount: #isValid.recordcount#;
--->
<cfif #isValid.recordcount# is 0>
	This form is not controlled. Add it to Form Permissions or get ready to see it go bye-bye.
	<cfmail subject="Uncontrolled Form" to="#Application.technicalEmail#" from="Security@#Application.fromEmail#" type="html">
		Form #escapeGoofyInstall# needs some control. Found by #session.username# (#cgi.HTTP_X_Forwarded_For# - #remote_host#)
	</cfmail>
<cfelse>
	<cfloop query="isValid">
		<cfif not listfindnocase(session.roles,role_name)>
			<cfset badYou = "yes">
		</cfif>
	</cfloop>
</cfif>
<!--- if they are logged in, check their cookie to see if they've been idle for >90m (ie, with browser not running) ---->
<cfif isdefined("cookie.username") and len(#session.username#) gt 0>
	<cfif isdefined("cookie.ArctosSession")>
		<cfset thisTime = #dateconvert('local2Utc',now())#>
		<cfset cookieTime = #cookie.ArctosSession#>		
		<cfset cage = DateDiff("n",cookieTime, thisTime)>
		<cfset tleft = Application.session_timeout - cage>
		<cfif tleft lte 0>
			<!--- cookie expired, bye now --->
			<cfset badYou = "yes">
		</cfif>
	<cfelse>
		<!--- username but no cookie? BAD! 
        <cfset badYou = "yes">
       --->

			
	</cfif>
</cfif>
<br>
<cfif isdefined("badyou")>
	<cfset badguy = "#cgi.HTTP_X_Forwarded_For##chr(9)##remote_host##chr(9)##cgi.SCRIPT_NAME##chr(9)##dateformat(now(),'dd-mmm-yyyy')# #TimeFormat(Now(),'HH:mm:ss')#">
	<cffile action='append' file='#logfile#' addnewline='yes' output='#badguy#'>
	<cfcookie name="ArctosSession" value="-" expires="NOW" domain="#Application.domain#" path="/">
    <cfmail subject="Access Violation" to="#Application.technicalEmail#" from="Security@#Application.fromEmail#" type="html">
		IP address (#cgi.HTTP_X_Forwarded_For# - #remote_host#) tried to access
		#escapeGoofyInstall#
		<p>
			The log entry is:
			<br>
			#badguy#
		</p>
		<br>This message was generated by /CustomTags/rolecheck.cfm.
	</cfmail>
	<!--- make sure they're really logged out --->
	<table cellpadding="10">
	<tr><td valign="top"><img src="/images/oops.gif" alt="[ unauthorized access ]"></td>
	<td><font color="##FF0000" size="+1">
			You tried to visit a form for which you are not authorized,
			or your login has expired. 
			<br>
			If this message is in error, please <a href="/info/bugs.cfm">file a bug report</a> or contact the Arctos team.
			<br>
			Click <a href="/home.cfm">here</a> to visit the Arctos home page, or log in below.
	</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<form name="logIn" method="post" action="/login.cfm">
	<input type="hidden" name="action" value="signIn">
	<input type="hidden" name="gotopage" value="#escapeGoofyInstall#">
	<div style="border: 2px solid ##0066FF; padding:2px; width:25%; ">
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="right">
				Username:&nbsp;
			</td>
			<td>
				<input type="text" name="username">
			</td>
		</tr>
		<tr>
			<td align="right">
				Password:&nbsp;
			</td>
			<td>
				 <input type="password" name="password">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="Log In" class="lnkBtn"
   					onmouseover="this.className='lnkBtn btnhov'" onmouseout="this.className='lnkBtn'">	
				<input type="button" value="Create Account" class="lnkBtn"
   					onmouseover="this.className='lnkBtn btnhov'" onmouseout="this.className='lnkBtn'"
					onClick="logIn.action.value='newUser';submit();">
					<span class="infoLink" 
						onclick="pageHelp('customize');">What's this?</span>
			</td>
		</tr>
		<tr>
			
			<td colspan="2">
				<div class="infoBox">
					Logging in enables you to turn on, turn off, or otherwise customize many features of this database. To create an account and log in, simply supply a username and password here and click Create Account.
				</div>
			</td>
		</tr>
	</table>
	</div>
	</form>
		</td>
	</tr>
	</table>
	<cfabort>
<cfelse>
	<!--- 
		They have permissions to be here.
		Refresh their timeout and set up a timer to remind them of expiring sessions 
	--->
	<span class="sessionTimer" id="sessionTimer"></span>
    <script type="text/javascript">
		function showSessionTimeLeft () {
			//alert('get timeout')
			DWREngine._execute(_cfscriptLocation, null, 'getSessionTimeout',showSessionTimeLeft_Result);					
		}
		function showSessionTimeLeft_Result (result) {
			//alert('got it: ' + result.length + ':' + result)
			if (result.length > 0) {
				if (result <= 0) {
					// too late, bye now...
					//alert('Your session has expired. You must log in to continue.');
					//document.location='/login.cfm?action=signOut';
				} else if (result <= 10) {
					var st = document.getElementById('sessionTimer');
					st.innerHTML='Session expires in ' + result + 'm';
					st.className='sessionExpiring';
					setTimeout('showSessionTimeLeft()', 60000); // check back in a minute
				} else {
					var st = document.getElementById('sessionTimer');
					st.innerHTML='Session expires in ' + result + 'm';
					st.className='sessionTimer';
					setTimeout('showSessionTimeLeft()', 60000); // check back in a minute
				}
			}
		}
		 setTimeout('showSessionTimeLeft()', 10);
	</script>

</cfif>
</cfoutput>