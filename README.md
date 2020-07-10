OCaml Workflow: A Standard OCaml Project
--------------
![Test](https://github.com/patricoferris/ocaml-workflows-ci-github/workflows/Numbers/badge.svg?branch=trunk&event=push)

This repostiory contains a skeleton for building a simple OCaml project. It uses:

 - Github Actions for Continuous Integration
 - [Alcotest](https://github.com/mirage/alcotest) for running unit tests 
 - Built with [dune](https://github.com/ocaml/dune)
 - Documentation generated by [odoc](https://github.com/ocaml/odoc) and released to `gh-pages` branch using [dune-release](https://github.com/ocamllabs/dune-release) - see [them live](https://patricoferris.github.io/ocaml-workflow/)
 - Formatting via [ocamlformat](https://github.com/ocaml-ppx/ocamlformat)

This package could be easily released on `opam` but because it is more of a demo it isn't. You still should have a `<package>.opam` file to unlock useful parts of the OCaml Platform.

## Continuous Integration 

CI is provided directly by Github using [Github Actions](https://github.com/features/actions). The configuration file can be found [here](https://github.com/patricoferris/ocaml-workflows-ci-github/blob/trunk/.github/workflows/test.yml).
Let's look at what each line is saying. [Full documentation](https://docs.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow) is also available.  

 - `on: [push]` - here we provided a list of events that will trigger our workflow. 

 - `strategy` - allows us to build a matrix for how environment we want to run our code on. We can then reference things in the strategy using `${{ foo.bar }}` syntax. 
This is very useful for making sure you have good coverage over (a) multiple versions of OCaml and (b) different operating systems. Additionally, it is a matrix so we 
get all combinations of the two.

- `uses` and `with` - the `uses` keyword specifies a Github Action. The [marketplace](https://github.com/marketplace?type=actions) allows you to look through many possible actions. 
`with` allows you to parameterise these actions, for example to checkout the `trunk` we pass `ref: trunk` to the `actions/checkout@v2`. 

- `name` and `run` - here we simply run commands giving them names (much like `RUN` in Dockerfiles if you are familiar with them).
 