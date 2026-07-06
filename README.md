# Haskell MOOC — Exercise Solutions (Sets 1–16)

> Complete, test-passing solutions to every exercise of the University of Helsinki
> **Haskell MOOC** — an independent, from-skeleton implementation built on the course's own
> Stack project and shipped test suite, part of a [csdiy.wiki](https://csdiy.wiki/) full-catalog build.

![status](https://img.shields.io/badge/status-complete-brightgreen)
![language](https://img.shields.io/badge/Haskell-informational)
![license](https://img.shields.io/badge/license-MIT-blue)

## Overview

The [Haskell MOOC](https://haskell.mooc.fi/) (`haskell.mooc.fi`) from the University of Helsinki
teaches functional programming in Haskell across two parts and 16 exercise sets, covering
everything from basic recursion up to monads, applicative validation, property-based testing,
and phantom types. This repository contains a full solution to **every exercise** in the course's
official [`moocfi/haskell-mooc`](https://github.com/moocfi/haskell-mooc) skeleton — 258 exercises
across Sets 1–16 — each verified against the shipped QuickCheck/hspec test suite via `stack test`.

The starter skeleton (module scaffolding, `Mooc.*` test harness, `Examples.*` modules, and every
`SetNTest.hs`) is the course's own, imported as the first commit. All exercise-body implementations
in the `SetN.hs` files are mine.

## Results (measured on Windows, CPU-only, GHC 9.2.8 / Stack lts-20.25)

Each set is graded by its own `SetNTest.hs`, which prints a per-set `X / Y` score and writes
`score.json`. Full captured output is in [`results/`](results/).

<!-- RESULTS_TABLE -->

## Implemented assignments

Part 1 — functional programming basics:

- [x] **Set1** — Bool, Int, arithmetic, function definitions
- [x] **Set2a / Set2b** — recursion, guards, pattern matching on lists
- [x] **Set3a / Set3b** — lists, strings, `Maybe`, `Either`
- [x] **Set4a / Set4b** — type classes, `Eq`/`Ord`, folds, higher-order functions
- [x] **Set5a / Set5b** — algebraic & recursive datatypes, binary trees
- [x] **Set6** — defining type class instances (`Eq`, `Ord`, `Num`, custom classes)
- [x] **Set7** — `Semigroup`/`Monoid`, `NonEmpty`, a small state machine and arithmetic DSL
- [x] **Set8** — the functional image library project (`JuicyPixels`): shapes, transforms, blur

Part 2 — monads, applicatives, effects:

- [x] **Set9a / Set9b** — misc functions; the N-Queens solver via backtracking
- [x] **Set10a / Set10b** — laziness, infinite lists; forcing evaluation without `seq`
- [x] **Set11a / Set11b** — `IO`, `do`-notation, `IORef`, file handles
- [x] **Set12** — `Functor` and `Foldable` instances (`fmap`, `foldr`, `foldMap`)
- [x] **Set13a / Set13b** — `Maybe`/`State`/`Logger`/list monads; a custom `SL` monad
- [x] **Set14a / Set14b** — `Text`/`ByteString`; an SQLite-backed bank HTTP API (`wai`/`warp`)
- [x] **Set15** — `Applicative`, `Validation`, `Alternative`, functor composition
- [x] **Set16a** — property-based testing with QuickCheck (`Property`, generators, `Arbitrary`)
- [x] **Set16b** — phantom types for compile-time currency/name safety

## Project structure

```
haskell-mooc/
├── exercises/
│   ├── Set1.hs .. Set16b.hs        # exercise solutions (implemented by me)
│   ├── Set1Test.hs .. Set16bTest.hs # shipped test suites (course skeleton)
│   ├── Mooc/                        # course test harness (Test, Th, Todo, ...)
│   ├── Examples/                    # course example modules (Bank, Validation, Phantom, ...)
│   ├── stack.yaml                   # resolver lts-20.25 (GHC 9.2.8)
│   └── tests.cabal
├── results/                         # captured `stack runghc SetNTest.hs` output
├── LICENSE
└── README.md
```

## How to run

Requires [Stack](https://docs.haskellstack.org/). From the repo root:

```bash
cd exercises
stack setup          # fetches GHC 9.2.8 (one-time, ~480 MB)
stack build          # builds the library (test harness + examples)

# Run one set's test suite (prints "X / Y" and writes score.json):
stack runghc Set7Test.hs

# Run every set's tests and capture output (reproduces results/):
for s in 1 2a 2b 3a 3b 4a 4b 5a 5b 6 7 8 9a 9b 10a 10b 11a 11b 12 13a 13b 14a 14b 15 16a 16b; do
  stack runghc "Set${s}Test.hs"
done
```

## Verification

Every set was verified with the course's own test suite (`SetNTest.hs`, built on QuickCheck +
the `Mooc.Test` harness). Each run prints a per-exercise `1`/`0`/`_` line and a final `score / total`.
Captured outputs live in [`results/`](results/); a summary is in the results table above.

## Tech stack

- **Language:** Haskell (GHC 9.2.8)
- **Build/test:** Stack (resolver `lts-20.25`), QuickCheck, hspec
- **Libraries used across sets:** `JuicyPixels` (image DSL), `text`, `bytestring`, `wai`/`warp`
  (HTTP server), `sqlite-simple` (database), `transformers` (`State`), `containers`

## Key ideas / what I learned

- Building up from pure recursion to `Semigroup`/`Monoid`, `Functor`/`Foldable`, and the monad
  hierarchy, then to `Applicative`-style validation that accumulates *all* errors.
- Writing lazy functions that work on infinite lists, and forcing evaluation with pattern matching
  when `seq` is unavailable.
- Structuring effectful programs: `IO`/`do`, `IORef` state, and a real SQLite + `wai`/`warp` HTTP API.
- Encoding a functional image as `Coord -> Color` and composing shapes, patterns, and transforms.
- Using phantom types to make currency mismatches and name-kind mismatches compile-time errors.
- Property-based testing: expressing correctness as QuickCheck `Property`s and writing generators.

## Credits & license

Based on the exercises of the **[Haskell MOOC](https://haskell.mooc.fi/)** by the University of
Helsinki (Joel Kaasinen / John Lång and contributors). The `exercises/` skeleton — module
scaffolding, the `Mooc.*` test harness, `Examples.*` modules, and every `SetNTest.hs` — is from the
official [`moocfi/haskell-mooc`](https://github.com/moocfi/haskell-mooc) repository and belongs to
its original authors. This repository is an independent educational reimplementation of the exercise
solutions; my own code (the `SetN.hs` exercise bodies) is released under the [MIT License](LICENSE).
