$( "#slider-vertical" ).slider({
			orientation: "vertical",
			range: "min",
			min: 0,
			max: 100,
			value: 60,
			slide: function( event, ui ) {
				$( "#amount" ).val( ui.value );
			}
		});
		$( "#amount" ).val( $( "#slider-vertical" ).slider( "value" ) );

var MarginsOffset = 18;
var MainContentHeight = Number($(".mainContent").css("height").replace("px",""));
var TitleHeight = Number($(".titol").css("height").replace("px",""));
var ListHeight = Number($(".llista").css("height").replace("px",""));
var ShowScroll =  ((TitleHeight + ListHeight + MarginsOffset) > MainContentHeight)?true:false;
