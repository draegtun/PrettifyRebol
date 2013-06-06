#!/usr/bin/env rebol -qs

Rebol []

; this is a comment
foo: func [x] [x + x]
baz: func ["baz function" x [integer!]] [x + x]
duff: "duff"
block: [a b c d :foo! :foo? :foo/bar/baz 'foo! 'foo? 'foo/bar/baz baz@example.com duff]
constants: [duff none true false on off yes no duff notnone one nope]
hash-lit: [duff #"c" #{899AEFD8} 2#{10010110110010101001011011001011} #111-111-111 #SKU-1000 duff]
files: [duff %file.txt %../blah/ %\reverse\path/ %file%20name.dat duff %/ %-hy.txt %_und.txt]
long-str: {
  line 1 - if 1 = 1 [print "hello"]
  line 2 - ^{simple brace^} and ^} ^} So highlighting shouldn't end here
  line 3 - 'one ^() #"X" blah blah
}
print length? long-str  ; end of line comment
the-end: [duff 25-Dec-2012 1-1-12 2/2/2002 31-December-1999 00:00:00 23:59 24-May-2013/16:41:52+1:00 duff]
num!bers: [duff 1 0.1 10x90 1.1x12,22 99% 1'000.00 1'000'000 1,1 1.1.1 -1 +10.5 -10% 1'000% duff]
money: [duff $100.00 +$100 -GBP$99.99 US$1'000.99 $100,001 duff $foo +$bar]
schemes: [duff http://rebol.com ftp://ftp.ftp.com duff://blahblah duff]
series: compose ["one" 'one :foo (1 + 1) (baz xor~ 5 2)]
bar: make object! [a: 1]
block/1: 10
replace/all block 'b 'B
comment {
  multiline comment
}
print: func [x] [print x] ; check to see if any keyword side-effect with print here
replaceit: func [replace-foo-to] [print [replace-foo-to]]
foreach a series [print a] print reduce the-end
