/-  *darkpool
/+  default-agent,  dbug
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  $:  [%0 orderbook]
  ==
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  This is the complex agent that manages the orderbook and matching orders ::
::  This agent also pokes the %verifier agent with computation to be proved  ::
::  and sent back to this agent, which in turn will send back the proof to   ::
::  the parties involved with a transaction                                  ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
|_  =bowl:gall
+*  this     .
    default  ~(. (default-agent this %|) bowl)
++  on-init  on-init:default
++  on-save  !>(state)
++  on-load
  |=  old=vase
  ^-  [(list card) _this]
  [~ this(state !<(state-0 old))]
++  on-poke
  |=  [=mark =vase]
  |^  ^-  [(list card) _this]  
  =^  cards  this
    ?+  mark  (on-poke:default mark vase)
      %blackhole-order  (book !<(order vase))
      %blackhole-order  (match !<(order vase))
    ==
  [cards this]
  ::  This arm takes in the order(s) from %blackhole and create a map with id as the key
  ++  book
      |=  ord=order
      ^-  [(list card) _this]
      ?-    -.ord
          %buy
      ?:  =(our.bowl target.ord)
      =/  id  `@ux`eny.bowl
      ~&  ord
      ~&  id
      ~&  orderbook
      =.  buys  (~(put by buys) id.ord ord)
        `this
      !!
    ::
          %sell
      ?:  =(our.bowl target.ord)
      ~&  ord
      =.  sells  (~(put by sells) id.ord ord)
        `this
      !!
  ==
  ::  This arm is to match opposing orders in the map with the same price
  ::  TODO Not working correctly   
  ++  match 
      |=  orderbook
      ^-  (unit match)
      =/  first-buy  (snag 0 buys)
      ~&  first-buy
      |-  ^-  (unit match)
      ?:  =(~ i.sells)
        ~
      =/  curr-sell  i.sells
      ~&  i.sells
      ?:  =(price.first-buy price.curr-sell)
        %-  some
            [id.first-buy id.curr-sell]
        $(sells t.sells)
  --
::
++  on-peek  on-peek:default
++  on-arvo  on-arvo:default
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail  on-fail:default
--