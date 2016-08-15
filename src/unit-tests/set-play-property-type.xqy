xquery version "1.0-ml";
import module namespace plays = "http://marklogic.com/training/plays" at "/modules/plays.xqy";


let $play-uris := cts:uri-match('/shakespeare/plays/*.xml')

let $COMEDIES :=(
"All's Well That Ends Well",
"As You Like It",
"The Comedy of Errors",
"Love's Labour's Lost",
"Measure for Measure",
"The Merchant of Venice",
"The Merry Wives of Windsor",
"A Midsummer Night's Dream",
"Much Ado about Nothing",
"The Taming of the Shrew",
"The Tempest",
"Twelfth Night, or What You Will",
"The Two Gentlemen of Verona",
"The Winter's Tale"
)

let $HISTORIES := (
"The Life of Henry the Fifth",
"The First Part of Henry the Fourth",
"The First Part of Henry the Sixth",
"The History of Troilus and Cressida",
"The Second Part of Henry the Fourth",
"The Second Part of Henry the Sixth",
"The Third Part of Henry the Sixth",
"The Famous History of the Life of Henry the Eighth",
"The Life and Death of King John",
"Pericles, Prince of Tyre",
"The Tragedy of King Richard the Second",
"The Tragedy of Richard  the Third",
"The Life of Timon of Athens"
)

let $TRAGEDIES := (
"The Tragedy of Antony and Cleopatra",
"The Tragedy of Coriolanus",
"Cymbeline",
"The Tragedy of Hamlet, Prince of Denmark",
"The Tragedy of Julius Caesar",
"The Tragedy of King Lear",
"The Tragedy of Macbeth",
"The Tragedy of Othello, the Moor of Venice",
"The Tragedy of Richard the Third",
"The Tragedy of Romeo and Juliet",
"The Life of Timon of Athens",
"The Tragedy of Titus Andronicus",
"The History of Troilus and Cressida"
)

let $ALL := ($COMEDIES, $HISTORIES, $TRAGEDIES)
return
<ol>{
for $title in $ALL
return
if (plays:has-title($title))
  then
     <li>{$title} = <span class="normal">TRUE</span></li>
   else
     <li>{$title} = <span class="text-warn">FALSE</span></li>
}</ol>
(:

for $play-uri in $play-uris
xdmp:document-set-properties("/shakespeare/plays/hamlet.xml", 
      <playtype>TRAGEDY</playtype>):)