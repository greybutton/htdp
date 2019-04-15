(reward 18)
==
(cond
  [(<= 0 18 10) "bronze"]
  [(and (< 10 18) (<= 18 20)) "silver"]
  [else "gold"])
==
(cond
  [#false "bronze"]
  [(and #true (<= 18 20)) "silver"]
  [else "gold"])
==
(cond
  [(and #true #true) "silver"]
  [else "gold"])
==
(cond
  [#true "silver"]
  [else "gold"])
==
"silver"
