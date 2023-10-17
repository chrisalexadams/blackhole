/-  *darkpool
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
  ^-  (quip card _this)
  [~ this(state !<(state-0 old))]
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?>  ?=(%darkpool-order mark)
  ::=/  target  (~zod)
  =/  ord  !<(order vase)
  ?-    -.ord
      %buy
    ::  if targeting me, make the change
    ?:  =(our.bowl target.ord)
      `this(values [value.ord values])
    ::  if not targeting me, then send elsewhere
    ?>  =(our.bowl src.bowl)
    :_  this
    [%pass /pokes %agent [target.ord %darkpool] %poke mark vase]~
    ::
      %sell
    ::  if targeting me, make the change
    ?:  =(our.bowl target.ord)
      `this(values ?~(values ~ t.values))
    ::  if not targeting me, then send elsewhere
    ?>  =(our.bowl src.bowl)
    :_  this
    [%pass /pokes %agent [target.ord %darkpool] %poke mark vase]~
    ::
      %cancel
        ::  if targeting me, make the change
    ?:  =(our.bowl target.ord)
      `this(values ?~(values ~ t.values))
    ::  if not targeting me, then send elsewhere
    ?>  =(our.bowl src.bowl)
    :_  this
    [%pass /pokes %agent [target.ord %darkpool] %poke mark vase]~  
==
::
++  on-peek
|=  =path
  ^-  (unit (unit cage))
  ?+  path  (on-peek:default path)
  [%x %values ~]  [~ ~ [%noun !>(values)]]
:: returns the last value with .^(@ %gx /=darkpool=/last/noun) in dojo
  [%x %last ~]  ``noun+!>(?~(values ~ i.values))
==
++  on-arvo  on-arvo:default
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail  on-fail:default
--