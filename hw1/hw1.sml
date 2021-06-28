(* 
    For purposes of this assignment, dates are SML values of type int*int*int,
    representing the year (positive), month (1-12), day (1-31, or less depending on month).

    A "day of year" is a number from 1 to 365.

    The challenge problems will entail correct date validation, but
    the non-challenge solutions can assume a valid date is provided.
*)

type date = (int*int*int)

(* Problem 1: is_older *)
fun is_older(x: date, y: date) =
    if (#1 x) <  (#1 y)
    then true
    else if (#1 x) =  (#1 y) andalso (#2 x) <  (#2 y)
    then true
    else if (#1 x) =  (#1 y) andalso (#2 x) =  (#2 y) andalso (#3 x) < (#3 y)
    then true
    else false

(* Problem 2: number_in_month *)
fun number_in_month(dates: date list, month: int) =
    if null(dates)
    then 0
    else
        let val acc = if (#2 (hd(dates))) = month then 1 else 0
        in
            acc + number_in_month(tl(dates), month)
        end

(* Problem 3: number_in_months *)
fun number_in_months(dates: date list, months: int list) =
    if null(months)
    then 0
    else number_in_months(dates, tl(months)) + number_in_month(dates, hd(months))

(* Problem 4: dates_in_month *)
fun dates_in_month(dates: date list, month: int) =
    if null(dates)
    then []
    else if (#2 (hd(dates))) = month 
    then hd(dates) :: dates_in_month(tl(dates), month)
    else dates_in_month(tl(dates), month)

(* Problem 5: dates_in_months *)
fun dates_in_months(dates: date list, months: int list) =
    if null(months)
    then []
    else dates_in_month(dates, hd(months)) @ dates_in_months(dates, tl(months))
