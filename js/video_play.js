var player;

var $ = function(id) { return document.getElementById(id); }
var $$ = function(tagname) { return document.getElementsByTagName(tagname); }

 function onYouTubeIframeAPIReady() {
     var videos = $$('iframe'), // the iframes elements
         players = [], // an array where we stock each videos youtube instances class
         playingID = null; // stock the current playing video
     for (var i = 0; i < videos.length; i++) // for each iframes
     {
         var currentIframeID = videos[i].id; // we get the iframe ID
         players[currentIframeID] = new YT.Player(currentIframeID); // we stock in the array the instance
         // note, the key of each array element will be the iframe ID
         
         videos[i].onmouseover = function(e) { // assigning a callback for this event
             var currentHoveredElement = e.target;
             if (playingID) // if a video is currently played
             {
                 players[playingID].pauseVideo();
             }
             players[currentHoveredElement.id].playVideo();
             playingID = currentHoveredElement.id;
         };
     }
    
 }
 onYouTubeIframeAPIReady();
 
 
 <!DOCTYPE html>
<html>
    
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="http://www.youtube.com/player_api"></script>
    </head>
    
    <body>
        <div>TODO write content</div>
        <ul class="image-grid" id="list">
            <li>
                <iframe id="player" width="385" height="230" src="http://www.youtube.com/embed/erDxb4IkgjM?rel=0&wmode=Opaque&enablejsapi=1;showinfo=0;controls=0" frameborder="0" allowfullscreen></iframe>
            </li>
            <li>
                <iframe id="player2" width="385" height="230" src="http://www.youtube.com/embed/erDxb4IkgjM?rel=0&wmode=Opaque&enablejsapi=1;showinfo=0;controls=0" frameborder="0" allowfullscreen></iframe>
            </li>
        </ul>
    </body>

</html>