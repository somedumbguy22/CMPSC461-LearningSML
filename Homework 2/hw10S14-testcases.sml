Control.Print.printLength := 1000;
Control.Print.printDepth := 1000;

(* some auxiliary functions used for test cases *)
fun upto 0 = nil
   |upto n = n::upto(n-1);

fun treeinsert(x, empty, _) = tr(empty,x,empty)
   |treeinsert(x, tr(t1,y,t2), p) =
      if p(x,y) then tr(treeinsert(x,t1,p), y, t2)
                else tr(t1, y, treeinsert(x,t2,p));

fun maptreeinsert(nil, t, p) = t
   |maptreeinsert(x::xs, t, p) = 
      let val t0 = treeinsert(x,t,p)
      in maptreeinsert(xs, t0, p)
      end;


(* test cases *)

val weave1 = weave ([1,3,5,7,9],[2,4,6,8,10]);
val weave2 = weave (["a", "b"], ["v", "w", "x", "y", "z"]);
val weave3 = weave ([true, true, true, true], [false]);

val cut1 = cut [1,2,3,4,5,6,7,8,9,10];
val cut2 = cut ["a", "b", "c", "d", "e", "f", "g", "h", "i"];

val nshuffle1 = nshuffle(upto 52, 1);
val nshuffle2 = nshuffle(upto 52, 2);
val nshuffle3 = nshuffle(upto 52, 3);

val power1 = power(2,10, fn n=>real n);


val height1 = height(maptreeinsert(nshuffle(upto 52, 3), empty, op <=), fn v=>v);
val inorder1 = inorder(maptreeinsert(nshuffle(upto 52, 3), empty, op <=), fn v=>v);

val testtree2 = maptreeinsert([10,5,15,4,7,12,14], empty, op <=);
val testtree3 = maptreeinsert([11,6,17,4,8,13,12], empty, op <=);


val treemap1 = treemap(fn n=> Math.sqrt(real n), testtree2);
val treemap2 = treemap(fn n => n*n, testtree3);

val sameshape1 = sameshape(testtree2,treemap(fn n=>n+1, testtree2));
val sameshape2 = sameshape(testtree2,testtree3);

(*
fun rev(nil,ys) = ys
    |rev(x::xs,ys) = rev(xs,x::ys);

fun append(nil,ys) = ys
   	|append(x::xs,ys) = x::append(xs,ys);

fun helper(nil, n) = n
	|helper(x::xs,n) = helper(xs, n+1);

fun function(nil,ys,n,k) = ys
	|function(x::xs,ys,n,k) = if (n = k) then ys else function(xs, append(x::nil,ys),n-1,k);

fun cofunction(nil,ys,n,k) = ys
	|cofunction(x::xs,ys,n,k) = if (k < (n div 2)) then cofunction(xs,ys,n,(k+1))
								else cofunction(xs, append(x::nil,ys), n, (k+1)); 

fun cut(nil) = (nil, nil)
	|cut(xs) = let val n = helper(xs, 0)
	in
		(rev(function(xs,nil,(n div 2),0),nil), rev(cofunction(xs,nil,n,0),nil))
	end; 
*)