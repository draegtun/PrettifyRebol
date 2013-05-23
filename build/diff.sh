r3="/Users/barry/Local/Rebol/github-r3/make/r3 -qs"
$r3 build-test-html-files.r3
$r3 build-lang-rebol-js.r3
diff test-rebol-sunburst.html ../test-rebol-sunburst.html 
diff test-rebol-Stackoverflow.html ../test-rebol-Stackoverflow.html 
diff test-rebol.html ../test-rebol.html 
diff not-working.html ../not-working.html
diff lang-rebol.js ../lang-rebol.js
