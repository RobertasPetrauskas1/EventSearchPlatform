var title = document.getElementById("title");

var eventRequest = new XMLHttpRequest();
eventRequest.open('GET', 'localhost:8081/event');
eventRequest.onload = loadInfo(JSON.parse(eventRequest.responseText));

/*eventRequest.onerror = function() {
    console.log("Connection error");
}*/
eventRequest.send();

function loadInfo(data){
    title.insertAdjacentElement('beforeend', data[0].name);
}