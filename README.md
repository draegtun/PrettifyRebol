# Rebol grammar for Google Code Prettifer

## History

* Started with a hack on lang-lisp.js syntax file

* Now completely re-hacked from bottom up

* All syntax grammar (in lang-rebol.js) built from Rebol scripts

## Contributors

* Rebol3 used to build lang-rebol.js (GCP grammar) & HTML files (see build/)

* So do not amend lang-rebol.js or any of the HTML files directly! **Important**  

* See build/ReadMe.txt on how to update and rebuild JS & HTML files


## Rules

* General rule... KISS :)

* All datatypes! (defined in build/GCP-datatypes.r) marked as LITERAL (with some exceptions)

* All keywords (Rebol functions - defined in build/GCP-keywords.r) marked as KEYWORD (with some exceptions)

* Rest of Rebol grammar defined in build/template-lang-rebol.js

* Some naive Regex used to cover some syntax rules

* All seems to work well for highlighting Rebol code in web pages (see test-?.html for working examples. See not-working.html for known issues)

* See build/Rules.txt for more detailed rules that were applied


## What next?

- [x] Let Rebol community have a look

- [x]  Then send test patch back to GCP

- []  And if that all goes well then pester Stackoverflow to update their GCP :)


## What to see?

* To test - clone repo and open the test.html files in web browser.

* Or for live test examples: http://draegtun.github.io/PrettifyRebol


## Misc

* Google Code Prettify - https://code.google.com/p/google-code-prettify/

