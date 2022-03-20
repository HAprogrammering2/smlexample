use "binary_tree.sml";

 val tree = tnil;
 val tree = insert tree 4;
 val tree = insert tree 1;
 val tree = insert tree 5;
 val tree = insert tree 7;
 val tree = insert tree 3;
 val tree = insert tree 2;


 val tree = tnil;
 val tree = insert tree 8;
 val tree = insert tree 4;
 val tree = insert tree 14;
 val tree = insert tree 2;
 val tree = insert tree 6;
 val tree = insert tree 16;
 val tree = insert tree 12;

 val tree = tnil;
 val tree = insert tree 8;
 val tree = insert tree 4;
 val tree = insert tree 14;
 val tree = insert tree 2;
 val tree = insert tree 6;
 val tree = insert tree 1;
 val tree = insert tree 3;
 val tree = insert tree 5;
 val tree = insert tree 7;
 val tree = insert tree 16;
 val tree = insert tree 12;
 val tree = insert tree 11;
 val tree = insert tree 13;
 val tree = insert tree 15;
 val tree = insert tree 17;
 

print_tree tree;

val tree = delete tree 8;
val tree = delete tree 16;

print_tree tree;

val str = "/   " ^ Char.toString(chr(92));