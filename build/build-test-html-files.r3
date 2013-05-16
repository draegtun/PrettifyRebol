Rebol [
    ;needs: [lib-build.r3]
]

; load as script for now
do %lib-build.r3

;;;;;;;;;;;;;;;;;;;;;;;;;;
; build html files

write %test-rebol.html fulfil []

write %test-rebol-sunburst.html fulfil [
    'css (rejoin [default-snippets/css newline read-snippet %snippets/sunburst-css.html])
    'genre "Using sunburst CSS"
]

write %test-rebol-Stackoverflow.html fulfil [
    'css        (read-snippet %snippets/Stackoverflow-css.html)
    'pre-code   (read-snippet %snippets/Stackoverflow-pre-code.html)
    'post-code  "</code></pre></div></div>"
    'genre      "Using Stackoverflow CSS"
]

write %not-working.html fulfil [
    'css (rejoin [default-snippets/css newline read-snippet %snippets/sunburst-css.html])
    'example-code  (read-snippet %not-working.rebol)
    'genre "Highlighting not working in lang-rebol.js (using sunburst CSS)"
]

