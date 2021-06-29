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
    (
        (#1 x) <  (#1 y)
    ) orelse
    (
        (#1 x) =  (#1 y) andalso (#2 x) <  (#2 y)
    ) orelse
    (
        (#1 x) =  (#1 y) andalso (#2 x) =  (#2 y) andalso (#3 x) < (#3 y)
    )

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

(* Problem 6: get_nth *)
fun get_nth(elems: 'a list, idx: int) =
    if idx = 1
    then hd(elems)
    else get_nth(tl(elems), idx - 1)

(* Problem 7: date_to_string *)
fun date_to_string(date: date) =
    get_nth(
        [
            "January", 
            "February", 
            "March", 
            "April", 
            "May", 
            "June", 
            "July", 
            "August", 
            "September", 
            "October", 
            "November", 
            "December"
        ], (#2 date)
    ) ^ " " ^
    Int.toString((#3 date)) ^ ", " ^ Int.toString((#1 date))

(* Problem 8: number_before_reaching_sum *)
fun number_before_reaching_sum(sum: int, accs: int list) =
    if sum > 0
    then 1 + number_before_reaching_sum(sum - hd(accs), tl(accs))
    else ~1

(* Problem 9: what_month *)
fun what_month(doy: int) =
    number_before_reaching_sum(doy, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) + 1

(* Problem 10: month_range *)
fun month_range(doy1: int, doy2: int) =
    if doy1 > doy2
    then []
    else what_month(doy1) :: month_range(doy1 + 1, doy2)

(* Problem 11: oldest *)
fun oldest(dates: date list) =
    if null(dates)
    then NONE
    else let
        fun oldest_nonempty(dates: date list) =
            if null(tl(dates))
            then hd(dates)
            else let val tl_oldest = oldest_nonempty(tl(dates))
                in
                    if is_older(hd(dates), tl_oldest)
                    then hd(dates)
                    else tl_oldest
                end
    in
        SOME(oldest_nonempty(dates))
    end

(* Problem 12: challenge problem helper functions *)
fun not_in_list(i: int, l: int list) =
    null(l) orelse (hd(l) <> i andalso not_in_list(i, tl(l)))

fun dedupe(l: int list) =
    if null(l)
    then []
    else let val deduped = dedupe(tl(l))
        in
            if not_in_list(hd(l), deduped)
            then hd(l) :: deduped
            else deduped
        end

(* Problem 12a: number_in_months_challenge *)
fun number_in_months_challenge(dates: date list, months: int list) =
    number_in_months(dates, dedupe(months))

(* Problem 12a: dates_in_months_challenge *)
fun dates_in_months_challenge(dates: date list, months: int list) =
    dates_in_months(dates, dedupe(months))

(* Problem 13: reasonable_date *)
fun reasonable_date(date: date) =
    let
        val year = (#1 date)
        val month = (#2 date)
        val day = (#3 date)
    in
        year > 0 andalso
        (
            (
                month = 2 andalso 
                day = 29 andalso 
                (
                    year mod 400 = 0 orelse 
                    (year mod 4 = 0 andalso year mod 100 <> 0)
                )
            ) orelse
            (
                month >= 1 andalso 
                month <= 12 andalso 
                day >= 1 andalso 
                day <= get_nth([31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], month)
            )
        )
    end