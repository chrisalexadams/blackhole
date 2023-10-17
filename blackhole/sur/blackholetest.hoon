|%
+$  id      @ux
+$  target  @p
+$  match  [buy=id sell=id]  :: order ids of two orders that match
+$  order
  $:  ord=?(%buy %sell %cancel)
      id=@ux
      target=@p
      symbol=@t
      quantity=@ud
      value=@ud
  ==
+$  orderbook
  $+  orderbook
  (map id order)
--