let fib n = 
  let rec loop a b = function 
    | n when n <= 0 -> b
    | n -> loop (a + b) a (n - 1)
  in 
    loop 1 0 n

let fib_z n = 
  let rec loop a b = function 
    | n when Z.compare n Z.zero <= 0 -> b 
    | n -> loop (Z.add a b) a (Z.add n Z.minus_one)
  in 
    loop Z.one Z.zero n 