open Numberz.Fact

let test_int () = 
  let fact1 = fact (-10) in
  let fact2 = fact 10 in 
  let fact3 = fact 15 in 
    Alcotest.(check int) "fact of -10" 1 fact1; 
    Alcotest.(check int) "fact of 10" 3628800 fact2;
    Alcotest.(check int) "fact of 15" 1307674368000 fact3

let test_z_small () = 
  let fact1 = fact_z (Z.of_int (-10)) in
  let fact2 = fact_z (Z.of_int (10)) in 
  let fact3 = fact_z (Z.of_int (15)) in 
    Alcotest.(check Testable.zarith) "fact of -10" Z.one fact1; 
    Alcotest.(check Testable.zarith) "fact of 10" (Z.of_int 3628800) fact2;
    Alcotest.(check Testable.zarith) "fact of 15" (Z.of_int 1307674368000) fact3

let test_z_big () = 
  let fact = fact_z (Z.of_int 25) in 
    Alcotest.(check string) "fact of 25" 
      "15511210043330985984000000" 
      (Z.to_string fact)

let tests = [
  "test_int", `Quick, test_int;
  "test_zarith_small", `Quick, test_z_small;
  "test_zarith_big", `Quick, test_z_big
]