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

/* Original Google (Apache) license as-is above */

/**
 * @fileoverview
 * Registers a language handler for Rebol
 *
 *
 * To use, include prettify.js and this file in your HTML page.
 * Then put your code in an HTML tag like
 *      <pre class="prettyprint lang-rebol">(rebol code)</pre>
 *
 * I used http://www.devincook.com/goldparser/doc/meta-language/grammar-LISP.htm
 * as the basis, but added line comments that start with ; and changed the atom
 * production to disallow unquoted semicolons.
 *
 * "Name"    = 'Rebol'
 * "Author"  = 'Carl Sassenrath'
 * "Version" = 'Minimal'
 * "About"   = 'Rebol - Relative Expression Based Object Language'
 *
 * ?? Is there a grammar/spec can refer to ??
 *
 * @author draegtun@gmail.com
 *
 * History
 *  0.0.1 - Barry Walsh (Draegtun) - big bang!
 *
 * Source - github page
 *
 */

PR['registerLangHandler'](
    PR['createSimpleLexer'](
        [
         ['opn',             /^\[+/, null, '['],
         ['clo',             /^\]+/, null, ']'],
         // A line comment that starts with ;
         [PR['PR_COMMENT'],     /^;[^\r\n]*/, null, ';'],
         // Whitespace
         [PR['PR_PLAIN'],       /^[\t\n\r \xA0]+/, null, '\t\n\r \xA0'],
         // A double quoted, possibly multi-line, string.
         [PR['PR_STRING'],      /^\"(?:[^\"\\]|\\[\s\S])*(?:\"|$)/, null, '"'],
         [PR['PR_STRING'],      /^\{(?:[^\}\\]|\\[\s\S])*(?:\}|$)/, null, '{}']
        ],
        [
         [PR['PR_KEYWORD'],     /^(?:func|print|foreach)\b/, null],
         [PR['PR_LITERAL'],
          /^[+\-]?(?:[0#]x[0-9a-f]+|\d+\/\d+|(?:\.\d+|\d+(?:\.\d*)?)(?:[ed][+\-]?\d+)?)/i],
         // A single quote possibly followed by a word that optionally ends with
         // = ! or ?.
         [PR['PR_LITERAL'],
          /^\'(?:-*(?:\w|\\[\x21-\x7e])(?:[\w-]*|\\[\x21-\x7e])[=!?]?)?/],
         // A word that optionally ends with = ! or ?.
         [PR['PR_PLAIN'],
          /^-*(?:[a-z_]|\\[\x21-\x7e])(?:[\w-]*|\\[\x21-\x7e])[=!?]?/i],
         // A printable non-space non-special character
         [PR['PR_PUNCTUATION'], /^[^\w\t\n\r \xA0()\"\\\';]+/]
        ]),
    ['rebol']);
