xquery version "1.0-ml";

import module namespace style = "http://marklogic.com/data-hub/style" at "/modules/style.xqy";

let $title := "List Plays"
let $plays := /PLAY
   

let $content :=
<div class="content">
   <h3>{$title}</h3>
   <ol>
    {for $play in $plays
    let $title := $play/TITLE/text()
    order by $title
    return
    <li>
       <a href="/views/view-play.xqy?uri={xdmp:node-uri($play)}">{$title} - {xdmp:document-properties(xdmp:node-uri($play))//playtype/text()}</a>
    </li>
    }
    </ol>
</div>


return style:assemble-page($title, $content)