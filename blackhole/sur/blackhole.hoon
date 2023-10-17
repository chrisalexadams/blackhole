|%
+$  id        @ux           ::  want this generated in the agent
+$  ticker    @t            ::  pull-down list on the FE 
+$  target    @p            ::  want this hard-coded in the agent
+$  quantity  @ud           ::  entered on the FE
+$  value     @ud           ::  price entered on the FE
+$  orders    (list order) 
+$  order
  $%  [%buy =id =ticker =target =quantity =value]
      [%sell =id =ticker =target =quantity =value]
      [%cancel =id]
  ==
--