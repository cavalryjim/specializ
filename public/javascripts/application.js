
$(function() {
  //$("#elements th a, #elements .pagination a").live("click", function() {
	//alert( this.href );
    //$.getScript(this.href);
    //return false;
  //});
  
	$( "#accordion" ).accordion(); // accordion on the _browser partial
	$( "#manager_tabs" ).tabs(); // tabs used in the manager module
	$( "#hr_tabs" ).tabs(); // tabs used in the HR module
	$( "#staffing" ).dataTable(); // datatable using in the manager module's staffing tab
	$( "#grouping" ).multiselect({header: false}); // select widget in the manager module's configuration tab
	
	// JDavis: this function responds to the dropdown selection on the manager page and navigates to the select topic.
	$('#topic').change(function() {
		//alert($(this).attr('value'));
		if ($(this).attr('value') > 0)
			window.location.pathname = '/topics/'+$(this).attr('value')+'/edit';
		else
			window.location.pathname = '/topics/new';
			
	});
	
	   
	
});