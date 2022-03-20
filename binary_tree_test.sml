use "binary_tree.sml";

 val tree = tnil;
 val tree = insert tree 4;
 val tree = insert tree 1;
 val tree = insert tree 5;
 val tree = insert tree 7;
 val tree = insert tree 3;
 val tree = insert tree 2;


 val tree = insert tree 6;
 

tree_to_string tree;


 find_min tree;

 delete tree 1;

 depth tree;

 spaces 5;

 nodes_on_level 1 (depth tree) tree;
 

  Real.toInt IEEEReal.TO_NEAREST (Math.pow (2.0, (Real.fromInt (3 - 1))));

 val level = 0;
 val depth = 4;
 padding_children 0 4;


tree_to_string_help 4 4 tree;
val l = 3;
val d = 4;
val t = tree;
left_padding l d;
nodes_on_level l d t;