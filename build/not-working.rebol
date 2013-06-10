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
bad_filename: %"file with space.txt"   ; probably best as this anyway
also: %1111.txt  ; allows leading numbers

tuples: [333.333.333 444.444.444.444 555.555.555.555.555] ; only defined 3 & 4 tuples at moment

; Decided to make set-word! RE tighter so avoid pollution elsewere
; NB. (though original did seem fine without this check)
bad-setword:[print "must have space before block"] 
good-setword: [print "I'm all good"]


; some keyword issues

print
print["must be space after keyword to highlight it"]
print ["this works fine"]

; and will (nearly) always highlight word as keyword (often useful indicator!)
print: func [replace] [print replace] ; this is all fine (by luck!)
print: func [replace x] [print [replace x]]  ; this time "replace" is hi-lighted as keyword
foo: does [print]
; NB - Keywords will be highlighted as keyword when preceded by whitespace


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; not implemented but may do in future

; see undefined types in GCP-datatypes.r
; utf-8 usage


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; not implemented but happy this way!
; 
; Nothing yet!


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; tag! - Can't do :(
; * GCP doesn't like html tags unless they're esacpe
; * ref: http://stackoverflow.com/questions/7787834/using-google-prettify-to-display-html-and-css-code-do-i-have-to-replace-every


; below should highlight correctly! (just a highlighting placeholder!)
print "hello world"
