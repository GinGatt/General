// Validate Credit Card Number - CodeWars #4 (JavaScript)
// Implement the Luhn Algorithm for positive int >= 16 digits
function validate(n){
	// even->double every other starting with first; odd -> double every other starting with second
	// if resulting number is > 9, replace it with the sum of it's own digits
	//sum the final digits
	//divide by 10, if remainder = 0, valid
	var arr = String(n).split("");
	var count = arr.length;
	while( count > 0){
		arr[count-2] = (2 * arr[count-2]);
		if (arr[count-2] > 9){arr[count-2] = arr[count-2]-9};
		count -= 2;
	}
	var sum = arr.reduce((prev, curr) => parseInt(prev) + parseInt(curr));
	return sum%10 == 0 ? true : false;
}
// test_cases
console.log(validate(1239));
 console.log(validate(12397));
// Exes and Ohs - CodeWars #3 (JavaScript)
// Does string contain same number of x's and o's?
function XO(str) {
	var x = str.match(/x/gi)||[];
	var o = str.match(/o/gi)||[];
	return x.length == o.length;
}

// test_cases
XO('Xoxommm');
XO('Xxoxo');
XO('oo');
XO("ooom");
// pretty proud of my ||[] assignment size you can't find the length of undefined/null


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
songDecoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB");
songDecoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB");

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