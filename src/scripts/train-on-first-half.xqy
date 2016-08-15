xquery version "1.0-ml";

let $firsthalf := xdmp:directory("/shakespeare/plays/", "1")[1 to 20]
let $labels := for $x in $firsthalf 
       return
       <cts:label name="{xdmp:node-uri($x)}">
         <cts:class name="{xdmp:document-properties(xdmp:node-uri($x))//playtype/text()}"/>
       </cts:label>

let $classifier :=
cts:train($firsthalf, $labels, 
       <options xmlns="cts:train">
         <classifier-type>supports</classifier-type>
       </options>)

let $uri := '/data/classifiers/shakespeare.xml'
let $insert := xdmp:document-insert($uri, $classifier)
return
<results>
   <uri>{$uri}</uri>
   <train>{$classifier}</train>
   <time>{xdmp:elapsed-time()}</time>
</results>
