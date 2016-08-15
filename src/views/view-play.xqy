xquery version "1.0-ml";

import module namespace style = "http://marklogic.com/data-hub/style" at "/modules/style.xqy";

let $title := "View Play"
let $uri := xdmp:get-request-field('uri')
let $play := doc($uri)/PLAY
let $play-title := $play/TITLE/text()

let $content :=
<div class="content">
   <h3>{$title}: {$play-title}</h3>
   <ol>
    {for $act at $count in $play/ACT
    return
       <li><a href="/views/view-act.xqy?uri={$uri}&amp;act={$count}">{$act/TITLE/text()}</a></li>
    }
    </ol>
</div>


return style:assemble-page($title, $content)