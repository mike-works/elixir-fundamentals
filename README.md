<p align='center'>
  <a href="https://mike.works" target='_blank'>
    <img height=40 src='https://assets.mike.works/img/login_logo-33a9e523d451fb0d902f73d5452d4a0b.png' />
  </a> 
</p>
<p align='center'>
  <a href="https://mike.works/course/elixir-fundamentals-2b07030" target='_blank'>
    <img height=200 src='https://cloud.githubusercontent.com/assets/558005/26024427/1a9cb876-37d1-11e7-9f2c-88893b6280f0.png' />
  </a>
</p> 

<p align='center'>
  <a href="https://travis-ci.org/mike-works/elixir-fundamentals" title="Build Status">
    <img title="Build Status" src="https://travis-ci.org/mike-works/elixir-fundamentals.svg?branch=solutions"/>
  </a>
  <a href="https://mike.works/course/elixir-fundamentals-2b07030" title="Elixir Fundamentals">
    <img title="Course Outline" src="https://img.shields.io/badge/mike.works-course%20outline-blue.svg"/>
  </a>
  <a href="https://docs.mike.works/elixir-fundamentals" title="Slides">
    <img title="Slides" src="https://img.shields.io/badge/mike.works-slides-blue.svg"/>
  </a>
</p>
<p align='center'>
This is the example project used for the <a title="Mike.Works" href="https://mike.works">Mike.Works</a> <a title="Elixir Fundamentals" href="https://mike.works/course/elixir-fundamentals-2b07030">Elixir Fundamentals</a> course.
</p>

# Are there any documents that go along with this?
Yes! **[Here are the slides](https://docs.mike.works/elixir-fundamentals)**, and **[here's a course outline](https://mike.works/course/elixir-fundamentals-2b07030)**.

# Setting Up
* First, you'll need to ensure you have [Elixir](http://elixir-lang.org/install.html) installed on your computer. This workshop requires that you have version `1.4` installed, which requires Erlang `v18`.

* Next, clone this project
```sh
git clone https://github.com/mike-works/elixir-fundamentals.git myelixir
```
* Then, go into the project and install dependencies
```sh
cd myelixir
mix deps.get
```

## Development Environment

Setup a development environment that includes Elixir syntax hilighting. I recommend [Visual Studio Code](https://code.visualstudio.com/) with the following plugins
* [vscode-elixir](https://marketplace.visualstudio.com/items?itemName=mjmcloug.vscode-elixir) - for syntax hilighting and intellisense (autocomplete) of Elixir and Erlang core libraries.
* [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner) - for quick execution of code snippets
* [Dark+ Elixir (color theme)](https://marketplace.visualstudio.com/items?itemName=kkalita.dark-plus-elixir) - highlights some important parts of the language syntax more prominently than many default themes


# License
While the general license for this project is the BSD 3-clause, the exercises
themselves are proprietary and are licensed on a per-individual basis, usually
as a result of purchasing a ticket to a public workshop, or being a participant
in a private training.

Here are some guidelines for things that are **OK** and **NOT OK**, based on our
understanding of how these licenses work:

### OK
* Using everything in this project other than the exercises (or accompanying tests) 
to build a project used for your own free or commercial training material
* Copying code from build scripts, configuration files, tests and development 
harnesses that are not part of the exercises specifically, for your own projects
* As an owner of an individual license, using code from tests, exercises, or
exercise solutions for your own non-training-related project.

### NOT OK (without express written consent)
* Using this project, or any subset of 
exercises contained within this project to run your own workshops
* Writing a book that uses the code for these exercises
* Recording a screencast that contains one or more of this project's exercises 


# Copyright

&copy; 2018 [Mike.Works](https://mike.works), All Rights Reserved

###### This material may not be used for workshops, training, or any other form of instructing or teaching developers, without express written consent
