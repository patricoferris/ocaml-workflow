let fact n = 
  let rec aux acc = function 
    | n when n < 2 -> acc 
    | n -> aux (n * acc) (n - 1)
  in 
    aux 1 n 

let fact_z n = 
  let rec aux acc = function 
    | n when Z.compare n (Z.of_int 2) < 0 -> acc
    | n -> aux (Z.mul n acc) (Z.add n Z.minus_one)
  in 
    aux Z.one n