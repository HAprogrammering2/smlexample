val devicelist = [];

val devicelist = add_device (1,1,2021) 33 devicelist;

val devicelist = add_device (15,1,2021) 44;

val devicelist = add_device (31,1,2021) 55 (add_device (15,2,2021) 66 (add_device (28,2,2021) 77 (add_device (10,3,2021) 88 devicelist)));

val devicelist = sort devicelist;

val today = (15,3,2021);

val devicelist = remove_old devicelist today;

check_exposure 66 devicelist;

check_exposure 88 devicelist;