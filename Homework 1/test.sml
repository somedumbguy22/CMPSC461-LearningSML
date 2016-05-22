(*Problem 3: Prime Factors*)


fun primeHelper(m, n) = if ((n mod m) = 0) then false
   							 else if ((m*m) >= n) then true
   							 else (helperthree(m+1,n));

fun isPrime n = if (n = 2) then true else(primeHelper(2,n));

fun append(nil,ys) = ys
   	|append(x::xs,ys) = x::append(xs,ys);

fun nextPrimeFactor(k) = if ((isPrime(k)) = true) then k else nextPrimeFactor(k+1);


fun factorHelper(1,k) = nil
	|factorHelper(n,k) = if ((n mod k) = 0) then append([k], factorHelper((n div k), k))
						else factorHelper(n,(nextPrimeFactor(k+1)));

fun factors 1 = nil
	|factors 2 = [2]
    |factors n = if((isPrime(n) = true)) then n::factors(1)
    				else factorHelper(n,2); 
