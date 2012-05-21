var mTabs;
var hrTabs;
var meTabs;
var giRedraw = false;


$(function() {
	
	//$( "#app_container" ).show(); //JDavis: this keeps from flashing unformatted content (fouc).
	$( ".best_in_place" ).best_in_place();
	//$( '.best_in_place' ).on('click', function(event){
	//	$( ".best_in_place" ).best_in_place();
	//});
	
	
	$(".panel").panel({
		collapsible:false
	}).show();
	
	var browser = $("#browserPanel").panel({
        collapseType:'slide-left',
        trueVerticalText:true, 
        fold: function() { $.cookie("browserState", "closed"); },
        unfold: function() { $.cookie("browserState", "open"); }
    }).show();
	
	$('.closeBrowser').live( 'click', function () {
		$.cookie("browserState", "closed");
	});
	
	$("button, input:submit, input:button").button();
	
	bAccordion = $( "#accordion" ).accordion({ fillSpace: true, navigation: true }).show(); // accordion on the _browser partial
	var browserState = $.cookie("browserState");
	
	if (browserState == 'closed') {
		browser.panel('toggle', 0, true);
	}
	
	var hCalendar = $('#calendar').fullCalendar({
		events: 'me/events',
		eventClick: function(event){ fnEvents(event.start); },
		dayClick: function(date) { fnEvents(date); }
	});
	
	$( "#topic_group_datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
	
	mTabs = $( "#manager_tabs" ).tabs({ cookie:{ expires:1 } }).show(); // tabs used in the manager module
	hrTabs = $( "#hr_tabs" ).tabs({ cookie:{ expires:1 } }).show(); // tabs used in the HR module
	$( "#me_tabs" ).tabs({ cookie:{ expires:1 } }).show();   // tabs used in the Me module
	
	// JDavis: I am not happy with the look of this an trying selectmenu instead.
	$( ".simple_select_old").multiselect({
		multiple: false,
		header: false,
		minWidth: 100,
		noneSelectedText: "Please select",
		selectedList: 1
	});
	
	$( ".simple_select_not_working" ).selectmenu({style:'dropdown'});
	
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
	
	$( "#assignments_table" ).dataTable({ // datatable in the manager module's staffing tab
		"aoColumns": [
		              { "sWidth": "25%" },
		              { "sWidth": "65%" },
		              { "sWidth": "5%", "bSortable": false },
		              { "sWidth": "5%", "bSortable": false }
		          ],
		"bAutoWidth": false,
		"bJQueryUI": true,
		"bProcessing": true,
		"bServerSide": true,
		//"fnInitComplete": function() { $( ".best_in_place" ).best_in_place(); },
		"fnDrawCallback": function() { $( ".best_in_place" ).best_in_place(); },
		"sAjaxSource": $('#assignments_table').data('source'),
        "sPaginationType": "full_numbers"
        	
	}).show(); 
	
	$( "#group_staffing_table" ).dataTable({ // datatable in the admin module
		"aoColumns": [
		              { "sWidth": "25%" },
		              { "sWidth": "70%" },
		              { "sWidth": "5%", "bSortable": false }
		          ],
		"bAutoWidth": false,
		"bJQueryUI": true,
		"sPaginationType": "full_numbers"
	}).show();
	
	$( "#user_table" ).dataTable({ // datatable in the admin module
		"aaSorting": [[2,'asc'], [1,'asc']],
		"aoColumns": [
		              { "sWidth": "5%", "bSortable": false },
		              { "sWidth": "20%" },
		              { "sWidth": "20%" },
		              { "sWidth": "50%" },
		              { "sWidth": "5%", "bSortable": false }
		          ],
		"bAutoWidth": false,
		"bJQueryUI": true,
		"bProcessing": true,
		"bServerSide": true,
		"sAjaxSource": $('#user_table').data('source'),
		"sPaginationType": "full_numbers"
	}).show();
	
	$( "#participant_table" ).dataTable({ // datatable listing the topic_group participants
		"aoColumns": [
		              { "sWidth": "5%", "bSortable": false },
		              { "sWidth": "25%" },
		              { "sWidth": "65%" },
		              { "sWidth": "5%", "bSortable": false }
		          ],
		"bAutoWidth": false,
		"bJQueryUI": true,
		"bProcessing": true,
		"bServerSide": true,
		"sAjaxSource": $('#participant_table').data('source'),
        "sPaginationType": "full_numbers"
	}).show(); 
	
	$( "#topic_groups_table" ).dataTable({ // datatable listing the topic_groups belonging to a topic
		"aoColumns": [
		              { "sWidth": "65%" },
		              { "sWidth": "10%", "bSortable": false },
		              { "sWidth": "10%" },
		              { "sWidth": "10%", "bSortable": false },
		              { "sWidth": "5%", "bSortable": false }
		          ],
		"bAutoWidth": false,
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
	}).show(); 
	
	$( "#new_elements_table" ).dataTable({ // datatable listing newly suggested elements needing manager approval
		"aoColumns": [
		              { "sWidth": "7px", "bSortable": false },
		              { "sWidth": "5px", "bSortable": false },
		              { "sWidth": "90%" }
		          ],
		"bAutoWidth": false,
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
	}).show(); 
	
	$( "#library_topic_group_table" ).dataTable({
		"bAutoWidth": false,
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
	}).show();
	
	
	// JDavis: image that opens / closes the element attributes div
	$('#rating_table img.details').live( 'click', function () {
		var nTr = this.parentNode.parentNode;
		if ($('div.innerDetails', nTr).is(':hidden')){
			$('div.innerDetails', nTr).slideDown();
			$('img.details', nTr).attr( 'src', "../../../images/details_close.png" );
		} else {
			$('div.innerDetails', nTr).slideUp();
			$('img.details', nTr).attr( 'src', "../../../images/details_open.png" );
		}
		
	} );
	
	// JDavis: image that opens / closes the element attributes div
	$('#new_elements_table img.details').live( 'click', function () {
		var nTr = this.parentNode.parentNode;
		
		if ($('div.innerDetails', nTr).is(':hidden')){
			$('div.innerDetails', nTr).slideDown();
			$('img.details', nTr).attr( 'src', "../../../images/details_close.png" );
		} else {
			$('div.innerDetails', nTr).slideUp();
			$('img.details', nTr).attr( 'src', "../../../images/details_open.png" );
		}
		
	} );
	
	$( ".popup" ).dialog({autoOpen: false, minWidth: 500});
	
	$( ".small_panel" ).dialog({
		autoOpen: true, 
		minWidth: 500, 
		closeOnEscape: false, 
		open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); }
	});
	
	$( '#more_link' ).click(function() { $('#more_dialog').dialog( "open" ) });
	
	$( "#login_form" ).dialog({ 
		autoOpen: true, 
		minWidth: 500, 
		closeOnEscape: false, 
		open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); }
	});
	
	// JDavis: this is a popup form for submitting new elements in the 'Participate' tab.
	var dElementForm = $('#element_dialog_form').dialog({
		autoOpen: false,
		minWidth: 700
	});
	
	var answer = $.cookie("confirmNewElement");
	
	$('.new_element_btn').click(function() {
		if (!answer) {
			answer = confirm("Submitting new items will cause you to lose any unsaved ratings.  Continue?");
			$.cookie("confirmNewElement", answer);
		}
		
		if (answer) {
			dElementForm.dialog( "open" );
		} 	
		
		return false;
	});

	//$('.element_link').click(function(event) {
		//$( '#element_dialog_form' ).dialog( "open" );
		//dElementForm.dialog( "open" );
	//	alert(event.target);
	//	return false;
	//});
	
	
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
    
	
	rTable = $( "#rating_table" ).dataTable({ // datatable where users rate the elements
		"aoColumns": [
		              { "sWidth": "5px", "bSortable": false },
		              null ,
		              { "sWidth": "115px" },
		              { "sWidth": "5px", "bSortable": false }
		          ],
		"bAutoWidth": false,
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
        //"sDom": '<"H"Tfr>t<"F"ip>',
        //"oTableTools": {
		//	"aButtons": ["copy", "csv", "xls", "pdf"]
		//}


    }).show(); 
	
	// JDavis: Only the elemens currently displayed were getting submitted.  This fixes the problem.
	$( '#rating_form' ).submit(function(){
		$(rTable.fnGetHiddenNodes()).appendTo($('#hidden_rating_table'));
	});
});

/* Get the rows which are currently selected *****JDavis: this is not being used at the moment.....*/
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
			$("#events_panel h3").text("Events: "+y+"-"+m+"-"+d);
			$("#events_panel").panel({ collapsible:false });
		}
	});
}

function remove_fields(link) {
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g")
	$(link).parent().before(content.replace(regexp, new_id));
}





