use "hw1.sml";

(* Problem 1: is_older *)
val p1_first_older = is_older((2021, 4, 19), (2021, 6, 13)) = true
val p1_same_date = is_older((2021, 1, 23), (2021, 1, 23)) = false
val p1_second_older = is_older((2020, 02, 20), (2005, 6, 27)) = false

(* Problem 2: number_in_month *)
val p2_no_dates = number_in_month([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], 2) = 0
val p2_one_date = number_in_month([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], 4) = 1
val p2_two_dates = number_in_month([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], 1) = 2

(* Problem 3: number_in_months *)
val p3_no_dates = number_in_months([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [2, 3]) = 0
val p3_one_date = number_in_months([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [4]) = 1
val p3_diff_months = number_in_months([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [1, 4]) = 3

(* Problem 4: date_in_month *)
val p4_no_dates = dates_in_month([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], 2) = []
val p4_one_date = dates_in_month([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], 4) = [(2021, 4, 3)]
val p4_two_dates = dates_in_month([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], 1) = [(2021, 1, 30), (2021, 1, 13)]

(* Problem 5: date_in_months *)
val p5_no_dates = dates_in_months([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [2, 3]) = []
val p5_one_date = dates_in_months([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [4]) = [(2021, 4, 3)]
val p5_diff_months = dates_in_months([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [1, 4]) = [(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)]

(* Problem 6: get_nth *)
val p6_first_elem = get_nth(["foo", "bar", "baz"], 1) = "foo"
val p6_last_elem = get_nth(["foo", "bar", "baz"], 3) = "baz"

(* Problem 7: date_to_string *)
val p7_test1 = date_to_string((2013, 1, 20)) = "January 20, 2013"
val p7_test2 = date_to_string((2021, 6, 20)) = "June 20, 2021"

(* Problem 8: number_before_reaching_sum *)
val p8_test1 = number_before_reaching_sum(40, [15, 10, 10, 5, 5]) = 3
val p8_test2 = number_before_reaching_sum(40, [15, 10, 10, 10, 5]) = 3
val p8_test3 = number_before_reaching_sum(40, [15, 10, 20, 10, 5]) = 2
val p8_test4 = number_before_reaching_sum(40, [40, 10, 20, 10, 5]) = 0

(* Problem 9: what_month *)
val p9_test_jan_begin = what_month(1) = 1
val p9_test_jan_end = what_month(31) = 1
val p9_test_feb_begin = what_month(32) = 2
val p9_test_feb_end = what_month(59) = 2
val p9_test_mar_begin = what_month(60) = 3
val p9_test_mar_end = what_month(90) = 3
val p9_test_apr_begin = what_month(91) = 4
val p9_test_apr_end = what_month(120) = 4
val p9_test_may_begin = what_month(121) = 5
val p9_test_may_end = what_month(151) = 5
val p9_test_jun_begin = what_month(152) = 6
val p9_test_jun_end = what_month(181) = 6
val p9_test_jul_begin = what_month(182) = 7
val p9_test_jul_end = what_month(212) = 7
val p9_test_aug_begin = what_month(213) = 8
val p9_test_aug_end = what_month(243) = 8
val p9_test_sep_begin = what_month(244) = 9
val p9_test_sep_end = what_month(273) = 9
val p9_test_oct_begin = what_month(274) = 10
val p9_test_oct_end = what_month(304) = 10
val p9_test_nov_begin = what_month(305) = 11
val p9_test_nov_end = what_month(334) = 11
val p9_test_dec_begin = what_month(335) = 12
val p9_test_dec_end = what_month(365) = 12

(* Problem 10: month_range *)
val p10_test_empty = month_range(32, 31) = []
val p10_test_one = month_range(32, 32) = [2]
val p10_test_jan_feb = month_range(31, 32) = [1, 2]
val p10_test_jan_mar = month_range(31, 61) = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3]

(* Problem 11: oldest *)
val p11_none = oldest([]) = NONE
val p11_some_oldest_first = oldest([(2021, 6, 3), (2021, 6, 4), (2021, 6, 5)]) = SOME((2021, 6, 3))
val p11_some_oldest_middle = oldest([(2021, 6, 5), (2021, 6, 3), (2021, 6, 4)]) = SOME((2021, 6, 3))
val p11_some_oldest_last = oldest([(2021, 6, 5), (2021, 6, 4), (2021, 6, 3)]) = SOME((2021, 6, 3))

(* Problem 12a: number_in_months_challenge *)
val p12a_no_dates = number_in_months_challenge([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [2, 3, 2]) = 0
val p12a_one_date = number_in_months_challenge([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [4, 4]) = 1
val p12a_diff_months = number_in_months_challenge([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [1, 4, 4, 1]) = 3

(* Problem 12b: dates_in_months_challenge *)
val p12b_no_dates = dates_in_months_challenge([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [2, 3, 2]) = []
val p12b_one_date = dates_in_months_challenge([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [4, 4]) = [(2021, 4, 3)]
val p12b_diff_months = dates_in_months_challenge([(2021, 1, 30), (2021, 1, 13), (2021, 4, 3)], [1, 4, 4, 1]) = [(2021, 4, 3), (2021, 1, 30), (2021, 1, 13)]

(* Problem 13: reasonable_date *)
val p13_real_date = reasonable_date(1, 6, 30) = true
val p13_real_date_leap_year_hundred = reasonable_date(400, 2, 29) = true
val p13_real_date_leap_year_four = reasonable_date(204, 2, 29) = true
val p13_bad_date_year = reasonable_date(0, 6, 30) = false
val p13_bad_date_month = reasonable_date(1, 13, 30) = false
val p13_bad_date_day = reasonable_date(1, 6, 31) = false
val p13_bad_date_leap_year = reasonable_date(200, 2, 29) = false
