Rebol [
    exports: ['read-snippet 'template 'default-snippets 'marker 'fulfil]
]

; functions
read-snippet: func [file /local string] [
    string: read/string file
    remove back tail string  ; remove trailing newline
    string
]

; globals
template: read/string %template.html

; html snippets
default-snippets: compose [
    'example-code   (read-snippet %example-code.r)
    'css            (read-snippet %GCP-svn-css.html) 
    'pre-code       <pre class="prettyprint lang-rebol">
    'post-code      </pre>
]

; helpers
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
