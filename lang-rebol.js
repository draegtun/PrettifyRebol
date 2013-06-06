// Copyright (C) 2008 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/* 
 *  Original Google (Apache) license as-is above 
 *  All addition work comes under this (Apache 2 license)
*/

/**
 * @fileoverview
 * Registers a language handler for Rebol
 *
 * To use, include prettify.js and this file in your HTML page.
 * Then put your code in an HTML tag like
 *      <pre class="prettyprint lang-rebol">(rebol code)</pre>
 *
 * I used lang-lisp.js as the basis and then amended to Rebol
 *
 * "Name"    = 'Rebol'
 * "Author"  = 'Carl Sassenrath'
 * "Version" = 'rebol2|rebol3'
 * "About"   = 'Rebol - Relative Expression Based Object Language'
 *
 * @author draegtun@gmail.com
 *
 */

/**
 * History - https://github.com/draegtun/PrettifyRebol/Changes
 *
 * Contributors
 * - draegtun (Barry Walsh)
 * 
 * Grammar - http://reb4.me/r/rebol#Value
 *
 * Source - https://github.com/draegtun/PrettifyRebol
 *
 */

PR['registerLangHandler'](
    PR['createSimpleLexer'](
        [
         // Rebol block/parens.  Is opn/clo really needed for Rebol?
         ['opn',             /^[\(\[]+/, null, '(['],
         ['clo',             /^[\)\]]+/, null, ')]'],
         //
         // Whitespace
         [PR['PR_PLAIN'],       /^[\t\n\r \xA0]+/, null, '\t\n\r \xA0'],
         //
         // Multi-line string {braces} - allowed within:  { ^{ ^}  
         [PR['PR_STRING'],      /^\{(?:[^\}\^]|\^[\s\S])*(?:\}|$)/, null, '{}'],
        ],
        [
         //
         // Schemes ("Generic" RE) - Must be before get-word! to avoid conflict
         [PR['PR_LITERAL'], /^\w+\:\/\/[\w\d\+\-\.\,\%\/]+\b/],
         //
         // Types
         // -- money!
         [PR['PR_LITERAL'], /^\$\d[\d\.\,\']*\b/],
         [PR['PR_LITERAL'], /^[\+\-\w]{1,4}\$\d[\d\.\,\']*\b/],
         // -- time!
         [PR['PR_LITERAL'], /^\d{1,2}\:\d{1,2}\:\d{1,2}\b/],
         [PR['PR_LITERAL'], /^\d{1,2}\:\d{1,2}\b/],
         // -- date!
         [PR['PR_LITERAL'], /^\d{1,2}[\-\/](\d{1,2}|\w{3,9})[\-\/]\d{2,4}\b/],
         // -- char!
         [PR['PR_LITERAL'], /^\#\"(?:[^\"\\]|\\[\s\S])*(?:\"|$)/],
         // -- pair!
         [PR['PR_LITERAL'], /^\d(?:[\.\,\'\d]*)x\d(?:[\.\,\'\d]*)\b/],
         // -- string!
         [PR['PR_STRING'], /^\"(?:[^\"\\]|\\[\s\S])*(?:\"|$)/],
         // -- issue!
         [PR['PR_LITERAL'], /^\#[\w\d\-]+/],
         // -- binary!
         [PR['PR_LITERAL'], /^\#\{(?:[^\}\\]|\\[\s\S])*(?:\}|$)/],
         // -- file!
         [PR['PR_LITERAL'], /^\%[\.\w\/\-\\]+/],
         // -- email!
         [PR['PR_LITERAL'], /^[\w\d\+\-\.]+\@[\w\d\+\-\.]+\b/],
         // -- tuple!
         [PR['PR_LITERAL'], /^\d+\.\d+\.\d+\.\d+/],
         [PR['PR_LITERAL'], /^\d+\.\d+\.\d+/],
         // -- decimal!
         [PR['PR_LITERAL'], /^(\+|\-|\d)\d*(?:[\.\,]\d+)\b/],
         // -- percent!
         [PR['PR_LITERAL'], /^(\+|\-|\d)(?:[\.\,\'\d]*)\%/],
         // -- integer!
         [PR['PR_LITERAL'], /^(\+|\-|\d)\d*\b/],
         // -- get-word!
         [PR['PR_LITERAL'], /^\:(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/\'\~]*)/],
         // -- lit-word!
         [PR['PR_LITERAL'], /^\'(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/\'\~]*)/],
         // -- set-word!
         [PR['PR_DECLARATION'], /^(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/\'\~]*):/],
         //
         // Above is the Rebol data types grammar.  
         // Below the grammar for type! (declarations)
         [PR['PR_TYPE'],  /^(?:[A-Za-z0-9=\-\?\_\*\+\.\/]*)\!/],
         //
         // Keywords
         [PR['PR_KEYWORD'], /^(?:to\-relative\-file\/as\-local|to\-relative\-file\/as\-rebol|to\-relative\-file\/no\-copy|load\-extension\/dispatch|map\-gob\-offset\/reverse|collect\-words\/ignore|request\-file\/filter|request\-file\/title|collect\-words\/deep|arctangent\/radians|to\-local\-file\/full|round\/half\-ceiling|request\-file\/multi|request\-file\/file|request\-file\/save|arccosine\/radians|collect\-words\/set|decompress\/limit|unprotect\/values|invalid\-utf\?\/utf|to\-relative\-file|minimum\-of\/skip|arcsine\/radians|clean\-path\/only|import\/no\-share|transcode\/error|recycle\/ballast|recycle\/torture|extract\/default|decompress\/part|difference\/case|round\/half\-down|checksum\/method|maximum\-of\/skip|difference\/skip|checksum\/secure|decompress\/gzip|tangent\/radians|unprotect\/words|resolve\/extend|lowercase\/part|construct\/with|load\-extension|unprotect\/deep|transcode\/next|protect\/values|dump\-obj\/match|map\-gob\-offset|clean\-path\/dir|construct\/only|switch\/default|cosine\/radians|transcode\/only|trace\/function|select\/reverse|uppercase\/part|intersect\/skip|intersect\/case|import\/version|import\/no\-user|encode\/options|charset\/length|to\-local\-file|delta\-profile|save\/compress|protect\/words|checksum\/hash|new\-line\/skip|reword\/escape|make\-dir\/deep|stats\/profile|reduce\/no\-set|random\/secure|array\/initial|to\-refinement|to\-rebol\-file|shift\/logical|compress\/part|compress\/gzip|collect\-words|import\/no\-lib|extract\/index|round\/ceiling|checksum\/part|break\/return|collect\/into|compose\/deep|compose\/into|compose\/only|funct\/extern|import\/check|reverse\/part|protect\/deep|confirm\/with|sine\/radians|protect\/hide|checksum\/tcp|write\/append|extract\/into|deline\/lines|sort\/compare|checksum\/key|new\-line\/all|sort\/reverse|exclude\/skip|speed\?\/no\-io|exclude\/case|request\-file|speed\?\/times|decloak\/with|replace\/tail|module\/mixin|encloak\/with|replace\/case|resolve\/only|find\/reverse|select\/skip|save\/length|stack\/depth|save\/header|random\/only|cause\-error|stack\/limit|change\/only|random\/seed|read\/string|recycle\/off|reduce\/into|make\-banner|stats\/evals|unique\/case|change\/part|unique\/skip|stats\/timer|reduce\/only|do\-callback|remold\/flat|do\-commands|load\/header|remold\/only|round\/floor|to\-set\-word|to\-set\-path|remove\-each|assert\/type|remove\/part|limit\-usage|repend\/only|repend\/part|stack\/block|quit\/return|launch\/wait|enbase\/base|launch\/args|square\-root|say\-browser|debase\/base|append\/part|append\/only|resolve\/all|insert\/part|insert\/only|select\/case|select\/last|write\/allow|write\/lines|reword\/into|return\/redo|to\-lit\-path|now\/precise|now\/weekday|now\/yearday|select\/only|select\/part|find\-script|to\-datatype|select\/with|to\-function|to\-get\-path|to\-get\-word|to\-hex\/size|replace\/all|to\-lit\-word|unbind\/deep|copy\/types|boot\-print|split\-path|change\/dup|to\-integer|write\/seek|type\?\/word|query\/mode|split\/into|format\/pad|write\/part|decode\-url|find\/match|decompress|select\/any|stack\/args|funct\/with|try\/except|mkdir\/deep|delect\/all|alter\/case|clean\-path|minimum\-of|to\-decimal|trim\/lines|catch\/quit|catch\/name|read\/lines|to\-command|complement|remold\/all|stack\/func|maximum\-of|open\/allow|to\-closure|append\/dup|delta\-time|set\-scheme|stack\/size|insert\/dup|apply\/only|union\/skip|change\-dir|detab\/size|entab\/size|stack\/word|parse\/case|difference|throw\/name|to\-percent|arctangent|to\-typeset|repend\/dup|stats\/show|union\/case|list\-dir\/d|list\-dir\/f|list\-dir\/i|list\-dir\/l|list\-dir\/r|recycle\/on|round\/down|switch\/all|round\/even|open\/write|trace\/back|loud\-print|trim\/auto|load\/type|take\/part|take\/last|take\/deep|open\/read|open\/seek|lowercase|unprotect|to\-string|find\/with|construct|call\/wait|uppercase|parse\/all|arccosine|intersect|to\-object|to\-vector|to\-bitset|trim\/head|map\-event|bind\/copy|index\?\/xy|read\/seek|now\/month|load\/next|delect\/in|read\/part|values\-of|trim\/tail|what\/args|transcode|trim\/with|bind\/only|find\/case|find\/last|find\/only|find\/part|find\/skip|find\/tail|mold\/flat|mold\/only|remainder|sort\/case|copy\/deep|move\/part|move\/skip|sort\/part|copy\/part|sort\/skip|to\-module|to\-binary|to\-issue|multiply|round\/to|bind\/set|trim\/all|sort\/all|now\/date|mold\/all|bind\/new|map\-each|now\/time|make\-dir|continue|now\/year|save\/all|now\/zone|to\-tuple|subtract|do\-codec|open\/new|ask\/hide|load\/all|load\-gui|list\-env|dump\-obj|new\-line|title\-of|to\-paren|case\/all|to\-block|to\-money|compress|to\-logic|find\-all|wait\/all|find\/any|help\/doc|what\-dir|to\-email|to\-error|checksum|to\-event|function|q\/return|words\-of|to\-image|types\-of|quit\/now|absolute|undirize|list\-dir|foreach|charset|protect|closure|collect|compose|set\-env|pending|recycle|set\/any|set\/pad|seventh|confirm|context|now\/utc|now\/day|body\-of|reflect|move\/to|spec\-of|decloak|default|minimum|maximum|to\-word|to\-time|changes|do\/args|do\/next|tangent|upgrade|license|as\-pair|to\-port|replace|encloak|arcsine|to\-pair|exclude|to\-char|extract|if\/else|wake\-up|to\-date|resolve|get\/any|get\-env|to\-file|forskip|forever|reverse|attempt|to\-path|cosine|return|action|forall|repend|repeat|rename|remove|remold|rejoin|reform|format|reduce|to\-hex|random|to\-gob|fourth|second|secure|select|extend|to\-map|enline|import|printf|encode|append|in\-dir|insert|intern|enbase|create|update|eighth|to\-tag|reword|assert|object|launch|unless|divide|browse|unique|log\-10|dirize|negate|native|source|to\-url|unbind|mold64|switch|change|modulo|first\+|deline|modify|delete|delect|decode|debase|either|module|round|close|clear|dehex|mkdir|check|stack|split|trace|detab|catch|union|log\-e|log\-2|ninth|break|sixth|shift|tenth|third|throw|until|stats|array|apply|usage|input|power|print|probe|about|alter|entab|evoke|q\/now|query|funct|funco|fifth|while|quote|write|ajoin|first|parse|unset|next|form|find|func|save|halt|read|exit|also|head|help|quit|what|and\~|join|last|echo|dump|wait|prin|poke|does|docs|task|pick|load|call|tail|loop|demo|open|swap|ls\/d|ls\/f|ls\/i|ls\/l|ls\/r|trim|make|sine|copy|back|bind|skip|sort|chat|mold|bugs|more|move|case|take|xor\~|pwd|not|now|try|mod|min|max|map|or\~|ask|and|abs|set|add|get|all|for|exp|has|any|xor|use|at|to|if|dt|ds|in|do|or|rm|ls|dp|cd)\s/, null],
         //
         // functions? (ie. ending in question mark)
         [PR['PR_KEYWORD'], /\b\w(?:[A-Za-z0-9=\-\!\_\*\+\.\/\'\~]*)\?/],
         //
         // Constants (as literals! - there is no Constants token in GCP)
         [PR['PR_LITERAL'], /^\b(?:none|true|false|yes|no|on|off)\b/],
         //
         // Multi-line comment
         [PR['PR_COMMENT'],      /^comment\s*\{(?:[^\}\^]|\^[\s\S])*(?:\}|$)/],
         //
         // Script tag (shebang!)
         [PR['PR_COMMENT'], /^#!(?:.*)/],
         //
         // A line comment that starts with ;
         [PR['PR_COMMENT'],     /^;[^\r\n]*/, null, ';']
        ]),
    ['rebol', 'red']);
