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
      ::%blackhole2-order  (cross !<(order vase))
    ==
  [cards this]
  ::  This arm takes in the order(s) from %blackhole and create a map of orders with the id as the key
  ++  book
    |=  ord=order
    ^-  [(list card) _this]
    ?-    -.ord
        %buy
      ~&  ord
      =.  buys  (~(put by buys) id.ord ord)
      `this
    ::
        %sell
      ~&  ord  
      =.  sells  (~(put by sells) id.ord ord)
      `this
    ==
  ::  How do I call this arm from the ++book arm? This is where matching logic will do, for now it's pseudo-code
  ++  cross
    |=  a=@
      +(a)
--      
++  on-peek  on-peek:default  
++  on-arvo  on-arvo:default
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail  on-fail:default
--