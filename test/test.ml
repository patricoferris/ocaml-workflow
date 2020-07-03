let () = 
  Alcotest.run "Numbers" [
    "Fibonacci", Test_fib.tests;
    "Factorial", Test_fact.tests
  ]