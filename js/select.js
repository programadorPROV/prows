function showDiv(elem){
   if(elem.value == 1){
      document.getElementById('mas_activos').style.display = "block";
      document.getElementById('suben').style.display = "none";
      document.getElementById('bajan').style.display = "none";
      }
  if(elem.value == 2){
	  document.getElementById('mas_activos').style.display = "none";
	  document.getElementById('suben').style.display = "block";
	  document.getElementById('bajan').style.display = "none";
	}
  if(elem.value == 3){
	  document.getElementById('mas_activos').style.display = "none";
	  document.getElementById('suben').style.display = "none";
	  document.getElementById('bajan').style.display = "block";
	}
}