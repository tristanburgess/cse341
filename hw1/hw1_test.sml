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
