// DubStep - CodeWars #2 (JavaScript)
// what were the original lyrics before dubs ?before first word, ?between, ?after last word
function songDecoder(song){
	var wordArray;
	// fix the WUB at beg and end since those don't get spaces; Fix middle with spaces
	wordArray = song.replace(/^(WUB)+|(WUB)+$/g, "");
	wordArray = wordArray.replace(/(WUB)+/g, " ");
	return wordArray;
}

// test_cases
console.log(songDecoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB"));
console.log(songDecoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB"));

//GREAT there's a trim function that would have eliminated the need for first replace
// function songDecoder(song){
//   return song.replace(/(WUB)+/g," ").trim()
// }


// Binary Addition - CodeWars #1
// Implement a function that successfully adds two numbers together and returns their solution in binary. 

function add(num1, num2){
	var sumOrig = num1 + num2;
	var sumMod = sumOrig;
	var maxExp = 0;
	while(sumMod>=2){
		sumMod = sumMod/2;
		maxExp += 1;
	}

	var binString = ""
	while (maxExp >= 0){
		var calc = sumOrig - Math.pow(2,maxExp);
		if( calc >=0){
			sumOrig = calc;
			binString += "1"
		}else{
			binString += "0"
		}
		maxExp -=1;
	}
	return binString;
}

// test_cases
add(1,2);
add(1,2);
add(3,5);
add(0,0);
add(0,1);

//UGH Didn't know toString(base) existed! 
// function addBinary(a,b){
//   return (a+b).toString(2)
// }