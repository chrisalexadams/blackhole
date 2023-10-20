# Questions/Blockers

## `darkpool/app/darkpool3.hoon` is the main file

1. When a new order comes in on the `++on-poke` arm of `%darkppol`, need to check if a match. Best way? `|-` trap in a `++match` arm? Logic:

   - Does `p(n)=p(0,1,...n-1)`? If yes, does `t(n)!=t(match)`? Then a match.

2. Generate a random number for each order as `id`.That is sent to `%darkpool` agent
3. Hardcode the `target` or `target.ord` to a ship. Not working correctly


---


## Orderflow
![Alt text](assets/Orderflow.svg)
