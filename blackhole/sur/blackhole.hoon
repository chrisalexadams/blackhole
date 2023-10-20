|%
:: Our basic types of data
::
+$  cash      @ud
+$  id        @             ::  random generated on the agent
+$  target    @p            ::  hard-coded in agent
+$  ticker    @t            ::  pull-down list on the FE 
+$  quantity  @ud           ::  entered on the FE
+$  price     @ud           ::  price entered on the FE
:: Poke actions
::
+$  order
  $%  [%buy =id =target =ticker =quantity =price]
      [%sell =id =target =ticker =quantity =price]
      ::[%cancel =id =target]
  ==
:: Agent state types
::
+$  orders   (list order)
+$  orderbook  [=buys =sells] 
+$  buys
  $+  buys                 
  (map id $>(%buy order))  
+$  sells  
  $+  sells
  (map id $>(%sell order)) 
--
