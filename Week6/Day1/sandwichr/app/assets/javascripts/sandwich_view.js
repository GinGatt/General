$(document).on("ready", function(){
	$(".js-ingredient-button").on("click", makeAjaxPost);
})

function makeAjaxPost(event){
	var sandwichId = $(".js-sandwich-id").data("id");
	var ingredientId = $(".js-ingredient-button").data("id");
	var params = {
		ingredient_id: ingredientId
	};

	$.ajax({
		type: "POST",
		url: "/api/sandwiches/" + sandwichId + "/ingredients/add",
		data: params, 
		success: onAddSuccess,
		error: onAddError,
	})
} 

function onAddSuccess(response){
	$(".js-ingredient-list").empty();
	$(".js-sandwich-calories").text(response.total_calories);
	response.ingredients.forEach(function(ingredient){
		var html_frag = `
		<li>
			${ingredient.name}
			${ingredient.calories}
		</li>`
		$(".js-ingredient-list").append(html_frag);
	})
}

function onAddError(err){
	console.log(err);
}





