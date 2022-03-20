(* Exception for invalid dates *)
exception InvalidDate;

(* Date functions *)
fun is_valid_month month = month > 0 andalso month < 13;

fun is_leap_year year = ((year mod 4 = 0) andalso (year mod 100 <> 0)) orelse (year mod 400 = 0);

fun days_in_month 2 y = if is_leap_year y then 29 else 28
 |  days_in_month m y = if (m = 4) orelse (m = 6) orelse (m = 9) orelse (m = 11) then 30 else 31;

fun date_valid (d,m,y) = if is_valid_month m andalso 
                         (d >= 1 andalso d <= days_in_month m y) then true
                         else false;

fun one_day_before (1,1,y) = (31,12,y-1)
 |  one_day_before (1,m,y) = (days_in_month (m-1) y, m-1, y)
 |  one_day_before (d,m,y) = (d-1, m, y);

fun days_before date 1 = one_day_before date
 |  days_before date n = days_before (one_day_before date) (n-1);

datatype order = date_before | date_same | date_after;

fun compare (d1, m1, y1) (d2, m2, y2) = if y1 < y2 then date_before else if y1 > y2 then date_after else 
                                        if m1 < m2 then date_before else if m1 > m2 then date_after else
                                        if d1 < d2 then date_before else if d1 > d2 then date_after else date_same;
