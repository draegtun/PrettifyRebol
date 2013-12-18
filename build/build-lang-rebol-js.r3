Rebol [
    ;needs: [lib-build.r3]
]

; load as script for now - imports read-snippet & make-fulfil
do %lib-build.r3

; helpers
gcp-grammar-string: func [name regex-string] [
    rejoin ["[PR['" name "'], " regex-string "],"]
]

reb-grammar-string: func [name [datatype! string!] regex [string!]][
    rejoin ["[REB['" name "'], " regex "],"]
]

make-types-string: has [types buf] [
    buf: make-string-buffer
    buf/indent-with: "         "
    buf/push "//"
    buf/push "// Types"

    ;types: load %GCP-datatypes.r
    types-data: make object! load %GCP-datatypes.r

    ; only need grammar with declared actions (blocks)
    remove-each [type action] types-data/types [not block? action]

    foreach [type action] types-data/types [
        buf/push join "// -- " to-string type  ; comment

        ; GCP grammar line
        context [
            name:  to-string take action  ; GCP rule name
            name: mold type
            ; can have multi regex for each rule
            foreach regex action [
                buf/push reb-grammar-string name to-string regex
            ]
        ]
    ]

    buf/get
]

make-keywords-string: has [keywords buf string] [
    buf: make-string-buffer
    ; buf/indent-with: "         "
    ; buf/push "//"
    ; buf/push "// Keywords"

    ; keywords provided are just funcs + ops (no types!)
    ; Just rebol3 and includes all refinements and excludes all functions? (ending with ?)
    string: copy ""
    keywords: load %GCP-keywords.r

    ; remove all non-escaped words??
    ;remove-each n keywords [not-equal? to-string n re-escape-non-alphanum to-string n]

    foreach kw keywords [append string join re-escape-non-alphanum to-string kw "|"]

    ;buf/push gcp-grammar-string "PR_KEYWORD" "/^^(?:func|print|foreach|make|replace\/all|compose|reduce|comment|probe)\b/, null"
    remove back tail string  ; remove trailing |
    buf/push rejoin ["\b(?:" string ")(?![A-Za-z0-9\-])"]

    ;// Keywords
    ;[PR['PR_KEYWORD'],     /^(?:func|print|foreach|make|replace\/all|compose|reduce|comment|probe)\b/, null],

    buf/get
]




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; build lang-rebol.js 

js: make-fulfil %template-lang-rebol.js [
    'types      (make-types-string)
    ; 'keywords   (make-keywords-string)
]

write %lang-rebol.js js/fulfil []

