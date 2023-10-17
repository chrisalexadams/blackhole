|%
+$  id        @ux
+$  target    @p
+$  ticker    @t
+$  quantity  @ud
+$  orders  (list order) 
+$  order
  $%  [%buy =id =ticker =target =quantity value=@ud]
      [%sell =id =ticker =target =quantity value=@ud]
      [%cancel =id]
  ==
::  
+$  orderbook  [=buys =sells]
+$  match  [buy=id sell=id]
+$  buys
  $+  buys
  (map id $>(%buy order))  :: only the %buy case
+$  sells
  $+  sells
  (map id $>(%sell order))  :: only the %sell case
--