[
    'Generic        {this is covered by Generic "lisp" syntax rule}
    port!           none
    number!         yes    ;see Generic
    symbol!         yes    ;think also covered by Generic
    get-word!       [PR_LITERAL "/^^\:(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/]*)/" ]
    lit-word!       [PR_LITERAL "/^^\'(?:-*(?:\w|\\[\x21-\x7e])(?:[\w-]*|\\[\x21-\x7e])[=!?]?)?/"]
    ; set-word! must come after get-word! & lit-word!
    set-word!       [PR_DECLARATION "/^^(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/]*):/" ]
    none!           none
    integer!        yes    ;see Generic
    decimal!        yes    ;see Generic
    money!          none
    time!           none
    date!           [PR_TYPE "/^^\d{1,2}-\w{3,9}-\d{2,4}/" ] ;; Simple 2-Jan-2013 regex for now
    char!           none
    pair!           [PR_TYPE "/^^[0-9]*x[0-9]*/"]
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
]


