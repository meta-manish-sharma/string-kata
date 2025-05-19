# String Kata

A simple String Calculator implemented using Test-Driven Development (TDD) in Ruby.

---

## Features

- Adds numbers given in a comma-separated string.
- Returns 0 for an empty string.
- Supports any number of numbers.
- Supports newline characters as delimiters (e.g. "1\n2,3").
- Supports custom single-character delimiters defined like: `//;\n1;2`.
- Throws an exception if negative numbers are included, listing all negatives.
- Ignores numbers greater than 1000.
- Supports custom delimiters of any length, e.g. `//[***]\n1***2***3`.
- Supports multiple custom delimiters, e.g. `//[*][%]\n1*2%3`.
- Supports multiple delimiters of any length, e.g. `//[***][%%%]\n1***2%%%3`

---

## Getting Started

### Prerequisites

- Ruby installed (tested with Ruby 2.7+)
- Bundler gem installed

### Setup

```bash
git clone <repo_url>
cd string-kata
bundle install
