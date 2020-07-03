open Numbers.Fib

let test_int () = 
  let fib1 = fib (-10) in
  let fib2 = fib 10 in 
  let fib3 = fib 15 in 
    Alcotest.(check int) "fib of -10" 0 fib1; 
    Alcotest.(check int) "fib of 10" 55 fib2;
    Alcotest.(check int) "fib of 15" 610 fib3

let test_z_small () = 
  let fib1 = fib_z (Z.of_int (-10)) in
  let fib2 = fib_z (Z.of_int (10)) in 
  let fib3 = fib_z (Z.of_int (15)) in 
    Alcotest.(check Testable.zarith) "fib of -10" Z.zero fib1; 
    Alcotest.(check Testable.zarith) "fib of 10" (Z.of_int 55) fib2;
    Alcotest.(check Testable.zarith) "fib of 15" (Z.of_int 610) fib3

let test_z_big () = 
  let fib = fib_z (Z.of_int 1_000) in 
    Alcotest.(check string) "fib of 1_000" 
      "43466557686937456435688527675040625802564660517371780402481729089536555417949051890403879840079255169295922593080322634775209689623239873322471161642996440906533187938298969649928516003704476137795166849228875" 
      (Z.to_string fib)

let tests = [
  "test_int", `Quick, test_int;
  "test_zarith_small", `Quick, test_z_small;
  "test_zarith_big", `Quick, test_z_big
]