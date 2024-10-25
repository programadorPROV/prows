$(document).ready(function(){
	load_divisas();
	load_materias_primas();
});

function load_divisas(){
	var tick = 'EURUSD=X,USDEUR=X,EURNIO=X,USDNIO=X,USDJPY=X,EURJPY=X';

	var url = 'http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22'+tick+'%22)%0A%09%09&format=json&diagnostics=true&env=http%3A%2F%2Fdatatables.org%2Falltables.env&callback=?';
	// console.log( 'url['+url+']' );

	$.ajax( {
		url: url,
		async: false,
		tryCount: 0,
		retryLimit : 3,
		contentType: 'application/json',
		dataType: 'json',

	} ).done(function( data ){
		if ( $( data.query.results ).length==0) {
            this.tryCount++;
            if (this.tryCount <= this.retryLimit) {
                //try again
                // console.log( 'retrying...' + this.tryCount );
                load_divisas();
                return;
            }            
            return;
        }
		// console.log( data );
		// console.log( '\n\n')
		// console.log( data.query );
		// console.log( '\n\n')
	    // console.log( data.query.results );
	    // console.log( '\n\n')
			// console.log( data.query.results.quote );

	    var stockindex = data.query.results.quote;

	    var htmlStr = '';

	    for(var i in stockindex){
			var symbol = stockindex[i].Symbol;
			var name = stockindex[i].Name;
			var ask = stockindex[i].Ask;
			var bid = stockindex[i].Bid;

			// console.log( symbol + ':' + ask );

			htmlStr += '<div class="divisas"><div class="name_tools cut block40 align_left" title="'+name+'">'+name+'</div><div class="ask block30 bluecolor">'+ask+'</div><div class="bid block30 bluecolor">'+bid+'</div></div>';
		}

		$('#divisas_valores').html( htmlStr );
	})
	.fail( function( error ){
		// console( 'error[' + error + ']' );
	} );
}

function load_materias_primas(){
	var tick = 'CLG14.NYM,RBG14.NYM,NGG14.NYM,GCF14.CMX,SIF14.CMX,HGF14.CMX,KCH14.NYB,SBH14.NYB';

	var url = 'http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22'+tick+'%22)%0A%09%09&format=json&diagnostics=true&env=http%3A%2F%2Fdatatables.org%2Falltables.env&callback=?';
	// console.log( 'url['+url+']' );
	$.ajax( {
		url: url,
		async: false,
		tryCount: 0,
		retryLimit : 3,
		contentType: 'application/json',
		dataType: 'json',

	} ).done( function(data){
		if ( $( data.query.results ).length==0) {
            this.tryCount++;
            if (this.tryCount <= this.retryLimit) {
                //try again
                // console.log( 'retrying...' + this.tryCount );
                load_materias_primas();
                return;
            }            
            return;
        }
		// console.log( data );
		// console.log('\n\n')
		// console.log( data.query );
		// console.log('\n\n')
	    // console.log( data.query.results );
	    // console.log('\n\n')
			// console.log( data.query.results.quote );

	    var stockindex = data.query.results.quote;

	    var htmlStr = '';

	    for(var i in stockindex){
			var symbol = stockindex[i].Symbol;
			var name = stockindex[i].Name;
			var price = stockindex[i].LastTradePriceOnly;
			var Change = stockindex[i].ChangeinPercent;
			var numberchange = stockindex[i].Change;

			// console.log( symbol + ':' + price );

			htmlStr += '<div class="world_indices_tools"><div class="name_tools cut block40 align_left" title="'+name+'">'+name+'</div><div class="precio_tools block20">'+price+'</div><div class="cambio_n_tools block20" alt="'+numberchange+'">'+numberchange+'</div><div class="cambio_p_tools block20" alt="'+Change+'">'+Change+'</div></div>';
		}

		$('#materias_primas_valores').html( htmlStr );
	} )
	.fail( function( error ){
		// console( 'error[' + error + ']' );
	} );
}