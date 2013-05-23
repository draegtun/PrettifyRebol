Rebol []

; below works in rebol! (r2 & r3)
multline-str: {
  start
  Opening { is fine.   Also ^{  and ^}
  But closing } even though balanced does not highlight correctly :(
  end
}

literal: [the'end]

; whats the matter with x?
foo: func [x] [x + x]
bar: func [a] [a + a]

; below should highlight correctly! (just a highlighting placeholder!)
print "hello world"
