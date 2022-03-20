
datatype 'a tree = tnil 
                 |  node of ('a tree) * 'a * ('a tree);


fun insert tnil (x:int) = (node (tnil, x, tnil))
 |  insert (node (left, root, right)) x = if x < root then (node(insert left x, root, right)) else (node(left, root, insert right x));


exception EmptyTree; 

fun find_min tnil = raise EmptyTree
 |  find_min (node(tnil, x, right)) = x
 |  find_min (node(left, x, right)) = find_min left;

fun delete tnil (x:int) = tnil
 |  delete (node (tnil, r , tnil)) x = if (x = r) then tnil else (node (tnil, r, tnil))
 |  delete (node (tnil, r, right)) x = if (x = r) then (node(tnil, find_min right, delete right (find_min right))) else if (x < r) then (node (tnil, r, right)) else (node(tnil, r, delete right x))
 |  delete (node (left, r, right)) x = if (x = r) then (node (delete left (find_min left), find_min left, right)) else if (x < r) then (node(delete left x, r, right)) else (node (left, r, delete right x));

fun max x y = if x > y then x else y;

fun depth tnil = 0
 |  depth (node(tnil, r, tnil)) = 1
 |  depth (node(left, r, right)) = (max (depth left) (depth right)) + 1;


fun spaces 0 = ""
 |  spaces 1 = " "
 |  spaces n = " " ^ (spaces (n-1));

fun left_padding level depth = (print ("left_padding "^Int.toString(level)^" "^Int.toString(depth)^"\n");  
            (spaces (Real.toInt IEEEReal.TO_NEAREST (Math.pow (2.0, (Real.fromInt(depth - level - 1)))))));

fun padding_children level depth = (print ("padding_children "^Int.toString(level)^" "^Int.toString(depth)^"\n"); 
            (spaces ((Real.toInt IEEEReal.TO_NEAREST (Math.pow (2.0, (Real.fromInt(depth - level - 1)))))-1)));

fun i2s i = Int.toString(i);

fun nodes_on_level n d tnil = (print ("C1: n: "^Int.toString(n)^" r: tnil \n"); ".")
 |  nodes_on_level 0 d (node(left, r, right)) = (print ("C2: n: 0 r: "^Int.toString(r)^"\n"); Int.toString(r))
 |  nodes_on_level n d (node(left, r, right)) = (print ("C3: n: "^Int.toString(n)^" r: "^Int.toString(r)^"\n"); 
            (nodes_on_level (n-1) d left) ^ (padding_children n d) ^ (nodes_on_level (n-1) d right));

fun tree_to_string_help l d t = if (l = d) then "end" else (print ("tree_to_string_help "^(i2s l)^" "^(i2s d)^"\n") ;
                            (left_padding l d) ^ (nodes_on_level l d t) ^ "\n" ^ (tree_to_string_help (l+1) d t));

fun tree_to_string t = print(tree_to_string_help 0 (depth t) t);


