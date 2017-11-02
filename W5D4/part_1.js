function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

function madLib(verb, adj, noun)
{
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`  
}

function isSubstring(searchString, subString)
{
  return searchString.includes(subString);
}

function fizzBuzz(arr)
{
  const fizzArr = []
  for(var i = 0; i < arr.length; i++)
  {
    num = arr[i];
    if((num%3 == 0 || num%5 == 0) && !(num%3 == 0 && num%5 == 0))
    {
      fizzArr.push(num)
    }
  }
  return fizzArr;
}

function isPrime(num)
{
  if (num < 2)
    return false;
  for(var i = 2; i < num; i++)
  {
    if (num % i == 0) 
      return false;
  }
  return true;
}

function sumOfNPrimes(num)
{
  count = 0
  sum = 0
  current_num = 2
  while(count != num)
  {
    if (isPrime(current_num))
    {
      sum += current_num
      count++;
    } 
    current_num++;
  }
  return sum
}
// .load part_1.js