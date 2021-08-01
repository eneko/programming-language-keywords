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

#puts names.zip(keyword_counts).to_h #.sort_by { |k, v| v }

names.zip(keyword_counts).each { |name, count|
  puts "#{name}: #{count}"
}
