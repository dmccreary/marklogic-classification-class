xquery version "1.0-ml";

import module namespace style = "http://marklogic.com/data-hub/style" at "/modules/style.xqy";

let $title := "Dan's Classification Class Demo"

let $content :=
<div class="content">
   <h3>{$title}</h3>
   
   Database: {xdmp:database-name(xdmp:database())}<br/>
   <a href="/views/index.xqy">Views</a> Listing of views.<br/>
   <a href="/scripts/index.xqy">Script</a> Scripts.<br/>
   <a href="view-transform.xqy">View Transform</a><br/>
   <a href="list-canonical-data.xqy">List Output Canonocal Data</a><br/>
   
   <h4>Standard Reports</h4>
   <a href="xray/index.xqy">XRay Unit Tests</a><br/>
   <a href="unit-tests/index.xqy">Individual Unit Tests</a><br/>
</div>

return style:assemble-page($title, $content)