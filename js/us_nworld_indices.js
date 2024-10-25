$(document).ready(function(){
	loadSnP_valores();
	loadNasdaq_valores();
	loadNYSE_valores();
	loadEurope_valores();
	loadSouth_America();
});

function loadSnP_valores(){
	var tick = '^OEX,^MID,^GSPC,^SP600,^SPSUPX,^VIX';

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
                loadSnP_valores();
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
			var price = stockindex[i].LastTradePriceOnly;
			var Change = stockindex[i].ChangeinPercent;
			var numberchange = stockindex[i].Change;

			// console.log( symbol + ':' + price );

			htmlStr += '<div class="world_indices_tools"><div class="name_tools cut block40 align_left" title="'+name+'">'+name+'</div><div class="precio_tools block20">'+price+'</div><div class="cambio_n_tools block20" alt="'+numberchange+'">'+numberchange+'</div><div class="cambio_p_tools block20" alt="'+Change+'">'+Change+'</div></div>';
		}

		$('#SnP_valores').html( htmlStr );
	})
	.fail( function( error ){
		// console.log( 'error[' + error + ']' );
	} );
}

function loadNasdaq_valores(){
	var tick = '^NDX,^IXIC,^BANK,^NBI,^IXCO,^IXF';

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
                loadNasdaq_valores();
                return;
            }            
            return;
        }
		// console.log( data );
		// console.log( '\n\n')
		// console.log( data.query );
		// console.log( '\n\n')
	    // console.log( data.query.results );
	    // console.log(  '\n\n')
			// console.log( data.query.results.quote );

	    var stockindex = data.query.results.quote;

	    var htmlStr = '';

	    for(var i in stockindex){
			var symbol = stockindex[i].Symbol;
			var name = stockindex[i].Name;
			var price = stockindex[i].LastTradePriceOnly;
			var Change = stockindex[i].ChangeinPercent;
			var numberchange = stockindex[i].Change;


			// console.log(  symbol + ':' + price );

			htmlStr += '<div class="world_indices_tools"><div class="name_tools cut block40 align_left" title="'+name+'">'+name+'</div><div class="precio_tools block20">'+price+'</div><div class="cambio_n_tools block20" alt="'+numberchange+'">'+numberchange+'</div><div class="cambio_p_tools block20" alt="'+Change+'">'+Change+'</div></div>';
		}

		$('#Nasdaq_valores').html( htmlStr );
	})
	.fail( function( error ){
		// console.log( 'error[' + error + ']' );
	} );
}

function loadNYSE_valores(){
	var tick = '^NYA,^NYE,^NYK,^NYP,^NYY,^NYI';

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
                loadNYSE_valores();
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

		$('#NYSE_valores').html( htmlStr );
	} )
	.fail( function( error ){
		// console.log( 'error[' + error + ']' );
	} );
}

function loadEurope_valores(){
	var tick = '^FTSE,^GDAXI,^FCHI';

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
                loadEurope_valores();
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

		$('#Europe_valores').html( htmlStr );
	} )
	.fail( function( error ){
		// console.log( 'error[' + error + ']' );
	} );
}

function loadSouth_America(){
	var tick = '^BVSP,^MXX,^IPSA,^MERV';

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
                loadSouth_America();
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
			var country = stockindex[i].StockExchange;

			// console.log( symbol + ':' + price );

			htmlStr += '<div class="world_indices_tools"><div class="name_tools cut block40 align_left" title="'+name+' ('+country+')">'+name+' ('+country+')</div><div class="precio_tools block20">'+price+'</div><div class="cambio_n_tools block20" alt="'+numberchange+'">'+numberchange+'</div><div class="cambio_p_tools block20" alt="'+Change+'">'+Change+'</div></div>';
		}

		$('#South_America_valores').html( htmlStr );
	} )
	.fail( function( error ){
		// console.log( 'error[' + error + ']' );
	} );
}