Whats needed?:

- Using lang-lisp.js as starting point (recommended by GCP), create Rebol version

- Send back to GCP as patch with test


Story so far:

- Created a lang-rebol.js with only slight amendments to Lisp version

- Multi-line string { } works with caveat must use ^} for embedded closing brace.

- Shebang! line added (as comment)

- set-word: & get-word: with paths like block/1 added

- 'literal (single quote word) added

- Some Types available (see tests.html)

- Only added few "statements" just to show it works! (see test-rebol.html)

- Would like to build "statements" straight from Rebol

- In fact it would be nice to build whole JS file from Rebol!!!

- And may build RegEx grammar up from scratch again and keep it *simple* Rebol

- So at moment just fudging my way around lang-lisp.js & other GCP syntax file
  (No docs... so it will is groping around)

- Constants need testing

- See not-working.html for stuff that doesn't work


To test - clone repo and open the test.html files in web browser.

Google Code Prettify - https://code.google.com/p/google-code-prettify/
