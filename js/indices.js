$(document).ready(function(){
	loadActives();
	loadSuben();
	loadBajan();
});

function loadActives(){
	var tick = 'FB,NOK,F,BAC,GOOG';

	var url = 'http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22'+tick+'%22)%0A%09%09&format=json&diagnostics=true&env=http%3A%2F%2Fdatatables.org%2Falltables.env&callback=?';
	// console.log( 'activities - url['+url+']' );

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
                loadActives();
                return;
            }            
            return;
        }
		// console.log( 'activities - ' + data );
		// console.log( 'activities - ' + '\n\n')
		// console.log( 'activities - ' + data.query );
		// console.log( 'activities - ' +'\n\n')
	    // console.log( 'activities - ' + data.query.results );
	    // console.log( 'activities - ' +'\n\n')
			// console.log( 'activities - ' + data.query.results.quote );

	    var stockindex = data.query.results.quote;

	    var htmlStr = '';

	    for(var i in stockindex){
			var symbol = stockindex[i].Symbol;
			var name = stockindex[i].Name;
			var price = stockindex[i].LastTradePriceOnly;
			var Change = stockindex[i].ChangeinPercent;

			// console.log( 'activities - ' + symbol + ':' + price );

			htmlStr += '<div><div class="name cut" title="'+name+'">'+name+'</div><div class="precio">'+price+'</div> <div class="cambio" alt="'+Change+'">'+Change+'</div></div>';
		}

		$('#mas_activos').html( htmlStr );
	})

	/*$.getJSON(url, function(data) {
		console.log( data );
		console.log('\n\n')
		console.log( data.query );
		console.log('\n\n')
	    console.log( data.query.results );
	    console.log('\n\n')
			console.log( data.query.results.quote );

	    var stockindex = data.query.results.quote;

	    var htmlStr = '';

	    for(var i in stockindex){
			var symbol = stockindex[i].Symbol;
			var name = stockindex[i].Name;
			var price = stockindex[i].LastTradePriceOnly;
			var Change = stockindex[i].ChangeinPercent;

			console.log( symbol + ':' + price );

			htmlStr += '<div><div class="name cut" title="'+name+'">'+name+'</div><div class="precio">'+price+'</div> <div class="cambio" alt="'+Change+'">'+Change+'</div></div>';
		}

		$('#mas_activos').html( htmlStr );
	});*/
	.fail( function( error ){
		// console.log( 'error[' + error + ']' );
	} );
}

function loadSuben(){
	var tick = 'CYTR,NLP,ZN,GNVC,SBCF';

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
                loadSuben();
                return;
            }            
            return;
        }
		// console.log( 'loadSuben - ' + data );
		// console.log( 'loadSuben - ' + '\n\n')
		// console.log( 'loadSuben - ' + data.query );
		// console.log( 'loadSuben - ' + '\n\n')
	    // console.log( 'loadSuben - ' + data.query.results );
	    // console.log(  'loadSuben - ' + '\n\n')
			// console.log( 'loadSuben - ' + data.query.results.quote );

	    var stockindex = data.query.results.quote;

	    var htmlStr = '';

	    for(var i in stockindex){
			var symbol = stockindex[i].Symbol;
			var name = stockindex[i].Name;
			var price = stockindex[i].LastTradePriceOnly;
			var Change = stockindex[i].ChangeinPercent;

			// console.log(  'loadSuben - ' + symbol + ':' + price );

			htmlStr += '<div><div class="name cut" title="'+name+'">'+ name+'</div><div class="precio">'+price+'</div> <div class="cambio" alt="'+Change+'">'+Change+'</div></div>';
		}

		$('#suben').html( htmlStr );
	})
	/*$.getJSON(url, function(data) {
		console.log( data );
		console.log('\n\n')
		console.log( data.query );
		console.log('\n\n')
	    console.log( data.query.results );
	    console.log('\n\n')
			console.log( data.query.results.quote );

	    var stockindex = data.query.results.quote;

	    var htmlStr = '';

	    for(var i in stockindex){
			var symbol = stockindex[i].Symbol;
			var name = stockindex[i].Name;
			var price = stockindex[i].LastTradePriceOnly;
			var Change = stockindex[i].ChangeinPercent;

			console.log( symbol + ':' + price );

			htmlStr += '<div><div class="name cut" title="'+name+'">'+ name+'</div><div class="precio">'+price+'</div> <div class="cambio" alt="'+Change+'">'+Change+'</div></div>';
		}

		$('#suben').html( htmlStr );
	});*/
	.fail( function( error ){
		// console.log( 'error[' + error + ']' );
	} );
}

function loadBajan(){
	var tick = 'IMUC,SPPRO,VRTA,ATOS,AVEO';

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
                loadBajan();
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

			// console.log( symbol + ':' + price );

			htmlStr += '<div><div class="name cut" title="'+name+'">'+ name+'</div><div class="precio">'+price+'</div> <div class="cambio" alt="'+Change+'">'+Change+'</div></div>';
		}

		$('#bajan').html( htmlStr );
	} )
/*
	$.getJSON(url, function(data) {
		console.log( data );
		console.log('\n\n')
		console.log( data.query );
		console.log('\n\n')
	    console.log( data.query.results );
	    console.log('\n\n')
			console.log( data.query.results.quote );

	    var stockindex = data.query.results.quote;

	    var htmlStr = '';

	    for(var i in stockindex){
			var symbol = stockindex[i].Symbol;
			var name = stockindex[i].Name;
			var price = stockindex[i].LastTradePriceOnly;
			var Change = stockindex[i].ChangeinPercent;

			console.log( symbol + ':' + price );

			htmlStr += '<div><div class="name cut" title="'+name+'">'+ name+'</div><div class="precio">'+price+'</div> <div class="cambio" alt="'+Change+'">'+Change+'</div></div>';
		}

		$('#bajan').html( htmlStr );
	});*/
	.fail( function( error ){
		// console.log( 'error[' + error + ']' );
	} );
}