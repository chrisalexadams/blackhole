/-  *blackhole
/+  default-agent,  dbug
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  $:  [%0 values=(list @)]
  ==
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  This agent is a FE to enter order info to be sent to %darkpool mock smart contract ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
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
  ^-  [(list card) _this]
  ?>  ?=(%blackhole-order mark)
  =/  ord  !<(order vase)
  ?-    -.ord
      %buy
    :-  ^-  (list card)
        :~  [%pass /pokes %agent [target.ord %blackhole] %poke mark vase]
        ==
    this  
  ::
      %sell
    :-  ^-  (list card)
        :~  [%pass /pokes %agent [target.ord %blackhole] %poke mark vase]
        ==
    this
  ::
      %cancel
    :-
    :~  [%pass /pokes %agent [target.ord %blackhole] %poke mark vase]
    ==
    this
==
::
++  on-peek  on-peek:default
++  on-arvo  on-arvo:default
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail  on-fail:default
--