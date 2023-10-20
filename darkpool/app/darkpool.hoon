/-  *darkpool
/+  default-agent,  dbug
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  $:  [%0 orderbook values=(list @)]
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
  ?>  ?=(%blackhole-order mark)
  =/  ord  !<(order vase)
  ?-    -.ord
      %buy
    ?:  =(our.bowl target.ord)
    ::=/  id  `@ux`eny.bowl
    ~&  ord
    ::~&  id
      =.  buys  (~(put by buys) id.ord ord)
      `this(values [price.ord values])
    !!
    ::
      %sell
    ?:  =(our.bowl target.ord)
    ~&  ord
      =.  sells  (~(put by sells) id.ord ord)
      `this(values [price.ord values])
    !!
    ==
--
::
++  on-peek  on-peek:default
++  on-arvo  on-arvo:default
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail  on-fail:default
--