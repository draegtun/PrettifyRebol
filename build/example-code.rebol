#!/usr/bin/env rebol -qs

Rebol []

; this is a comment
foo: func [x] [x + x]
duff: "duff"
block: [a b c d :foo! :foo? 'foo! 'foo? duff]
constants: [duff none true false on off yes no duff]
hash-lit: [duff #"c" #{FFFF} duff]
long-str: {
  line 1 - if 1 = 1 [print "hello"]
  line 2 - ^{simple brace^} and ^} ^} So highlighting shouldn't end here
  line 3 - 'one ^() #"X" blah blah
}
print length? long-str  ; end of line comment
the-end: [duff 25-Dec-2012 1-1-12 2/2/2002 31-December-1999 00:00:00 23:59 duff]
series: compose [1 0.1 "one" 'one :foo 10x90 (1 + 1) (foo 10)]
foreach a series [print a]
bar: make object! [a: 1]
block/1: 10
replace/all block 'b 'B
probe reduce [bar block]
comment {
  treat this as multiline comment?
  instead of multiline string?? 
}
print reduce the-end
