xquery version "1.0-ml";

module namespace u = "http://marklogic.com/data-hub/util";
declare namespace ref="http://marklogic.com/metadata-registry/reference-data";

(:
import module namespace u = "http://marklogic.com/data-hub/util" at "/modules/data-hub-util.xqy";
:)

declare function u:remove-empty-elements($element as element()) as element()? {
if ($element/* or $element/text())
  then 
   element {node-name($element)}
      {$element/@*,
          for $child in $element/node()
              return
               if ($child instance of element())
                 then u:remove-empty-elements($child)
                 else $child
      }
    else ()
};

declare function u:unit-tests-status() as element() {
<table class="table table-striped table-bordered table-hover table-condensed">
   <thead>
   </thead>
    <tbody>
        {
        for $uri in cts:uri-match('/unit-tests/*.xqy')
        return
           if ($uri = '/unit-tests/index.xqy')
           then ()
           else
           <tr>
              <td><a href="{$uri}">{$uri}</a></td>
           </tr>
        
        }
    </tbody>
</table>
};

declare function u:list-views() as element() {
<table class="table table-striped table-bordered table-hover table-condensed">
   <thead>
   </thead>
    <tbody>
        {
        for $uri in cts:uri-match('/views/*.xqy')
        return
        if ($uri = '/views/index.xqy')
           then ()
           else
           <tr>
              <td><a href="{$uri}">{$uri}</a></td>
           </tr>
        
        }
    </tbody>
</table>
};


declare function u:directory-index($dir as xs:string) as element() {
let $match := cts:uri-match($dir || '*.xqy')
return
<table class="table table-striped table-bordered table-hover table-condensed">
   <thead>
   </thead>
    <tbody>
        {
        for $uri in $match
        return
           <tr>
              <td><a href="{$uri}">{$uri}</a></td>
           </tr>
        
        }
    </tbody>
</table>
};

declare function u:reference-value-to-label($element-name as xs:string, $value) as xs:string {
let $reference-document := /ref:reference-data[ref:data-element-name=$element-name]
let $label := $reference-document/ref:items/ref:item[ref:value = $value]/ref:label/text()
return
  if ($label)
     then ($label)
     else
       concat('Error: No Value Found for element-name=', $element-name, ' value=', $value)
};
