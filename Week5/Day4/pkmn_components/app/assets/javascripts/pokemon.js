// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

PokemonApp.Pokemon = function(pokemonUri){
	this.id = PokemonApp.Pokemon.idFromUri(pokemonUri);
};

PokemonApp.Pokemon.prototype.render = function(){
	console.log("Rendering pokemon: #"+ this.id);

	var self = this;

	$.ajax({
		url:"/api/pokemon/" + this.id,
		success: function(response){
			self.info = response;

			// console.log("Pokemon info:");
			 console.log(self.info);
			// console.log("Pokemon number: " + self.info.pkdx_id);
			// console.log("Pokemon weight: " + self.info.weight);
			$(".js-pkmn-name").text(self.info.name);
			$(".js-pkmn-number").text(self.info.pkdx_id);
			$(".js-pkmn-height").text(self.info.height);
			$(".js-pkmn-weight").text(self.info.weight);
			$(".js-pkmn-hp").text(self.info.hp);
			$(".js-pkmn-ad").text(self.info.defense);
			$(".js-pkmn-speed").text(self.info.speed);
			
			//img calculation
			var sprite_number = (parseInt(self.id) + 1).toString();
			console.log(sprite_number);

			$.ajax({
				url: "/api/v1/sprite/" + sprite_number + "/",
				success: function(response){
					// console.log(response);
					var img_uri = response.image;
					var con_url = "http://pokeapi.co" + response.image;
					var img = `<img src = ${con_url} alt = "pretty">`
					var html = img
					$(".js-pkmn-img").html(html);
				}
			});

			//description calculation
			var desc_last = self.info.descriptions.pop();
			var desc_uri = desc_last.resource_uri;
			var desc_src = "http://pokeapi.co" + desc_uri;
			
			$.ajax({
				url: desc_src,
				success: function(response){
					var dscrpt = response.description;
					//console.log(dscrpt);
					$(".js-pkmn-desc").text(dscrpt);
				}
			})
			//// console.log(desc_src);

			//type calculation
			$(".js-pkmn-types").empty()
			self.info.types.forEach(function(obj){
				var html = `
					<dd>
						${obj.name}
					</dd>`;
					$(".js-pkmn-types").append(html);
			});
			$(".js-pokemon-modal").modal("show");
		}
	});
};

PokemonApp.Pokemon.idFromUri = function(pokemonUri){
	var uriSegments = pokemonUri.split("/");
	var secondLast = uriSegments.length - 2;
	return uriSegments[secondLast];
};




$(document).on("ready", function(){
	$(".js-show-pokemon").on("click", function (event){
		var $button = $(event.currentTarget);
		var pokemonUri = $button.data("pokemon-uri");

		var pokemon = new PokemonApp.Pokemon(pokemonUri);
		pokemon.render();
	});
});






















