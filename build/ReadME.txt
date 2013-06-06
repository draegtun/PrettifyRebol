Description from Matlab syntax file:

    PR_PLAIN: plain text
    PR_STRING: string literals
    PR_KEYWORD: keywords
    PR_COMMENT: comments
    PR_TYPE: types
    PR_LITERAL: literal values (1, null, true, ..)
    PR_PUNCTUATION: punctuation string
    PR_SOURCE: embedded source
    PR_DECLARATION: markup declaration such as a DOCTYPE
    PR_TAG: sgml tag
    PR_ATTRIB_NAME: sgml attribute name
    PR_ATTRIB_VALUE: sgml attribute value

  Not sure how correct these are?  

  NB. Also Matlab defines PR_CONSTANT & PR_IDENTIFIER.  
      Only please these are found so not part of GCP spec?



Not used in lang-rebol.js

  // Constants - below blows up when constant is found in markup :(
  [PR['PR_CONSTANT'], /^\b(?:none|true|false|yes|no|on|off)\b/, null],



From prettify.js

  var PR_STRING = 'str';
  var PR_KEYWORD = 'kwd';
  var PR_COMMENT = 'com';
  var PR_TYPE = 'typ';
  var PR_LITERAL = 'lit';
  var PR_PUNCTUATION = 'pun';
  var PR_PLAIN = 'pln';
  var PR_TAG = 'tag';
  var PR_DECLARATION = 'dec';
  var PR_SOURCE = 'src';
  var PR_ATTRIB_NAME = 'atn';
  var PR_ATTRIB_VALUE = 'atv';
  var PR_NOCODE = 'nocode';







.h1 Rebol syntax highlighting using Google Code Prettifer

.h2 History

* Original started with a hack on lang-lisp.js syntax file

* Now completely re-hacked from bottom up

* All syntax grammar (in lang-rebol.js) built from Rebol scripts

*NB. Important - Do not amend lang-rebol.js or any of the HTML files directly.  See build/ReadMe.txt on how to amend and rebuild these :)* 


.h2 What next?

* Let Rebol community have a look

* Then send test patch back to GCP

* And if that all goes well then pester Stackoverflow to update their GCP :)



Story so far:

- Created a lang-rebol.js with only slight amendments to Lisp version

- Multi-line string { } works with caveat must use ^} for embedded closing brace.

- Shebang! line added (as comment)

- set-word: & :get-word with paths like block/1 added

- 'literal (single quote word) added

- Some Types available (see tests.html)

- Only added few "statements" just to show it works! (see test-rebol.html)

- Would like to build "statements" straight from Rebol

- In fact it would be nice to build whole JS file from Rebol!!!

- And may build RegEx grammar up from scratch again and keep it *simple* Rebol

- So at moment just fudging my way around lang-lisp.js & other GCP syntax file
  (No docs... so lots of groping around in dark!)

- See not-working.html for stuff that doesn't work


To test - clone repo and open the test.html files in web browser.

Google Code Prettify - https://code.google.com/p/google-code-prettify/
