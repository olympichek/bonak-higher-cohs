# Delta-delta permutahedron coherence

This note records the next coherence after the `δ-δ` hexagon from
`README.md`.

The `δ-δ` coherence itself is a 1-dimensional rewrite: it swaps two
adjacent restrictions. The `δ-δ` hexagon is a 2-dimensional coherence for
three restrictions. For four restrictions there are two kinds of
2-dimensional faces:

- hexagons, where three neighboring swaps interact by the braid relation;
- squares, where two independent swaps commute.

The 3-dimensional coherence says that these hexagonal and square faces
fit together as the boundary of the 4-permutahedron.

## Basic 2-coherences

For `s <= r <= q <= k`, write the `δ-δ` hexagon as

```text
δ-δ-hex (s, r, q, α, γ, β) :
  δ-δ r+1 q+1 γ β • δ-δ s q α β   • δ-δ s r α γ =
  δ-δ s r α γ     • δ-δ s q+1 α β • δ-δ r q γ β
```

That is the coherence already represented by `mkCoh2FrameType` in the
groupoid construction, up to the surrounding transports/whiskering needed
by the dependent frame indices.

For `t <= s <= r <= q <= k`, write the square coherence as

```text
δ-δ-sq (t, s, α, ζ; r, q, γ, β) :
  δ-δ r q γ β • δ-δ t s α ζ =
  δ-δ t s α ζ • δ-δ r q γ β
```

This says that the swap of the right pair `(γ, β)` commutes with the swap
of the left pair `(α, ζ)`. In a longer expression both sides may be
whiskered by unchanged `δ-δ` rewrites before and after the square.

## Four deltas

Fix

```text
t <= s <= r <= q <= k
```

and arities

```text
α ζ γ β
```

The starting four-fold restriction is

```text
δ t α ∘ δ s+1 ζ ∘ δ r+2 γ ∘ δ q+3 β
```

and the fully reversed target is

```text
δ q β ∘ δ r γ ∘ δ s ζ ∘ δ t α.
```

Use a word in `1,2,3` to denote a composite of `δ-δ` rewrites:

- `1` swaps the current first and second restrictions;
- `2` swaps the current second and third restrictions;
- `3` swaps the current third and fourth restrictions.

For example, `δδ[321323]` is the path which first moves `β` left, then
moves `γ` left:

```text
δδ[321323] :=
  δ-δ r+2 q+2 γ β •
  δ-δ s+1 q+1 ζ β •
  δ-δ t q α β     •
  δ-δ s+1 r+1 ζ γ •
  δ-δ t r α γ     •
  δ-δ t s α ζ
```

while `δδ[121321]` is another path to the fully reversed target:

```text
δδ[121321] :=
  δ-δ t s α ζ   •
  δ-δ t r+1 α γ •
  δ-δ s r ζ γ   •
  δ-δ t q+2 α β •
  δ-δ s q+1 ζ β •
  δ-δ r q γ β
```

Both are paths from

```text
δ t α ∘ δ s+1 ζ ∘ δ r+2 γ ∘ δ q+3 β
```

to

```text
δ q β ∘ δ r γ ∘ δ s ζ ∘ δ t α.
```

The permutahedron coherence is a 3-cell between two homotopies from
`δδ[321323]` to `δδ[121321]`. Each step below applies either a whiskered
`δ-δ-hex` or a whiskered `δ-δ-sq` to the indicated subword.

## First boundary homotopy

```text
δδ[321323] =[δ-δ-hex on 323 -> 232]=
δδ[321232] =[δ-δ-hex on 212 -> 121]=
δδ[312132] =[δ-δ-sq  on 31  -> 13 ]=
δδ[132132] =[δ-δ-sq  on 13  -> 31 ]=
δδ[132312] =[δ-δ-hex on 323 -> 232]=
δδ[123212] =[δ-δ-hex on 212 -> 121]=
δδ[123121] =[δ-δ-sq  on 31  -> 13 ]=
δδ[121321]
```

This side uses four hexagonal faces and three square faces.

## Expanded first boundary homotopy

Expanding the `δδ[...]` notation, the first boundary homotopy is:

```text
δ-δ r+2 q+2 γ β • δ-δ s+1 q+1 ζ β • δ-δ t q α β   • δ-δ s+1 r+1 ζ γ • δ-δ t r α γ   • δ-δ t s α ζ =[δ-δ-hex(t, s, r, α, ζ, γ)]=
δ-δ r+2 q+2 γ β • δ-δ s+1 q+1 ζ β • δ-δ t q α β   • δ-δ t s α ζ     • δ-δ t r+1 α γ • δ-δ s r ζ γ =[δ-δ-hex(t, s, q, α, ζ, β)]=
δ-δ r+2 q+2 γ β • δ-δ t s α ζ     • δ-δ t q+1 α β • δ-δ s q ζ β     • δ-δ t r+1 α γ • δ-δ s r ζ γ =[δ-δ-sq(r+2, q+2, γ, β; t s α ζ)]=
δ-δ t s α ζ     • δ-δ r+2 q+2 γ β • δ-δ t q+1 α β • δ-δ s q ζ β     • δ-δ t r+1 α γ • δ-δ s r ζ γ =[δ-δ-sq(s q ζ β; t r+1 α γ)]=
δ-δ t s α ζ     • δ-δ r+2 q+2 γ β • δ-δ t q+1 α β • δ-δ t r+1 α γ   • δ-δ s q ζ β   • δ-δ s r ζ γ =[δ-δ-hex(t, r+1, q+1, α, γ, β)]=
δ-δ t s α ζ     • δ-δ t r+1 α γ   • δ-δ t q+2 α β • δ-δ r+1 q+1 γ β • δ-δ s q ζ β   • δ-δ s r ζ γ =[δ-δ-hex(s, r, q, ζ, γ, β)]=
δ-δ t s α ζ     • δ-δ t r+1 α γ   • δ-δ t q+2 α β • δ-δ s r ζ γ     • δ-δ s q+1 ζ β • δ-δ r q γ β =[δ-δ-sq(t, q+2, α, β; s, r, ζ, γ)]=
δ-δ t s α ζ     • δ-δ t r+1 α γ   • δ-δ s r ζ γ   • δ-δ t q+2 α β   • δ-δ s q+1 ζ β • δ-δ r q γ β
```

## Second boundary homotopy

```text
δδ[321323] =[δ-δ-sq  on 13  -> 31 ]=
δδ[323123] =[δ-δ-hex on 323 -> 232]=
δδ[232123] =[δ-δ-hex on 212 -> 121]=
δδ[231213] =[δ-δ-sq  on 31  -> 13 ]=
δδ[213213] =[δ-δ-sq  on 13  -> 31 ]=
δδ[213231] =[δ-δ-hex on 323 -> 232]=
δδ[212321] =[δ-δ-hex on 212 -> 121]=
δδ[121321]
```

This side uses four hexagonal faces and three square faces.

## Expanded second boundary homotopy

Expanding the `δδ[...]` notation, the second boundary homotopy is:

```text
δ-δ r+2 q+2 γ β • δ-δ s+1 q+1 ζ β • δ-δ t q α β     • δ-δ s+1 r+1 ζ γ • δ-δ t r α γ   • δ-δ t s α ζ =[δ-δ-sq(t, q, α, β; s+1, r+1, ζ, γ)]=
δ-δ r+2 q+2 γ β • δ-δ s+1 q+1 ζ β • δ-δ s+1 r+1 ζ γ • δ-δ t q α β     • δ-δ t r α γ   • δ-δ t s α ζ =[δ-δ-hex(s+1, r+1, q+1, ζ, γ, β)]=
δ-δ s+1 r+1 ζ γ • δ-δ s+1 q+2 ζ β • δ-δ r+1 q+1 γ β • δ-δ t q α β     • δ-δ t r α γ   • δ-δ t s α ζ =[δ-δ-hex(t, r, q, α, γ, β)]=
δ-δ s+1 r+1 ζ γ • δ-δ s+1 q+2 ζ β • δ-δ t r α γ     • δ-δ t q+1 α β   • δ-δ r q γ β   • δ-δ t s α ζ =[δ-δ-sq(s+1, q+2, ζ, β; t, r, α, γ)]=
δ-δ s+1 r+1 ζ γ • δ-δ t r α γ     • δ-δ s+1 q+2 ζ β • δ-δ t q+1 α β   • δ-δ r q γ β   • δ-δ t s α ζ =[δ-δ-sq(r, q, γ, β; t, s, α, ζ)]=
δ-δ s+1 r+1 ζ γ • δ-δ t r α γ     • δ-δ s+1 q+2 ζ β • δ-δ t q+1 α β   • δ-δ t s α ζ   • δ-δ r q γ β =[δ-δ-hex(t, s, q+1, α, ζ, β)]=
δ-δ s+1 r+1 ζ γ • δ-δ t r α γ     • δ-δ t s α ζ     • δ-δ t q+2 α β   • δ-δ s q+1 ζ β • δ-δ r q γ β =[δ-δ-hex(t, s, r, α, ζ, γ)]=
δ-δ t s α ζ     • δ-δ t r+1 α γ   • δ-δ s r ζ γ     • δ-δ t q+2 α β   • δ-δ s q+1 ζ β • δ-δ r q γ β
```

## The 3-coherence

The `δ-δ` permutahedron coherence is the equality of the two homotopies above:

```text
δ-δ-perm4 t s r q α ζ γ β :
  (first boundary homotopy from δδ[321323] to δδ[121321]) =
  (second boundary homotopy from δδ[321323] to δδ[121321])
```

```text
δ-δ-perm4 (t, s, r, q, α, ζ, γ, β):
  δ-δ-hex(t, s, r, α, ζ, γ) •
  δ-δ-hex(t, s, q, α, ζ, β) •
  δ-δ-sq(r+2, q+2, γ, β; t s α ζ) •
  δ-δ-sq(s, q, ζ, β; t, r+1, α, γ) •
  δ-δ-hex(t, r+1, q+1, α, γ, β) •
  δ-δ-hex(s, r, q, ζ, γ, β) •
  δ-δ-sq(t, q+2, α, β; s, r, ζ, γ)
    =[UIP]=
  δ-δ-sq(t, q, α, β; s+1, r+1, ζ, γ) •
  δ-δ-hex(s+1, r+1, q+1, ζ, γ, β) •
  δ-δ-hex(t, r, q, α, γ, β) •
  δ-δ-sq(s+1, q+2, ζ, β; t, r, α, γ) •
  δ-δ-sq(r, q, γ, β; t, s, α, ζ) •
  δ-δ-hex(t, s, q+1, α, ζ, β) •
  δ-δ-hex(t, s, r, α, ζ, γ) •
```

Together, the two displayed boundary homotopies use

```text
8 hexagons + 6 squares
```

which are exactly the 2-dimensional faces of the 3-dimensional
permutahedron on four deltas. In the dependent Bonak construction, every
one of these faces must be inserted with the appropriate whiskering by the
unchanged surrounding `δ-δ` rewrites, and with the same transport bookkeeping
that appears in `mkCoh2FrameType`.
