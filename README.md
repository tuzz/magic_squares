## Magic Squares

This repository contains a collection of programs for a programming language
called [Sentient](http://github.com/tuzz/sentient.js) that I've been building.
These programs attempt to find magic squares for cash prizes, as per this page:

[https://plus.maths.org/content/os/latestnews/may-aug10/magic/index](https://plus.maths.org/content/os/latestnews/may-aug10/magic/index)

## Setup

Install Sentient:

```
npm install -g sentient-lang
```

Run a program:

```
sentient enigma_1.snt
```

## Results

The following table summarises the results of this project thus far. These were
collected by running the Sentient programs found in this directory using the
[treengeling](http://fmv.jku.at/lingeling/) SAT solver, which is an effective,
parallel solver. The verbose output of each solve can be found in the `out/`
directory.

Date       | Enigma | Status   | Bits tested | Range tested      | Time taken |
-----------|--------|----------|-------------|-------------------|------------|
08-05-2016 | 1      | Unsolved | 10, 20      | 1..511, 1..524287 | 301 hours  |
