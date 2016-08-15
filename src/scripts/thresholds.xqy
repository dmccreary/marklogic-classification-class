xquery version "1.0-ml";

let $firsthalf := xdmp:directory("/shakespeare/plays/", "1")[1 to 19]
let $secondhalf := xdmp:directory("/shakespeare/plays/", "1")[20 to 37]

let $firstlabels := for $x in $firsthalf 
        return
        <cts:label>
          <cts:class name="{xdmp:document-properties(xdmp:node-uri($x))//playtype/text()}"/>
        </cts:label>

let $secondlabels := for $x in $secondhalf 
        return
        <cts:label>
          <cts:class name="{xdmp:document-properties(xdmp:node-uri($x))//playtype/text()}"/>
        </cts:label>

let $classifier :=  
    cts:train($firsthalf, $firstlabels, 
      <options xmlns="cts:train">
        <classifier-type>supports</classifier-type>
      </options>)

let $classifysecond :=
  cts:classify($secondhalf, $classifier, <options xmlns="cts:classify"/>, $firsthalf)
return
cts:thresholds($classifysecond, $secondlabels)