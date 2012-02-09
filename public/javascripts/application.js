//var rTable;
var mTabs;
var hrTabs;
var meTabs;
var giRedraw = false;

//$('html').addClass('js');

$(function() {
	$( "#app_container" ).show(); //JDavis: this keeps from flashing unformatted content (fouc).
	
	$(".best_in_place").best_in_place();
	
	$('#navigation_horiz').naviDropDown({
		dropDownWidth: '150px'
	});
	
	$(".collapsibleContainer").collapsiblePanel();
	
	
	/*
	var browserWidth = $.cookie("browserWidth");
	
	var rBrowser = $( "#browser_div" ).resizable({
		maxWidth: 400,
		minWidth: 200,
		minHeight: 600,
		stop: function(event, ui){
			$.cookie("browserWidth", ui.size.width);
		}
	});
	
	 */
	
	var browserState = $.cookie("browserState");
	var browserCol = $( "#browser_col" );
	var browserTrigger = $( "#browser_trigger" );
	
	if (browserState == 'closed') {
		browserCol.hide();
		browserTrigger.html('My Topics +');
	} else {
		browserCol.show();
	}
	
	browserTrigger.click(function() // JDavis: this hides & shows the left-side browser.
	  {
		if (browserCol.is(':hidden')){
			$(this).html('My Topics -');
			$.cookie("browserState", "open");
	} else {
			$(this).html('My Topics +');
			$.cookie("browserState", "closed");
		}
		$( "#browser_col" ).slideToggle("slow");
	});
	
	var hCalendar = $('#calendar').fullCalendar({
		events: 'me/events',
		
		eventClick: function(event){
		fnEvents(event.start);
		},
		
		dayClick: function(date) {
			fnEvents(date);
		}
	
	});
	
	$( "#topic_group_datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
	
	bAccordion = $( "#accordion" ).accordion({ fillSpace: true }); // accordion on the _browser partial
	mTabs = $( "#manager_tabs" ).tabs({ cookie:{ expires:1 }}); // tabs used in the manager module
	hrTabs = $( "#hr_tabs" ).tabs({ cookie:{ expires:1 }}); // tabs used in the HR module
	$( "#me_tabs" ).tabs({ cookie:{ expires:1 }});   // tabs used in the Me module
	
	
	//$("#rating_table").jqGrid('navGrid','#pager_rating_table',{edit:false,add:false,del:false});
/*
	$("#rating_table").each(function() {
			var myid = this.id;
			var mycaption = "Topic Items";
		
			tableToGrid("#" + myid, { 
				pager:'#pager_rating_table',
				rowNum:10,
				height: '300',
				width: '100%',
				viewrecords: true,
				caption: mycaption
			});

			

	});
*/		
	
	$( "#topic_grouping_ids").multiselect({
		header: "Select groups that will participate",
		minWidth: 300,
		position: {
		      my: 'center',
		      at: 'center'
		   }
	}).multiselectfilter(); // select widget in the manager module's setup tab
	
	$( "#groupings").multiselect({
		header: "Select groups that will participate",
		minWidth: 300
	}).multiselectfilter();
	$( "#user_grouping_ids").multiselect({
		header: "Assign user to groups",
		minWidth: 300
	}).multiselectfilter();
	$( "#user_role_ids").multiselect({header: "Assign roles to user"});
	
	$( "#staffing_table" ).dataTable({ // datatable in the manager module's staffing tab
		"aoColumns": [
		              { "sWidth": "25%" },
		              { "sWidth": "50%" },
		              { "sWidth": "10%" },
		              { "sWidth": "10%" }
		          ],
		"bAutoWidth": false,
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
	}); 
	
	$( "#user_table" ).dataTable({ // datatable in the admin module
		"bJQueryUI": true,
		"sPaginationType": "full_numbers"
	});
	
	$( "#member_table" ).dataTable({ // datatable listing the other user participating in a topic
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
	}); 
	
	$( "#topic_groups_table" ).dataTable({ // datatable listing the topic_groups belonging to a topic
		"bAutoWidth": true,
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
	}); 
	
	$( "#new_elements_table" ).dataTable({ // datatable listing newly suggested elements needing manager approval
		"aoColumns": [
		              { "sWidth": "5%" },
		              { "sWidth": "90%" }
		          ],
		"bAutoWidth": false,
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
	}); 
	
	
	$("#layout_table").colResizable({
		postbackSafe:true,
		minWidth: 200
	});
	
	
	// JDavis: this function responds to the dropdown selection on the manager page and navigates to the select topic.
	$('#topic_select').change(function() {
		//alert($(this).attr('value'));
		if ($(this).attr('value') > 0)
			window.location.pathname = '/topics/'+$(this).attr('value')+'/edit';
		else
			window.location.pathname = '/topics/new';
			
	});
	
	// JDavis: this function responds to the dropdown selection on the grouping page and navigates to the select grouping.
	$('#grouping_select').change(function() {
		if ($(this).attr('value') > 0)
			window.location.pathname = '/groupings/'+$(this).attr('value')+'/edit';
		else
			window.location.pathname = '/groupings/new';
			
	});
	   
	// JDavis: this function responds to the dropdown selection on the iteration page and navigates to the selected iteration.
	$('#iteration_select').change(function() {
		var temp = new Array();
		temp = window.location.pathname.split('/');
		window.location.pathname = '/'+temp[1]+'/'+temp[2]+'/'+temp[3]+'/'+$(this).attr('value')+'#tabs-2';
		//alert(window.location.pathname);
	});
	
	
	// JDavis: for some reason, the rating stuff must come last or else shit breaks.
	$( "#rating_table input.jdstar" ).rating(); // JDavis: this line must come before rating_table dataTable()
	
	/* Add a click handler to the rows - this could be used as a callback */
	
    $("#rating_table tbody").click(function(event) {
        $(rTable.fnSettings().aoData).each(function (){
            $(this.nTr).removeClass('row_selected');
        });
        $(event.target.parentNode).addClass('row_selected');
    }); 
     
    /* Add a click handler for the delete row */
	
    $('#item_delete').click( function() {
        var anSelected = fnGetSelected( rTable );
        rTable.fnDeleteRow( anSelected[0] );
    } ); 
	
	
	rTable = $( "#rating_table" ).dataTable({ // datatable where users rate the elements
		"aoColumns": [
		              { "sWidth": "60%" },
		              { "sWidth": "20%" },
		              //{ "bVisible": false },
		              { "bVisible": false }
		          ],
		"bAutoWidth": false,
		"bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "sDom": '<"H"Tfr>t<"F"ip>',
        "oTableTools": {
			"aButtons": ["copy", "csv", "xls", "pdf"]
		}


    }); 
});

/* Get the rows which are currently selected */
function fnGetSelected( oTableLocal )
{
    var aReturn = new Array();
    var aTrs = oTableLocal.fnGetNodes();
     
    for ( var i=0 ; i<aTrs.length ; i++ )
    {
        if ( $(aTrs[i]).hasClass('row_selected') )
        {
            aReturn.push( aTrs[i] );
        }
    }
    return aReturn;
}

function fnEvents(date) {
	d = date.getDate();
	m = date.getMonth()+1;
	y = date.getFullYear();
	$.ajax({
		url: "/me/event_list/"+y+"-"+m+"-"+d,
		context: document.body,
		dataType: "html",
		success: function(data){
			$('#events_div').html(data);
			$("#events_panel").attr("title", "Events: "+y+"-"+m+"-"+d);
			$("#events_panel").collapsiblePanel();
		}
	});
}






