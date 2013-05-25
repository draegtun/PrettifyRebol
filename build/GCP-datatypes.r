
re: func [s] [rejoin ["/^^" s "/"]]   ; little helper for standard grammar regex used

date-re: "\d{1,2}[\-\/](\d{1,2}|\w{3,9})[\-\/]\d{2,4}"  ; naive date! regex

types: compose/deep [
    'Generic        {this is covered by Generic "lisp" syntax rule}
    port!           none
    symbol!         yes    ;think also covered by Generic
    none!           none
    money!          none
    time!           [PR_LITERAL
                        (re "\d{1,2}\:\d{1,2}\:\d{1,2}\b")      ; hh:mm:ss
                        (re "\d{1,2}\:\d{1,2}\b")               ; hh:mm
                    ]
    date!           [PR_LITERAL 
                        (re join date-re "\b")
                        ; TODO date/ (time) datezone - eg: 24-May-2013/16:41:52+1:00
                    ]
    char!           none
    pair!           [PR_LITERAL (re "\d+x\d+\b")]
    event!          none
    tuple!          none
    bitset!         none
    string!         [PR_STRING {/^^\"(?:[^^\"\\]|\\[\s\S])*(?:\"|$)/, null, '"'} ]
    issue!          none
    binary!         none
    file!           none
    email!          none
    url!            none
    tag!            none
    image!          none

    ; at end to avoid any conflicts with other number types (eg. date!)
    number!         yes    ; see integer! decimal! percent! (?)
    decimal!        [PR_LITERAL (re "\d+(?:\.\d+)\b")]
    percent!        [PR_LITERAL (re "(?:[0-9]+)\%")]
    integer!        [PR_LITERAL (re "\d+\b")]

    ; also best last to avoid conflicts (in particular time!)
    get-word!       [PR_LITERAL (re "\:(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/\']*)") ]
    lit-word!       [PR_LITERAL (re "\'(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/\']*)") ]
    ;lit-word!       [PR_LITERAL "/^^\'(?:-*(?:\w|\\[\x21-\x7e])(?:[\w-]*|\\[\x21-\x7e])[=!?]?)?/"]
    ; set-word! must come after get-word! & lit-word!
    set-word!       [PR_DECLARATION (re "(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/\']*):") ]
]


