Rebol [
    ;needs: [lib-build.r3]
]

; load as script for now - imports read-snippet & make-fulfil
do %lib-build.r3

; helpers
gcp-grammar-string: func [name regex-string] [
    rejoin ["[PR['" name "'], " regex-string "],"]
]

make-types-string: has [types buf] [
    buf: make-string-buffer
    buf/indent-with: "         "
    buf/push "//"
    buf/push "// Types"

    types: load %GCP-datatypes.r

    ; only need grammar with declared actions (blocks)
    remove-each [type action] types [not block? action]

    foreach [type action] types [
        buf/push join "// -- " to-string type  ; comment

        ; GCP grammar line
        context [
            name:  to-string action/1
            regex: to-string action/2

            buf/push gcp-grammar-string name regex
        ]
    ]

    buf/get
]


;         // -- pair!
;         [PR['PR_TYPE'], /^[0-9]*x[0-9]*/],


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; build lang-rebol.js 

js: make-fulfil %template-lang-rebol.js [
    'types      (make-types-string)
]

write %lang-rebol.js js/fulfil []

;         [PR['PR_TYPE'], /^\d{1,2}-\w{3,9}-\d{2,4}/ ],  // Simple 2-Jan-2013 regex for now

