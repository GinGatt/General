PokemonApp.PokemonEvolutions = function(id, info){
	this.id = id;
	this.info = info;
};

PokemonApp.PokemonEvolutions.prototype.render = function (){
	console.log("Rendering evolutions for: #" + this.id);
	
	$(".js-ev-title").text("Evolutions for ${this.info.name}");
	$(".js-ev-loading").show();
	$(".js-ev-list").empty();


	this.info.evolutions.forEAch(function(ev){
		$.ajax({
			url: ev.resource_uri,
			success: function(response){
				console.log("Got evolution.", ev.to);
				console.log("response");

				$(".js-ev-body").append(response.name);
				PokemonApp.PokemonEvolutions.getSprite(response.sprites[0].resource_uri);
			},
			error: function(){
				alert("Couldn't load evolution: ${ev.to}")
			}
		});
	});
	$(".js-ev-modal").modal("show");
};

// PokemonApp.PokemonEvolutions.getSprite = function(){

// }


// = function(pokemonUri){
// 	this.id = PokemonApp.Pokemon.idFromUri(pokemonUri);
// 	// this.info = info;
// };


$(document).on("ready", function(){
	$("js-evolutions").on("click", function(event){
		var $button = $(event.currentTarget);
		var pokemonId = $button.data("pkmn-id");
		var evolutions = new PokemonApp.PokemonEvolutions(ARG1, ARG2);
	});
});