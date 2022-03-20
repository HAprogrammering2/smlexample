(* First some simple help functions *)
fun max x y = if x > y then x else y;

fun i2s i = Int.toString(i);

(* The datatype for a tree *)
datatype 'a tree = tnil 
 |  node of ('a tree) * 'a * ('a tree);

exception EmptyTree; 

fun insert tnil (x:int) = (node (tnil, x, tnil))
 |  insert (node (left, root, right)) x = if x < root then (node(insert left x, root, right)) 
                                                      else (node(left, root, insert right x));

fun find_min tnil = raise EmptyTree
 |  find_min (node(tnil, x, right)) = x
 |  find_min (node(left, x, right)) = find_min left;

fun find_max tnil = raise EmptyTree
 |  find_max (node(left, r, tnil)) = r
 |  find_max (node(left, r, right)) = find_max right;

fun delete tnil (x:int) = tnil
 |  delete (node (tnil, r , tnil)) x = if (x = r) then tnil else (node (tnil, r, tnil))
 |  delete (node (left, r, tnil)) x = if (x = r) then (node(delete left (find_max left), find_max left, tnil)) 
                                  else if (x > r) then (node (left, r, tnil)) 
                                                  else (node(delete left x, r, tnil))
 |  delete (node (left, r, right)) x = if (x = r) then (node (left, find_min right, delete right (find_min right))) 
                                  else if (x < r) then (node(delete left x, r, right)) 
                                                  else (node (left, r, delete right x));

fun depth tnil = 0
 |  depth (node(tnil, r, tnil)) = 1
 |  depth (node(left, r, right)) = (max (depth left) (depth right)) + 1;


(* Help functions for printing a tree *)
local 
    fun spaces 0 = ""
    |  spaces 1 = " "
    |  spaces n = " " ^ (spaces (n-1));

    fun left_padding level depth = (spaces (Real.toInt IEEEReal.TO_NEAREST (Math.pow (2.0, (Real.fromInt(depth - level))))));

    fun padding_children level depth = (spaces ((Real.toInt IEEEReal.TO_NEAREST (Math.pow (2.0, (Real.fromInt(depth - level + 1)))))-2));

    fun wide_string n = if (n<10) then " "^(i2s n)  else (i2s n);

    (* Outputs nodes on the given level, adding padding *)
    fun nodes_on_level 0  (tnil: int tree) (p : string) =  "  "                                         (* Base case 1: tnil *)
    |  nodes_on_level n  tnil p = ((nodes_on_level (n-1) tnil p) ^ p ^ (nodes_on_level (n-1) tnil p))   (* Base case 2: no nodes on the level *)
    |  nodes_on_level 0  (node(left, r, right)) p = (wide_string r)                                     (* This is the level we print. *)
    |  nodes_on_level n  (node(left, r, right)) p = (nodes_on_level (n-1) left p) ^ p ^ (nodes_on_level (n-1) right p); (* Add padding between *)

    (* Recurses through levels 0 to d-1, calling nodes_on_level for each level *)
    fun tree_to_string_help l d t = if (l = d) then "" else 
            (left_padding l d) ^ (nodes_on_level l t (padding_children l d)) ^ "\n" ^ (tree_to_string_help (l+1) d t);
in

fun print_tree t = print(tree_to_string_help 0 (depth t) t);

end;

