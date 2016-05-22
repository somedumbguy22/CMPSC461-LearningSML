(* Aakash Sham
   CMPSC 461
   04/24/2014
   Homework 9*)

   (*Problem 1: stirling(n,k)*)

   fun stirling(n,1) = 1
   	  |stirling(n,k) = if (n=k) then 1 else (stirling(n-1,k-1) + (k*stirling(n-1,k)));

   (*Problem 2: A(n)*)

   fun helpertwo 0 = 1
   	  |helpertwo 1 = 2
   	  |helpertwo 2 = 3
   	  |helpertwo n = helpertwo(n-1) + helpertwo(n-2) + helpertwo(n-3);

   fun A 0 = [1]
   	  |A 1 = 2::A(0)
   	  |A 2 = 3::A(1)
   	  |A n = let val result = helpertwo(n)
   	  				in result::A(n-1)
   	  				end;

(*Problem 3: Prime Factors*)


fun primeHelper(m,n) = if ((n mod m) = 0) then false
                         else if ((m*m) >= n) then true
                         else (primeHelper(m+1,n));

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



   	(*Problem 4: CoPrime*)

   	local
   		fun cofunct(a,0) = a
   		   |cofunct(a,b) = cofunct(b,a mod b)
   	in
   		fun coprime(x,y) = if (1 = (cofunct(x,y))) then true else false
   	end;


   	(*Problem 5: CrossMap*)

   	fun crossmap(f,nil,y::ys) = nil
       |crossmap(f,x::xs,nil) = nil
       |crossmap(f,nil,nil) = nil
       |crossmap(f,x::xs,y::ys) = (f(x,y))::crossmap(f,xs,ys);