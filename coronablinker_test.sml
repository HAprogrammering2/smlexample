use "coronablinker.sml";

val devicelist = [];

val devicelist = add_device (1,1,2022) 33 devicelist;

val devicelist = add_device (15,1,2022) 44 devicelist;

val devicelist = add_device (31,1,2022) 55 (add_device (15,2,2022) 66 (add_device (28,2,2022) 77 (add_device (10,3,2022) 88 devicelist)));

val devicelist = sort devicelist;

val today = (22,3,2022);

val devicelist = remove_old devicelist today;

check_exposure 66 devicelist;

check_exposure 88 devicelist;