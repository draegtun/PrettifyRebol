[
    'Generic        {this is covered by Generic "lisp" syntax rule}
    port!           none
    symbol!         yes    ;think also covered by Generic
    none!           none
    money!          none
    time!           [PR_LITERAL
                        "/^^\d{1,2}\:\d{1,2}\:\d{1,2}\b/"       ; hh:mm
                        "/^^\d{1,2}\:\d{1,2}\b/"               ; hh:mm
                    ]
    date!           [PR_LITERAL 
                        "/^^\d{1,2}-\w{3,9}-\d{2,4}\b/"     ; dd-MONTH-yyyy (naive regex)
                        "/^^\d{1,2}-\d{1,2}-\d{2,4}\b/"     ; dd-mm-yyyy (naive regex)
                        "/^^\d{1,2}\/\w{3,9}\/\d{2,4}\b/"   ; dd/MONTH/yyyy (naive regex)
                        "/^^\d{1,2}\/\d{1,2}\/\d{2,4}\b/"   ; dd/mm/yyyy (naive regex)
                        ; TODO date/ (time) datezone
                    ]
    char!           none
    pair!           [PR_LITERAL "/^^\d+x\d+\b/"]
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
    decimal!        [PR_LITERAL "/^^\d+(?:\.\d+)\b/"]
    integer!        [PR_LITERAL "/^^\d+\b/"]

    ; also best last to avoid conflicts (in particular time!)
    get-word!       [PR_LITERAL "/^^\:(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/]*)/" ]
    lit-word!       [PR_LITERAL "/^^\'(?:-*(?:\w|\\[\x21-\x7e])(?:[\w-]*|\\[\x21-\x7e])[=!?]?)?/"]
    ; set-word! must come after get-word! & lit-word!
    set-word!       [PR_DECLARATION "/^^(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/]*):/" ]
]


