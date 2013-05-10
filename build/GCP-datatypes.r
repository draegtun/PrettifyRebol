Rebol []

types: [
    port!           none
    number!         yes    ;see Generic
    symbol!         yes    ;think also covered by Generic
    set-word!       [PR_DECLARATION "/^(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/]*):/" ]
    get-word!       [PR_LITERAL "/^\:(?:[A-Za-z0-9=\-\!\?\_\*\+\.\/]*)/" ]
    lit-word!       none
    none!           none
    integer!        yes    ;see Generic
    decimal!        yes    ;see Generic
    money!          none
    time!           none
    date!           [PR_TYPE "/^\d{1,2}-\w{3,9}-\d{2,4}/" ] ;; Simple 2-Jan-2013 regex for now
    char!           none
    pair!           [PR_TYPE {/^[0-9]*x[0-9]*/}  ]
    event!          none
    tuple!          none
    bitset!         none
    string!         [PR_STRING {/^\"(?:[^\"\\]|\\[\s\S])*(?:\"|$)/, null, '"'} ]
    issue!          none
    binary!         none
    file!           none
    email!          none
    url!            none
    tag!            none
    image!          none
]

Generic: {this is covered by Generic "lisp" syntax rule}

probe types
