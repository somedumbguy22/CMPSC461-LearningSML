(*
***Aakash Sham
***CMPSC 461
***Homework 10
***05/01/2014
*)

(*Problem 1*)

fun weave(nil, nil) = nil
	|weave(nil, y::ys) = y::ys
	|weave(x::xs, nil) = x::xs
	|weave(x::xs, y::ys) = x::(weave(y::ys, xs));


(*Problem 2*)

local
	fun rev(nil,ys) = ys
    	|rev(x::xs,ys) = rev(xs,x::ys)
    fun append(nil,ys) = ys
   		|append(x::xs,ys) = x::append(xs,ys)
   	fun helper(nil, n) = n
		|helper(x::xs,n) = helper(xs, n+1)
	fun function(nil,ys,n,k) = ys
		|function(x::xs,ys,n,k) = if (n = k) then ys else function(xs, append(x::nil,ys),n-1,k)
	fun cofunction(nil,ys,n,k) = ys
		|cofunction(x::xs,ys,n,k) = if (k < (n div 2)) then cofunction(xs,ys,n,(k+1))
										else cofunction(xs, append(x::nil,ys), n, (k+1))
in
fun cut(nil) = (nil, nil)
	|cut(xs) = let val n = helper(xs, 0)
	in
		(rev(function(xs,nil,(n div 2),0),nil), rev(cofunction(xs,nil,n,0),nil))
	end
end;

(*Problem 3*)

fun nshuffle(nil, n) = nil
	|nshuffle(xs, 0) = xs
	|nshuffle(xs, n) = nshuffle(weave(cut(xs)),(n-1)); 

(*Problem 4*)

fun power(x,0,N) = N (1)
	|power(x,k,N) = power(x, k-1, fn v => N(v*x));


(*Problem 5*)

fun height(empty, K) = K 0
	|height(tr(t1,_,t2), K) = Int.max(height(t1, fn v => K(v+1)), height(t2,fn v => K(v+1)));


(*Problem 4*)

local
	fun treehelp(f, empty) = nil
		|treehelp(f,tr(t1,x,t2)) = (f x)::treehelp(f,t1) @ treehelp(f, t2)
in
fun treemap(f,empty) = maptreeinsert(treehelp(f,empty), empty, op <=)
   |treemap(f,tr(t1,x,t2)) = maptreeinsert(treehelp(f, tr(t1,x,t2)), empty, op <=)
end;


(*Problem 5*)

fun sameshape(empty,empty) = true
	|sameshape(empty, tr(t3,_,t4)) = false
	|sameshape(tr(t1,_,t2), empty) = false
	|sameshape(tr(t1,_,t2), tr(t3,_,t4)) = if(sameshape(t1, t3) andalso sameshape(t2, t4)) 
											then true 
											else false;








