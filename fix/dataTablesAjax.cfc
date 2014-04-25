<cfcomponent>
	<cffunction name="t" access="remote" returnformat="plain" queryFormat="column">
		<cfparam name="jtStartIndex" type="numeric" default="0">
		<cfparam name="jtPageSize" type="numeric" default="10">
		<cfparam name="jtSorting" type="string" default="GUID ASC">
		<cfset jtStopIndex=jtStartIndex+jtPageSize>
		<cfquery name="r_d" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,session.sessionKey)#">
			select * from cf_spec_res_cols_exp where category='required' order by DISP_ORDER
		</cfquery>
		<cfquery name="d"datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,session.sessionKey)#">
			Select * from (
					Select a.*, rownum rnum From (
						select * from #session.SpecSrchTab# order by #jtSorting#
					) a where rownum <= #jtStopIndex#
				) where rnum >= #jtStartIndex#
		</cfquery>
		<cfoutput>
			<!--- 
				CF and jtable don't play well together, so roll our own.... 
				parseJSON makes horrid invalud datatype assumptions, so we can't use that either.	
			---->
			<cfset x=''>
			<cfloop query="d">
				<cfset trow="">
				<cfloop list="#d.columnlist#" index="i">
					<cfset theData=evaluate("d." & i)>
					<cfset theData=replace(theData,'"','\"',"all")>
					<cfif i is "guid">
						<cfset temp ='"GUID":"<a target=\"_blank\" href=\"/guid/' & theData &'\">' &theData & '</a>"'>
					<cfelse>
						<cfset temp = '"#i#":"' & theData & '"'>
					</cfif>
					<cfset trow=listappend(trow,temp)>
				</cfloop>
				<cfset trow="{" & trow & "}">
				<cfset x=listappend(x,trow)>
			</cfloop>
			<cfset result='{"Result":"OK","Records":[' & x & '],"TotalRecordCount":#TotalRecordCount#}'>
		</cfoutput>
		<cfreturn result>
	</cffunction>
</cfcomponent>