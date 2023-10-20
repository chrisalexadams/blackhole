/-  *blackhole
/+  default-agent,  dbug
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  [%0 orderbook]
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
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
  =/  id  (crip (oust [0 180] (trip (scot %ud eny.bowl))))
  ~&  id
  ::=/  target  ~bud
  ::~&  target
  ?-    -.ord
      %buy
    =/  id  `@ux`eny.bowl    ::  generate here?
    ~&  id
    =/  target  ~bud
    ~&  target
    ~&  target.ord
    ~&  ord
        :-  ^-  (list card)
        :~  [%pass /pokes %agent [target.ord %darkpool3] %poke mark !>(ord)]
        ==
    this
  ::
      %sell
    ~&  ord  
        :-  ^-  (list card)
        :~  [%pass /pokes %agent [target.ord %darkpool3] %poke mark !>(ord)]
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