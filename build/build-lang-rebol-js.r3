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

    ;types: load %GCP-datatypes.r
    types-data: make object! load %GCP-datatypes.r

    ; only need grammar with declared actions (blocks)
    remove-each [type action] types-data/types [not block? action]

    foreach [type action] types-data/types [
        buf/push join "// -- " to-string type  ; comment

        ; GCP grammar line
        context [
            name:  to-string take action  ; GCP rule name
            ; can have multi regex for each rule
            foreach regex action [
                buf/push gcp-grammar-string name to-string regex
            ]
        ]
    ]

    buf/get
]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; build lang-rebol.js 

js: make-fulfil %template-lang-rebol.js [
    'types      (make-types-string)
]

write %lang-rebol.js js/fulfil []

