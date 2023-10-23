|%
+$  id        @
+$  target    @p
+$  ticker    @t
+$  quantity  @ud
+$  price     @ud
+$  order
  $%  [%buy =id =target =ticker =quantity =price]
      [%sell =id =target =ticker =quantity =price]
  ==
::+$  orders    (map =id =order) 
::  
+$  orderbook  
  [=buys =sells]
+$  match  [buy=id sell=id]
+$  buys
  $+  buys                 
  (map id $>(%buy order))  
+$  sells  
  $+  sells
  (map id $>(%sell order))   
--