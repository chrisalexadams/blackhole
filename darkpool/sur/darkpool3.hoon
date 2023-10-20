|%
+$  id        @
+$  match  [buy=id sell=id]
+$  target    @p
+$  ticker    @t
+$  order
  $:  =id
      action=?(%buy %sell)
      quantity=@ud
      price=@ud
  ==
::+$  orders    (map =id =order) 
::  
+$  orderbook  
  [=buys =sells]
+$  buys
  $+  buys                 
  (map id $>(%buy order))  
+$  sells  
  $+  sells
  (map id $>(%sell order)) 
--
