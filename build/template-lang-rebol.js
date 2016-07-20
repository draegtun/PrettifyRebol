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
 *  - Copyright (C) 2013- (see contributors)
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
 * - rgchris  (Christopher Ross-Gill)
 * 
 * Grammar - http://reb4.me/r/rebol#Value
 *
 * Source - https://github.com/draegtun/PrettifyRebol
 *
 */

(function(){
    var REB = {
        'word!': "lit dt-word",
        'get-word!': "lit dt-get-word",
        'function!': "kwd dt-function",
        'native!': "kwd dt-native",
        'op!': "kwd dt-native",
        'datatype!': "typ dt-datatype",
        'binary!': "str dt-binary",
        'bitset!': "str dt-bitset",
        'char!': "str dt-char",
        'date!': "str dt-date",
        'decimal!': "lit dt-decimal",
        'email!': "str dt-email",
        'file!': "str dt-file",
        'integer!': "lit dt-integer",
        'issue!': "str dt-issue",
        'lit-word!': "lit dt-lit-word",
        'logic!': "lit dt-logic",
        'money!': "lit dt-money",
        'none!': "lit dt-none",
        'number!': "lit dt-integer",
        'pair!': "lit dt-pair",
        'percent!': "lit dt-percent",
        'string!': "str dt-string",
        'tag!': "tag dt-tag",
        'time!': "lit dt-time",
        'tuple!': "lit dt-tuple",
        'url!': "str dt-url",
        'refinement!': "lit dt-refinement",
        'set-word!': "dec dt-set-word",
        'set-path!': "fun dt-set-path",
        'rebol!': "kwd dt-rebol",
        'comment!': "com dt-cmt",
        'literal-block-hack': "opn"
    };

    PR['registerLangHandler'](
        PR['createSimpleLexer'](
            [
             // Rebol block/parens.  Is opn/clo really needed for Rebol?
             ['opn',             /^[\(\[]+/, null, '(['],
             //['opn',             /^#\[/, null, '#['],
             ['clo',             /^[\)\]]+/, null, ')]'],
             //
             // Whitespace
             [PR['PR_PLAIN'],       /^[\t\n\r \xA0]+/, null, '\t\n\r \xA0'],
             //
             // Multi-line string {braces} - allowed within:  { ^{ ^}  
             // [PR['PR_STRING'],      /^\{(?:[^\}\^]|\^[\s\S])*(?:\}|$)/, null, '{}'],
        ],
        [
             [REB['literal-block-hack'], /^#\[/],
    !!!types!!!
             //
             // Above is the Rebol data types grammar.  
             // Punctuation (from lisp)
             [PR['PR_PUNCTUATION'], /^[^\w\t\n\r \xA0()\"\\\';]+/]
            ]),
        ['rebol', 'red']);
})();
