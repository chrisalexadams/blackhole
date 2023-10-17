# Questions/Blockers

1. Need to hold a `map` of the `orderbook` in `state`, how? I see the structure of the `map` like this:

```r
+$  orderbook  (map =id =order)
```

with `order` structure as:

```r
+$  order
  $%  [%buy id=@ux symbol=@t target=@p quantity=@ud price=@ud]
      [%sell id=@ux symbol=@t target=@p quantity=@ud price=@ud]
      [%cancel id=@ux]
  ==
  ```

  OR

  ```r
  +$  order
    $:  action=?(%buy %sell %cancel)
        id=@ux
        target=@p
        symbol=@t
        quantity=@ud
        price=@ud
  ==
  ```

2. When a new order comes in on the `++on-poke` arm, need to check if a match. Best way? `|-` trap in a `++match` arm? Logic:

   - Does `p(n)=p(0,1,...n-1)`? If yes, does `t(n)!=t(match)`? Then a match.

3. Generate a random number for each order as `id`. Not entering one.
4. Hardcode the `target` to a ship. Not entering one.
5. If a `buy`, check to see if the buyer has enough funds.
6. If a `sell`, check to see if the seller has the asset (symbol).

## Proof

1. The computation of a valid match is what is sent to the `%verifier` agent.
2. The `%verifier` agent will confirm or not the computation and will send that back to the `%darkpool` agent, which would send that back to the trading parties.
3. I need to solve `Questions/Blockers` before this step.
---

# Orderflow
![Alt text](assets/Orderflow.svg)
