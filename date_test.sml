use "date.sml";

is_valid_month 2;
is_valid_month 13;

is_leap_year 2022;
is_leap_year 2020;

days_in_month 2 2022;
days_in_month 2 2020;
days_in_month 12 2022;

date_valid (2,2,2022);
date_valid (29,2,2022);
date_valid (29,2,2024);
date_valid (32,12,2022);

one_day_before (22,3,2022);
one_day_before (1,3,2022);
one_day_before (1,1,2022);

days_before (22,3,2022) 21;

compare (1,3,2022) (22,3,2022);
compare (22,3,2022) (1,3,2022);
compare (22,3,2022) (22,3,2022);