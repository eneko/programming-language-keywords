# Programming Language Keyword Counts

There was some debate on Twitter this week over if a higher number of
keywords means a programming language is more or less complex.

I was more interested in comparing keywords side-by-side. While this script
does not achieve that goal (yet), it does programmatically count the keywords
for each programming language, [using the Ruby gem `rouge`](http://rouge.jneen.net),
which has over **65 million downloads**, suports over 200 programming languages,
and it's widely used.

## The script

```ruby
#!/usr/bin/env ruby
require 'rouge'

Rouge.load_lexers

# puts Rouge::Lexers::C::keywords
# puts Rouge::Lexers::Swift::keywords  // 💥 error

lexers = Rouge::Lexer.all.sort_by { |lexer| lexer.to_s }
names = lexers.map { |lexer| lexer.title }
keyword_counts = lexers.map { |lexer|
  if lexer.respond_to?(:keywords) && lexer.keywords.respond_to?(:length)
    lexer.keywords.length
  else
    0
  end
}

puts "| Language | Keyword Count |"
puts "| -------- | ------------- |"
names.zip(keyword_counts).each { |name, count|
  puts "| #{name} | #{count} |"
}
```

## The results

| Language | Keyword Count |
| -------- | ------------- |
| ABAP | 944 |
| API Blueprint | 0 |
| ActionScript | 22 |
| Ada | 0 |
| Apache | 0 |
| Apex | 23 |
| AppleScript | 0 |
| ArmAsm | 0 |
| Augeas | 0 |
| Awk | 15 |
| BBCBASIC | 0 |
| BIML | 0 |
| BPF | 0 |
| Batchfile | 8 |
| BibTeX | 0 |
| Brainfuck | 0 |
| BrightScript | 0 |
| 1C (BSL) | 0 |
| C | 33 |
| CMHG | 0 |
| CMake | 0 |
| CSS | 0 |
| csvs | 0 |
| C# | 0 |
| CUDA | 77 |
| Ceylon | 0 |
| CFScript | 17 |
| Clean | 31 |
| Clojure | 12 |
| CoffeeScript | 31 |
| Common Lisp | 0 |
| Config File | 0 |
| Console | 0 |
| Coq | 0 |
| C++ | 68 |
| Crystal | 0 |
| Cypher | 58 |
| Cython | 33 |
| D | 0 |
| Dart | 0 |
| Datastudio | 0 |
| diff | 0 |
| digdag | 0 |
| Docker | 0 |
| DOT | 0 |
| ECL | 135 |
| EEX | 0 |
| EPP | 0 |
| ERB | 0 |
| Eiffel | 0 |
| Elixir | 0 |
| Elm | 0 |
| Email | 0 |
| Erlang | 0 |
| Escape | 0 |
| FSharp | 95 |
| Factor | 0 |
| Fortran | 122 |
| FreeFEM | 9 |
| GDScript | 226 |
| GHC Cmm (C--) | 0 |
| GHC Core | 0 |
| Gherkin | 4 |
| GLSL | 30 |
| Go | 0 |
| Gradle | 31 |
| Graphql | 0 |
| Groovy | 22 |
| HLSL | 62 |
| HOCON | 0 |
| HQL | 498 |
| HTML | 0 |
| HTTP | 0 |
| Hack | 89 |
| Haml | 0 |
| Handlebars | 0 |
| Haskell | 0 |
| Haxe | 31 |
| Hashicorp Configuration Language | 0 |
| HyLang | 30 |
| IDL | 8 |
| INI | 0 |
| Io | 0 |
| Irb | 0 |
| Irb_output | 0 |
| ISBL | 28 |
| IgorPro | 30 |
| J | 0 |
| JSL | 0 |
| JSON | 0 |
| Json-doc | 0 |
| Jsp | 0 |
| JSX | 32 |
| Janet | 0 |
| Java | 0 |
| JavaScript | 32 |
| Jinja | 34 |
| Jsonnet | 13 |
| Julia | 0 |
| Kotlin | 0 |
| LLVM | 309 |
| Lasso | 5 |
| Liquid | 0 |
| Literate CoffeeScript | 0 |
| Literate Haskell | 0 |
| LiveScript | 39 |
| Lua | 0 |
| Lustre | 26 |
| Lutin | 23 |
| M68k | 145 |
| MXML | 0 |
| Magik | 71 |
| Make | 0 |
| Markdown | 0 |
| Mason | 0 |
| Mathematica | 3 |
| MATLAB | 20 |
| MiniZinc | 27 |
| MoonScript | 0 |
| Mosel | 0 |
| MessageTrans | 0 |
| Nasm | 0 |
| NesAsm | 56 |
| nginx | 0 |
| Nim | 0 |
| Nix | 0 |
| OCL | 17 |
| OCaml | 46 |
| Objective-C | 33 |
| Objective-C++ | 68 |
| OpenEdge ABL | 1795 |
| OpenType Feature File | 94 |
| PHP | 70 |
| Pascal | 0 |
| Perl | 0 |
| Plain Text | 0 |
| Plist | 0 |
| Pony | 0 |
| PostScript | 0 |
| powershell | 0 |
| Praat | 0 |
| Prolog | 0 |
| Prometheus | 0 |
| .properties | 0 |
| Protobuf | 0 |
| Puppet | 13 |
| Python | 28 |
| Q | 9 |
| QML | 32 |
| R | 0 |
| Racket | 146 |
| ReScript | 29 |
| ReasonML | 45 |
| Rego | 0 |
| Robot Framework | 0 |
| Ruby | 0 |
| Rust | 42 |
| SAS | 0 |
| SML | 41 |
| SPARQL | 49 |
| SQF | 0 |
| SQL | 491 |
| SSH Config File | 0 |
| Sass | 0 |
| Scala | 0 |
| Scheme | 24 |
| SCSS | 0 |
| sed | 0 |
| shell | 0 |
| Sieve | 0 |
| Slice | 19 |
| Slim | 0 |
| Smalltalk | 0 |
| Smarty | 0 |
| Solidity | 52 |
| SuperCollider | 6 |
| Swift | 0 |
| Systemd | 0 |
| Tcl | 0 |
| TOML | 0 |
| TSX | 40 |
| TTCN3 | 85 |
| TAP | 0 |
| TeX | 0 |
| Terraform | 8 |
| Tulip | 0 |
| Turtle/TriG | 0 |
| Twig | 34 |
| TypeScript | 40 |
| VHDL 2008 | 97 |
| Vala | 0 |
| VCL: Varnish Configuration Language | 23 |
| Velocity | 0 |
| Verilog and System Verilog | 133 |
| VimL | 4 |
| Visual Basic | 120 |
| Vue | 0 |
| Wollok | 0 |
| XML | 0 |
| XPath | 0 |
| XQuery | 0 |
| Xojo | 0 |
| YAML | 0 |
| YANG | 0 |
| Zig | 64 |


## Running the code

```
bundle exec keywords.rb
```

## Caveats

Some lexers in Rouge are based on regular expressions and do not provide an
easy way to retrieve the list of keywords. The most notorious, since it was
the source of the debate, is the programming language Swift.

Still working on this, any help would be appreciated.

## Contact

Find me on Twitter [@eneko](https://twitter.com/eneko)

(c) 2021 Eneko Alonso
