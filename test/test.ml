let () = 
  Alcotest.run "Numberz" [
    "Fibonacci", Test_fib.tests;
    "Factorial", Test_fact.tests
  ]