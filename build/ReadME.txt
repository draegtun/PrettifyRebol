The following docs require you to be in ./build subdirectory
(where this ReadME.txt can be found!)

* Rebuild lang-rebol.js and HTML files

  $ r3 build-test-html-files.reb
  $ r3 build-lang-rebol-js.reb

  Where "r3" is your local Rebol3 interpreter (with -qs)

* Check if there are any differences?

  $ sh diff.sh

* And if happy with changes then put live

  $ sh mv.sh      (updates equiv files in level above)



* Other files used in building GCP stuff....

  * GCP-datatypes.r - definition of all Rebol "datatypes"

  * GCP-keywords.r  - all Rebol keywords (functions) we want to declare

  * lib-build.r3 - General library used within scripts

  * create-GCP-keywords.r3 - Build sanitized keyword list (from keywords.r3)
                             (used to create GCP-keywords.r)

  * example-code.rebol - Example code used in test-*.html files

  * not-working.rebol - Rebol code with highlight issues (used in not-working.html)

  * template-lang-rebol.js - Template file used to create lang-reboj.js

  * template.html - Template used for creating all HTML files

  * snippets - Folder cointaining HTML snippets used in build process

  * keywords.r3 - List of ALL function names with refinement variations
                  (created by list-Keywords.r3 and used by create-GCP-keywords.r3)


* Initial build of keyword data

  $ r3 list_keywords.r3 > keywords.r3
  $ r3 create-GCP-keywords.r3 > GCP-keywords.r

  NB. Built with rebol/r3 from Github
