Rebol [
    ;needs: [lib-build.r3]
]

; load as script for now - imports read-snippet & make-fulfil
do %lib-build.r3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; build html files

html: make-fulfil %template.html [
    'example-code   (read-snippet %example-code.rebol)
    'genre          "Default Google Code Prettify CSS"
    'css            (read-snippet %snippets/GCP-svn-css.html)
    'pre-code       <pre class="prettyprint lang-rebol">
    'post-code      </pre>
]  

write %test-rebol.html html/fulfil []

write %test-rebol-sunburst.html html/fulfil [
    'css    (rejoin [html/default-snippets/css newline read-snippet %snippets/sunburst-css.html])
    'genre  "Using sunburst CSS"
]

write %test-rebol-Stackoverflow.html html/fulfil [
    'css        (read-snippet %snippets/Stackoverflow-css.html)
    'pre-code   (read-snippet %snippets/Stackoverflow-pre-code.html)
    'post-code  "</code></pre></div></div>"
    'genre      "Using Stackoverflow CSS"
]

write %not-working.html html/fulfil [
    'css           (rejoin [html/default-snippets/css newline read-snippet %snippets/sunburst-css.html])
    'example-code  (read-snippet %not-working.rebol)
    'genre         "Highlighting not working in lang-rebol.js (using sunburst CSS)"
]

write %all-keywords.html html/fulfil [
    'genre          "All keywords (with refinements) found in Rebol3"
    'example-code   (
        has [kw code] [
            kw: load %keywords.r3
            code: copy ""
            foreach k kw [append code join to-string k newline]
            code
        ]
    )
]

