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
