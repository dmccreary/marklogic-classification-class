xquery version "1.0-ml";
(:declare namespace cts="http://marklogic.com/cts";:)

let $firsthalf := xdmp:directory("/shakespeare/plays/", "1")[1 to 19]
let $secondhalf := xdmp:directory("/shakespeare/plays/", "1")[21 to 37]
let $classifier :=  doc('/data/classifiers/shakespeare.xml')/cts:classifier

let $secondlabels := for $x in $secondhalf 
        return
        <cts:label>
          <cts:class name="{xdmp:document-properties(xdmp:node-uri($x))//playtype/text()}"/>
        </cts:label>
        
let $classify-second := 
cts:classify($secondhalf, $classifier, 
      <options xmlns="cts:classify"/>,
      $firsthalf)
      
return cts:thresholds($classify-second, $secondlabels)