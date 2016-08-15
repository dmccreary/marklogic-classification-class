= Classification Class =
I am putting together material to be used to teach a class in document classification and matching.

Much of the material is based on the MarkLogic documenation here:

http://docs.marklogic.com/guide/search-dev/classifier

Right now I am not getting the same threshold results as the examples.  My thresholds are like this:

```xml
<thresholds xmlns="http://marklogic.com/cts">
   <class name="HISTORY" threshold="-1" precision="0.666667" recall="0.4" f="0.5" count="5"/>
   <class name="COMEDY" threshold="-1" precision="0.615385" recall="0.888889" f="0.727273" count="9"/>
   <class name="TRAGEDY" threshold="-1" precision="0.272727" recall="0.75" f="0.4" count="4"/>
</thresholds>
```