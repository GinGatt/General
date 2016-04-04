if (window.PokemonApp == undefined){
	window.PokemonApp = {};
}

PokemonApp.init = function (){
	//3rd party code here
	console.log("Pokemon App ONLINE!");
};

$(document).on("ready", function(){
	PokemonApp.init();
});