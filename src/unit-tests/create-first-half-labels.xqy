xquery version "1.0-ml";

for $x in xdmp:directory("/shakespeare/plays/", "1")[1 to 19]
let $uri := xdmp:node-uri($x)
let $class-name := xdmp:document-properties($uri)//playtype/text()
return
if ($class-name)
then
<cts:label>
  <cts:class name="{$class-name}"/>
</cts:label>
else
  <error>
     {$uri}
  </error>