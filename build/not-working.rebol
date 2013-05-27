Rebol []

; below works in rebol! (r2 & r3)
multline-str: {
  start
  Opening { is fine.   Also ^{  and ^}
  But closing } even though balanced does not highlight correctly :(
  end
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Some edge cases happy to live with

literal: [the'end]

ok_filename: %file%20with%20space.txt
bad_filename: %"file with space.txt"
also: %1111.txt  ; allows leading numbers

tuples: [333.333.333 444.444.444.444 555.555.555.555.555] ; only defined 3 & 4 tuples at moment

; below should highlight correctly! (just a highlighting placeholder!)
print "hello world"
