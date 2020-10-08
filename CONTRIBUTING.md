# Contributing

Awesome that you are reading this.

This GitHub follows the [Contributor Covenant Code of Conduct](code_of_conduct.md).

 * For questions, you can create an Issue
 * Code changes go via Pull Requests

## Submitting code

Submitted code should follow these quality guidelines:

 * All tests pass cleanly/silently
 * Code coverage must be 100%
 * Coding style should follow the default style by `lintr`

These are all checked by Travis CI when submitting
a Pull Request. 

Emails with code will not be accepted.

## Submitting bugs

Awesome. These are your options:

 * Add an Issue, with [a reprex](https://community.rstudio.com/t/faq-whats-a-reproducible-example-reprex-and-how-do-i-do-one/5219)
 * Submit a Pull Request, where the test is added to the `tests/testthat` folder.
   Fork from the `develop` branch
 * Send @richelbilderbeek an email (@richelbilderbeek will make an Issue of it)

Pull Requests should follow the same guidelines as 'Submitting code'.

## Branching policy

 * The `master` branch should always build successfully
 * The `development` branch is for developers

## git usage

To get started working on `tmhmm` do:

```
git clone https://github.com/richelbilderbeek/tmhmm
```

Development is done on the `develop` branch. 
To download and checkout the `develop` branch, 
first go into the `tmhmm` folder (`cd tmhmm`), then do:

```
git checkout develop
```

Then the workflow is the common `git` workflow:

```
git pull
git add --all :/
git commit -m "Did something awesome"
git push
```

