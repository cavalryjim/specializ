
$(function() {
  //$("#elements th a, #elements .pagination a").live("click", function() {
	//alert( this.href );
    //$.getScript(this.href);
    //return false;
  //});
  
	$( "#accordion" ).accordion();
	$( "#manager_tabs" ).tabs();
	$( "#hr_tabs" ).tabs();
	
	$('#topic').change(function()
		{
			//alert($(this).attr('value'));
			if ($(this).attr('value') > 0)
				window.location.pathname = 'topics/'+$(this).attr('value')+'/edit';
			else
				window.location.pathname = 'topics/new';
			
		});
});