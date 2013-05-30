Rebol []

;keywords: load %keywords.r2
;append keywords load %keywords.r3
;keywords: unique keywords
;
; Just get rebol3 key(words)
keywords: load %keywords.r3

; remove 1 char function words (GCP KEYWORD doesn't like these)
; NB. GCP grammar as issue with 1 char keywords!
remove-each n keywords [1 = length? to-string n]

; remove words ending in ? (for eg. length?) - Will be covered by generic RE in lang-rebol.js
; NB. GCP grammar as issue with ? in PR_KEYWORD
remove-each n keywords ["?" = back tail to-string n]

; if doesn't start with alpha then assume op and remove
alpha: charset [#"a" - #"z" #"A" - #"Z"]
remove-each n keywords [not parse to-string pick to-string n 1 [alpha]]  ;not parse n/1 alpha]

; any other funnies (to be tested) - eg. and~ or~


; sort on longest (token) first
sort/compare keywords func [a b] [(length? to-string a) > (length? to-string b)]

; output (normally to save as GCP-keywords.r)
probe keywords
