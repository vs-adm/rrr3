// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function () {
	
	function recalculate() {
		console.debug ("Updating prices");
		tr = User.tariff;
		
		// Update data on change
		tr.t1 = $("#valt1").val();
		tr.t2 = $("#valt2").val();
		tr.t3 = $("#valt3").val();
		
		$("#res1").html(((tr.t1-$("#pvalt1").val())*$("#pricet1").html()).toFixed(2));
		$("#res2").html(((tr.t2-$("#pvalt2").val())*$("#pricet2").html()).toFixed(2));
		$("#res3").html(((tr.t3-$("#pvalt3").val())*$("#pricet3").html()).toFixed(2));
	}
	
	function fillFields() {
		console.debug ("Filling previous measurements");
		tr = User.tariff;
		
		$("#pvalt1").val(tr.t1);
		$("#pvalt2").val(tr.t2);
		$("#pvalt3").val(tr.t3);
		
		$("#valt1").val(tr.t1);
		$("#valt2").val(tr.t2);
		$("#valt3").val(tr.t3);
	}
	
	function CallError(code) {
	    $("#error").html("Произошла ошибка при обработке запроса. Повторите попытку").fadeIn("slow").delay(1000).fadeOut("slow");
	}
	
	// TODO: handle errors
	function request_tariff () {
		data = {
			region : $("#region").val(),
			equipment : $("#equipment").val(),
			tariff : $("#tariff").val()
		};												
		$.getJSON("/home/request_tariff", data, function(data){
			if (data.error) {
			    CallError(data.error);
			}
			
			$(".calcline").hide();
			
			$("#pricet1").html(data.t1);
			$("#pricet2").html(data.t2);
			$("#pricet3").html(data.t3);
			
			$(".tariff"+data.tariff).show();
			
			recalculate();
		}).error(function(){
			CallError("NetworkError");
		});
	}
	
	$(".updater").change(request_tariff);
	
	$(".changeable").keyup(function(){
		recalculate();
	});
	
	// When DOM is ready call for tariff
	User.restoreCallback = fillFields;
	User.restoreData();
	
	request_tariff();
	
	// Save data on leave
	$(window).unload(function() {
	  User.storeData();
	});
});
