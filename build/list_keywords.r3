Rebol []

my-what: make function! [[
    /local ctx arg keywords
][
    keywords: copy []
    ctx: any [select system/modules :name lib]
    foreach [word val] ctx [
        if any-function? :val [
            ; lets get all (key)words - ie. functions
            append keywords word

            ; all function args
            arg: words-of :val
            clear find arg /local   ; remove /local words

            ; only want /refinements from args
            remove-each n arg [not find/part to-string n "/" 1]
            if not empty? arg [
                ; add each word/refinment to list of (key)words
                foreach r arg [append keywords to-word join word r]
            ]
        ]
    ]

    sort keywords
]]

; output normally to keywords.r3
k: my-what
probe k

