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