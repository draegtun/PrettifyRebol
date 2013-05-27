
re: func [s] [rejoin ["/^^" s "/"]]   ; little helper for standard grammar regex used

date-re: "\d{1,2}[\-\/](\d{1,2}|\w{3,9})[\-\/]\d{2,4}"  ; naive date! regex

string-re: {\"(?:[^^\"\\]|\\[\s\S])*(?:\"|$)}
brace-re:  "\{(?:[^^\}\\]|\\[\s\S])*(?:\}|$)"   ; TODO - could build this from string-re

types: compose/deep [
    port!           none
    symbol!         none   ; not sure what this is?
    none!           none
    money!          [PR_LITERAL
                        (re "\$\d[\d\.\,\']*\b")                   ; naive regex
                        (re "[\+\-\w]{1,4}\$\d[\d\.\,\']*\b")      ; GBP$100.00 +$1,00
                    ]
    time!           [PR_LITERAL
                        (re "\d{1,2}\:\d{1,2}\:\d{1,2}\b")      ; hh:mm:ss
                        (re "\d{1,2}\:\d{1,2}\b")               ; hh:mm
                    ]
    date!           [PR_LITERAL 
                        (re join date-re "\b")
                        ; TODO date/ (time) datezone - eg: 24-May-2013/16:41:52+1:00
                    ]
    char!           [PR_LITERAL (re join "\#" string-re)]
    pair!           [PR_LITERAL (re "\d+x\d+\b")]
    event!          none
    bitset!         none
    string!         [PR_STRING (re string-re)]
    issue!          [PR_LITERAL (re "\#[\w\d\-]+")]    ; covers everything?
    binary!         [PR_LITERAL
                        (re join "\#" brace-re)  ;  any string allowed between #{} braces
                        ; NB. other bases not explictly needed (side effect elsewhere?)
                    ]
    file!           [PR_LITERAL 
                        (re "\%[\.\w\/\-\\]+")  ; simple re %word (expected 1st letter of word)
                        ; TODO must try UNICODE/utf-8 filenames
                    ]
    email!          none
    url!            none
    tag!            none
    image!          none

    ; at end to avoid any conflicts with other number types (eg. date!)
    ; NB. 'thousands (single quote) already works (side effect elsewhere?)
    tuple!          [PR_LITERAL 
                        (re "\d+\.\d+\.\d+\.\d+")   ; 1.1.1.1
                        (re "\d+\.\d+\.\d+")        ; 1.1.1
                    ]
    number!         yes    ; see integer! decimal! percent! (?)
    decimal!        [PR_LITERAL (re "(\+|\-|\d)\d*(?:[\.\,]\d+)\b")] ; includes comma
    percent!        [PR_LITERAL (re "(\+|\-|\d)(?:[\.\,\'\d]*)\%")]    ; naive - 'thou explictly needed
    integer!        [PR_LITERAL (re "(\+|\-|\d)\d*\b")]

    ; also best last to avoid conflicts (in particular time!)
    get-word!       [PR_LITERAL (re "\:(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/\']*)") ]
    lit-word!       [PR_LITERAL (re "\'(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/\']*)") ]
    ;lit-word!       [PR_LITERAL "/^^\'(?:-*(?:\w|\\[\x21-\x7e])(?:[\w-]*|\\[\x21-\x7e])[=!?]?)?/"]
    ; set-word! must come after get-word! & lit-word!
    set-word!       [PR_DECLARATION (re "(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/\']*):") ]
]


