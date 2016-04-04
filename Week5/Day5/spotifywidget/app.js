$(document).on("ready", function(){
	$(".js-search-submit").on("click", function (event) {
		event.preventDefault();
		searchSong();
		//clear value of search
		$(".js-song-search").val("");
	})
		$(".btn-play").on( "click", function() {
			if ($(".btn-play").hasClass("playing")){
				$(".btn-play").removeClass("playing");
				$("#js-player").trigger("pause");
			}

			else {
				$(".btn-play").addClass("playing");
				$("#js-player").trigger("play");
			}
	})
	$("#js-player").on("timeupdate", printTime);	
	$(".author").on("click", function (event) {
		event.preventDefault();
		getArtistInfo();
	})
	
});

 function searchSong(){
 	var song = $(".js-song-search").val();
 	var splitSong = song.split(" ");
 	var modifiedSong = splitSong.join("+");
 	console.log(modifiedSong);

	$.ajax({
		url:"https://api.spotify.com/v1/search?type=track&query=" + modifiedSong,
		success: function(response){
			console.log(response);
			
			var songTitle = response.tracks.items[0].name;
			//song title //console.log(songTitle);
			$(".title").text(songTitle);
			
			var artistName = response.tracks.items[0].artists[0].name;
			//artist name //console.log(artistName);
			$(".author").text(artistName);
			
			var coverUrl = response.tracks.items[0].album.images[0].url
			//cover album //console.log(coverUrl);
			var cover = document.getElementById('js-cover');
			cover.setAttribute("src", coverUrl);

			//song url
			var songUrl = response.tracks.items[0].preview_url;
			console.log(songUrl);
			var song = document.getElementById("js-player");
			song.setAttribute("src", songUrl);

			var artistId = response.tracks.items[0].artists[0].id;
			var artistsIdHtml = document.getElementsByClassName("author");
			$(artistsIdHtml).data("id", artistId);
			// console.log($(".author").data("id"));
		},
		error: function(){
			alert("You Suck.");
		}
	}); 	
 }
 
 function printTime(){
 	var current = $("#js-player").prop("currentTime");
 	// console.debug("Current time:" + current);
 	var seekBar = document.getElementById("jsSeekBar");
 	seekBar.setAttribute("value", current);
 }

function getArtistInfo(){
	var artistID = $(".author").data("id");
	
	$.ajax({
		url:"https://api.spotify.com/v1/artists/" + artistID,
		success: function(response){
			console.log(response);

			var name = response.name;
			console.log(name);
			$(".js-name").text(name);
			
			var photoUrl = response.images[0].url;
			console.log(photoUrl);
			$(".js-artist-img").html(`<img src=${photoUrl} alt="artistPic">`);
			
			var genresArray = response.genres;
			console.log(genresArray);
			if (genresArray.length !== 0){
				genresArray.forEach(function(genre){
					var html = `
						<dd>${genre}</dd>`;
					$(".js-genre").append(html);
				});
			}
			else{
				$(".js-genre").text("None Listed.");
			};
			
			var followers = response.followers.total;
			console.log(followers);
			$(".js-followers").text(followers);
			var popularity = response.popularity;
			console.log(popularity);
			$(".js-popularity").text(popularity);
			
			$(".js-artist-modal").modal("show");
		},
		error: function(){
			alert("It's on a need to know basis and you're not on the need to know..")
		}
	});
}