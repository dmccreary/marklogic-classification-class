xquery version "1.0-ml";

import module namespace plays = "http://marklogic.com/training/plays" at "/modules/plays.xqy";

let $set-comedies :=
    for $t in $plays:COMEDIES
    let $play := /PLAY[TITLE = $t]
    let $play-uri := xdmp:node-uri($play)
    return
        xdmp:document-set-properties($play-uri, <playtype>COMEDY</playtype>)

let $set-histories :=
   for $t in $plays:HISTORIES
      let $play := /PLAY[TITLE = $t]
    let $play-uri := xdmp:node-uri($play)
    return
        xdmp:document-set-properties($play-uri, <playtype>HISTORY</playtype>) 
        
let $set-tragedies :=
   for $t in $plays:TRAGEDIES
      let $play := /PLAY[TITLE = $t]
    let $play-uri := xdmp:node-uri($play)
    return
        xdmp:document-set-properties($play-uri, <playtype>TRAGEDY</playtype>)
        
return
<results>
  <comedies count="{count($plays:COMEDIES)}">
     {for $play in $plays:COMEDIES
      return
         <title>{$play}</title>
     }
  </comedies>
  <histories count="{count($plays:HISTORIES)}">
    {for $play in $plays:HISTORIES
      return
         <title>{$play}</title>
     }
  </histories>
  <tragedies count="{count($plays:TRAGEDIES)}">
  {for $play in $plays:TRAGEDIES
      return
         <title>{$play}</title>
  }
  </tragedies>
</results>