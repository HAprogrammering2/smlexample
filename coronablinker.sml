use "date.sml";

local
fun insert_in_order (dt, dv) [] = [(dt, dv)]
 |  insert_in_order (dt, dv) ((hdt, hdv)::t) = if (compare dt hdt) = date_after 
                                               then ((hdt, hdv) :: (insert_in_order (dt,dv) t))
                                               else ((dt, dv) :: (hdt, hdv) :: t);
fun sort_help [] aux = aux
 |  sort_help (h::t) aux = sort_help t (insert_in_order h aux);
in
fun sort list = sort_help list [];
end;

local
fun purge [] date = []
 |  purge ((dt, dv)::t) date = if (compare dt date) = date_before then purge t date else ((dt,dv) :: (purge t date));
in
fun remove_old list today = purge list (days_before today 21); 
end;


fun add_device date device list = if date_valid date then (date, device) :: list else raise InvalidDate;

fun check_exposure device [] = false
 |  check_exposure device ((dt, dv)::t) = if (device = dv) then true else check_exposure device t;
