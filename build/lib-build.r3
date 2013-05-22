Rebol [
    ;exports: ['read-snippet 'make-fulfil]
]

; helper functions
read-snippet: func [file /local string] [
    string: read/string file
    remove back tail string  ; remove trailing newline
    string
]

; template fulfilment object
make-fulfil: func [template-file defaults] [
    make object! [
        template: read/string template-file
        default-snippets: compose defaults

        marker: func [name] [rejoin ["!!!" to-string name "!!!"]]

        fulfil: func [fulfil-with /local fulfilled snippets] [
            fulfilled: copy template
            snippets: copy default-snippets

            ; prep snippets for this fulfilment
            foreach [snip snip-do] compose fulfil-with [snippets/:snip: snip-do]

            ; amend the template
            foreach [snip snip-do] snippets [replace fulfilled marker snip snip-do]

            fulfilled
        ]
    ]
]    

; string buffer object
make-string-buffer: does [
    make object! [
        buffer: copy ""
        indent-with: copy ""

        push: func [string] [
            append buffer indent-with
            append buffer string
            append buffer newline
        ]

        get: does [
            remove back tail buffer
            buffer
        ]
    ]
]
