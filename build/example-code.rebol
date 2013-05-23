#!/usr/bin/env rebol -qs

Rebol []

; this is a comment
foo: func [x] [x + x]
baz: func ["baz function" x [integer!]] [x + x]
duff: "duff"
block: [a b c d :foo! :foo? :foo/bar/baz 'foo! 'foo? 'foo/bar/baz duff]
constants: [duff none true false on off yes no duff notnone one nope]
hash-lit: [duff #"c" #{FFFF} duff]
long-str: {
  line 1 - if 1 = 1 [print "hello"]
  line 2 - ^{simple brace^} and ^} ^} So highlighting shouldn't end here
  line 3 - 'one ^() #"X" blah blah
}
print length? long-str  ; end of line comment
the-end: [duff 25-Dec-2012 1-1-12 2/2/2002 31-December-1999 00:00:00 23:59 duff]
num!bers: [duff 1 0.1 10x90 99% duff]
series: compose ["one" 'one :foo (1 + 1) (baz 10)]
bar: make object! [a: 1]
block/1: 10
replace/all block 'b 'B
comment {
  treat this as multiline comment?
  instead of multiline string?? 
}
foreach a series [print a] print reduce the-end
