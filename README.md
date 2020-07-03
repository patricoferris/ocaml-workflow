OCaml Workflow: Continuous Integration with Github Actions 
--------------
![Test](https://github.com/patricoferris/ocaml-workflows-ci-github/workflows/Numbers/badge.svg?branch=trunk&event=push)

This repostiory contains a skeleton for building a simple OCaml project that use CI support using Github actions. It uses the [Alcotest](https://github.com/mirage/alcotest)
testing framework to run unit tests over the two modules in `lib`. The project itself has one dependency, [Zarith](https://github.com/ocaml/Zarith), this is more 
to show how having extra dependencies requires additional logic in the configuration files.

An important point is that this is not an `opam` package (but could easily be turned into one by generating an opam file). Not all projects necessarily want to be 
an `opam` package, this represents the most bare-bones of OCaml projects.

## How it works? 

CI is provided directly by Github using [Github Actions](https://github.com/features/actions). The configuration file can be found [here](https://github.com/patricoferris/ocaml-workflows-ci-github/blob/trunk/.github/workflows/test.yml).
Let's look at what each line is saying. [Full documentation](https://docs.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow) is also available.  

 - `on: [push]` - here we provided a list of events that will trigger our workflow. 

 - `strategy` - allows us to build a matrix for how environment we want to run our code on. We can then reference things in the strategy using `${{ foo.bar }}` syntax. 
This is very useful for making sure you have good coverage over (a) multiple versions of OCaml and (b) different operating systems. Additionally, it is a matrix so we 
get all combinations of the two.

- `uses` and `with` - the `uses` keyword specifies a Github Action. The [marketplace](https://github.com/marketplace?type=actions) allows you to look through many possible actions. 
`with` allows you to parameterise these actions, for example to checkout the `trunk` we pass `ref: trunk` to the `actions/checkout@v2`. 

- `name` and `run` - here we simply run commands giving them names (much like `RUN` in Dockerfiles if you are familiar with them).

## Benefits 

Github Actions are easy to integrate with existing reporsitories on Github. Your CI lives alongside your code. 

Github Actions are also fairly flexible - they can be used to do more than test code They could, for example, push tested docker images to dockerhub or deploy websites if they pass testing. 

## Limitations

One major limitation is the lack of flexibility for testing different operating systems. Github currently only supports versions of Ubunutu, MacOS and Windows with preinstalled software. This small example repository won't work on their version of Windows because the [GMP](https://gmplib.org/) library is not installed. 
