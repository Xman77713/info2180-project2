<?php
echo '
<!-- Dashboard Home -->
<section name="Home">
	<div id="db-home-header" class="dbdiv-header">
		<h2>Dashboard</h2>
		<input type="button" name="addcontact" value="+	Add Contact">
	</div>

	<div id="filter">
		<div id="stickypatch">
			<!-- Div makes filter.png stick to All -->
			<img src="images/filter.png" class="sideicon" alt="Filter Icon">
			<input type="button" value="All">
		</div>

		<input type="button" value="Sales Leads">
		<input type="button" value="Support">
		<input type="button" value="Assigned to me">
	</div>

	<table id="db-home-table">
		<th>Name</th>
		<th>Email</th>
		<th>Company</th>
		<th>Type</th>
		<th></th>

		<tr>
			<td>A name</td>
			<td>An email</td>
			<td>UWI Patty Co.</td>
			<td>A type</td>
			<td><input type="button" value="View"></td>
		</tr>
	</table>

</section>
'
?>