# Rebol grammar for Google Code Prettifer

## History

* Original started with a hack on lang-lisp.js syntax file

* Now completely re-hacked from bottom up

* All syntax grammar (in lang-rebol.js) built from Rebol scripts

**NB. Important - Do not amend lang-rebol.js or any of the HTML files directly.  See build/ReadMe.txt on how to amend and rebuild these :)**


## Rules

* All datatypes (defined in build/GCP-datatypes.r) marked as LITERAL (with some exceptions)

* All keywords (defined in build/GCP-keywords.r) marked as KEYWORD (with some exceptions)

* Some naive Regex used to cover some syntax

* All seems to work well for highlighting Rebol code in web pages (see test-?.html for working examples. See not-working.html for known issues)

* See build/Rules.txt for more detailed rules that were applied


## What next?

- [x] Let Rebol community have a look

- []  Then send test patch back to GCP

- []  And if that all goes well then pester Stackoverflow to update their GCP :)


## What to see?

* To test - clone repo and open the test.html files in web browser.

* Or for live test examples: http://draegtun.github.io/PrettifyRebol


## Misc

* Google Code Prettify - https://code.google.com/p/google-code-prettify/

