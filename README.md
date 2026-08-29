## Introduction

This repository is a companion to
[Bonak](https://github.com/artagnon/bonak), the Rocq formalization of
indexed ν-sets with faces and degeneracies. Its purpose is to
document higher-coherence structure associated with the face and
degeneracy laws of ν-sets.

For ν-sets with faces and degeneracies, the familiar coherence laws
say that faces commute with faces, faces commute with degeneracies,
and degeneracies commute with degeneracies. These laws can themselves
be composed in different orders, producing parallel proofs of the same
equality. This is a well-known higher-coherence phenomenon of weak
higher-dimensional structures: once structural laws are represented by
paths rather than strict equations, different composites of those laws
must themselves be related by higher paths.

Bonak works in `HSet`, so these parallel proofs are identified by
`UIP`; in `HGpd` one would need to prove one more level explicitly,
and in unrestricted `Type` this pattern continues as an infinite tower
of higher coherences. This note records the next level of these
coherence equations. It is meant as a guide to the mathematical
content hidden behind the `UIP` calls in Bonak, and to what would have
to be made explicit in a future version of the construction beyond
`HSet`.

# Notation

- Restrictions, i.e. faces, are denoted by `δ`.
- Reflexivities, i.e. degeneracies, are denoted by `ε`.
- Reflexivities "above" and "below" are distinguished by the superscripts `↑` and `↓`.
- The superscript `α`, `β`, `γ` denotes the arity.
- The subscript `q`, `r`, `s` denotes the direction.

# Coherences

```
δ-δ r q γ β (r ≤ q ≤ k):
  δ q β ∘ δ r γ =
  δ r γ ∘ δ q+1 β

δ-ε↓-id r β (r ≤ k):
  id = δ r β ∘ ε↓ r

δ-ε↓-inf r q β (r ≤ q ≤ k):
  ε↓ q  ∘ δ r β =
  δ r β ∘ ε↓ q+1

δ-ε↓-sup r q β (q ≤ r ≤ k):
  ε↓ q    ∘ δ r β =
  δ r+1 β ∘ ε↓ q

δ-ε↑-sup r q β (q ≤ p) (r ≤ k):
  ε↑ q  ∘ δ r β =
  δ r β ∘ ε↑ q

ε↓-ε↓ r q (q ≤ r ≤ k):
  ε↓ q   ∘ ε↓ r =
  ε↓ r+1 ∘ ε↓ q

ε↓-ε↑ r q (q ≤ p) (r ≤ k):
  ε↑ q ∘ ε↓ r =
  ε↓ r ∘ ε↑ q

ε↑-ε↑ r q (q ≤ r ≤ p):
  ε↑ r+1 ∘ ε↑ q =
  ε↑ q   ∘ ε↑ r
```

# Higher coherences

## δ-δ-hex

```
s ≤ r ≤ q ≤ k

δ-δ s r α γ • δ-δ s q α β   • δ-δ r+1 q+1 γ β =[UIP]=
δ-δ r q γ β • δ-δ s q+1 α β • δ-δ s r α γ

δ q β ∘ δ r γ   ∘ δ s α   =[δ-δ s r α γ]=
δ q β ∘ δ s α   ∘ δ r+1 γ =[δ-δ s q α β]=
δ s α ∘ δ q+1 β ∘ δ r+1 γ =[δ-δ r+1 q+1 γ β]=
δ s α ∘ δ r+1 γ ∘ δ q+2 β

δ q β ∘ δ r γ   ∘ δ s α   =[δ-δ r q γ β]=
δ r γ ∘ δ q+1 β ∘ δ s α   =[δ-δ s q+1 α β]=
δ r γ ∘ δ s α   ∘ δ q+2 β =[δ-δ s r α γ]=
δ s α ∘ δ r+1 γ ∘ δ q+2 β
```

## δ-δ-sq

```
t ≤ s ≤ r ≤ q ≤ k

δ-δ t s α ζ • δ-δ r q γ β =[UIP]=
δ-δ r q γ β • δ-δ t s α ζ

δ s ζ ∘ δ t α   ∘ δ q β ∘ δ r γ   =[δ-δ t s α ζ]=
δ t α ∘ δ s+1 ζ ∘ δ q β ∘ δ r γ   =[δ-δ r q γ β]=
δ t α ∘ δ s+1 ζ ∘ δ r γ ∘ δ q+1 β

δ s ζ ∘ δ t α   ∘ δ q β ∘ δ r γ   =[δ-δ r q γ β]=
δ s ζ ∘ δ t α   ∘ δ r γ ∘ δ q+1 β =[δ-δ t s α ζ]=
δ t α ∘ δ s+1 ζ ∘ δ r γ ∘ δ q+1 β
```

## δ-ε↓-id

```
s ≤ r ≤ k

δ-ε↓-id r+1 β =[UIP]=
δ-ε↓-id r β • δ-ε↓-inf s r α • δ-δ s r α β

δ s α =[δ-ε↓-id r+1 β]=
δ s α ∘ δ r+1 β ∘ ε↓ r+1

δ s α =[δ-ε↓-id r β]=
δ r β ∘ ε↓ r    ∘ δ s α   =[δ-ε↓-inf s r α]=
δ r β ∘ δ s α   ∘ ε↓ r+1  =[δ-δ s r α β]=
δ s α ∘ δ r+1 β ∘ ε↓ r+1
```

## δ-ε↓-inf

```
s ≤ r ≤ q ≤ k

δ-δ s r α β    • δ-ε↓-inf s q α   • δ-ε↓-inf r+1 q+1 β =[UIP]=
δ-ε↓-inf r q β • δ-ε↓-inf s q+1 α • δ-δ s r α β

ε↓ q  ∘ δ r β   ∘ δ s α   =[δ-δ s r α β]=
ε↓ q  ∘ δ s α   ∘ δ r+1 β =[δ-ε↓-inf s q α]=
δ s α ∘ ε↓ q+1  ∘ δ r+1 β =[δ-ε↓-inf r+1 q+1 β]=
δ s α ∘ δ r+1 β ∘ ε↓ q+2

ε↓ q  ∘ δ r β   ∘ δ s α   =[δ-ε↓-inf r q β]=
δ r β ∘ ε↓ q+1  ∘ δ s α   =[δ-ε↓-inf s q+1 α]=
δ r β ∘ δ s α   ∘ ε↓ q+2  =[δ-δ s r α β]=
δ s α ∘ δ r+1 β ∘ ε↓ q+2
```

## δ-ε↓-sup

```
s ≤ q ≤ r ≤ k

δ-δ s r α β    • δ-ε↓-inf s q α • δ-ε↓-sup r+1 q+1 β =[UIP]=
δ-ε↓-sup r q β • δ-ε↓-inf s q α • δ-δ s r+1 α β

ε↓ q  ∘ δ r β   ∘ δ s α   =[δ-δ s r α β]=
ε↓ q  ∘ δ s α   ∘ δ r+1 β =[δ-ε↓-inf s q α]=
δ s α ∘ ε↓ q+1  ∘ δ r+1 β =[δ-ε↓-sup r+1 q+1 β]=
δ s α ∘ δ r+2 β ∘ ε↓ q+1

ε↓ q    ∘ δ r β   ∘ δ s α   =[δ-ε↓-sup r q β]=
δ r+1 β ∘ ε↓ q    ∘ δ s α   =[δ-ε↓-inf s q α]=
δ r+1 β ∘ δ s α   ∘ ε↓ q+1  =[δ-δ s r+1 α β]=
δ s α   ∘ δ r+2 β ∘ ε↓ q+1
```

## δ-ε↑-sup (S)

```
q ≤ p, s ≤ r ≤ k

δ-δ s r α β    • δ-ε↑-sup s q α • δ-ε↑-sup r+1 q β =[UIP]=
δ-ε↑-sup r q β • δ-ε↑-sup s q α • δ-δ s r α β

ε↑ q  ∘ δ r β   ∘ δ s α   =[δ-δ s r α β]=
ε↑ q  ∘ δ s α   ∘ δ r+1 β =[δ-ε↑-sup s q α]=
δ s α ∘ ε↑ q    ∘ δ r+1 β =[δ-ε↑-sup r+1 q β]=
δ s α ∘ δ r+1 β ∘ ε↑ q

ε↑ q  ∘ δ r β   ∘ δ s α =[δ-ε↑-sup r q β]=
δ r β ∘ ε↑ q    ∘ δ s α =[δ-ε↑-sup s q α]=
δ r β ∘ δ s α   ∘ ε↑ q  =[δ-δ s r α β]=
δ s α ∘ δ r+1 β ∘ ε↑ q
```

## δ-ε↑-sup (0)

```
s ≤ r ≤ k

δ-ε↓-id s α • δ-ε↓-sup r s β =[UIP]=
δ-ε↓-id s α • δ-δ s r α β

δ r β                   =[δ-ε↓-id s α]=
δ s α ∘ ε↓ s    ∘ δ r β =[δ-ε↓-sup r s β]=
δ s α ∘ δ r+1 β ∘ ε↓ s

δ r β                  =[δ-ε↓-id s α]=
δ r β ∘ δ s α   ∘ ε↓ s =[δ-δ s r α β]=
δ s α ∘ δ r+1 β ∘ ε↓ s
```

## ε↓-ε↓

```
s ≤ q ≤ r ≤ k

δ-ε↓-inf s r α • δ-ε↓-inf s q α • ε↓-ε↓ r+1 q+1 =[UIP]=
ε↓-ε↓ r q      • δ-ε↓-inf s q α • δ-ε↓-inf s r+1 α

ε↓ q  ∘ ε↓ r    ∘ δ s α  =[δ-ε↓-inf s r α]=
ε↓ q  ∘ δ s α   ∘ ε↓ r+1 =[δ-ε↓-inf s q α]=
δ s α ∘ ε↓ q+1  ∘ ε↓ r+1 =[ε↓-ε↓ r+1 q+1]=
δ s α ∘ ε↓ r+2  ∘ ε↓ q+1

ε↓ q   ∘ ε↓ r   ∘ δ s α  =[ε↓-ε↓ r q]=
ε↓ r+1 ∘ ε↓ q   ∘ δ s α  =[δ-ε↓-inf s q α]=
ε↓ r+1 ∘ δ s α  ∘ ε↓ q+1 =[δ-ε↓-inf s r+1 α]=
δ s α  ∘ ε↓ r+2 ∘ ε↓ q+1
```

## ε↓-ε↑ (S)

```
q ≤ p, s ≤ r ≤ k

δ-ε↓-inf s r α • δ-ε↑-sup s q α • ε↓-ε↑ r+1 q =[UIP]=
ε↓-ε↑ r q      • δ-ε↑-sup s q α • δ-ε↓-inf s r α

ε↑ q  ∘ ε↓ r   ∘ δ s α  =[δ-ε↓-inf s r α]=
ε↑ q  ∘ δ s α  ∘ ε↓ r+1 =[δ-ε↑-sup s q α]=
δ s α ∘ ε↑ q   ∘ ε↓ r+1 =[ε↓-ε↑ r+1 q]=
δ s α ∘ ε↓ r+1 ∘ ε↑ q

ε↑ q  ∘ ε↓ r   ∘ δ s α =[ε↓-ε↑ r q]=
ε↓ r  ∘ ε↑ q   ∘ δ s α =[δ-ε↑-sup s q α]=
ε↓ r  ∘ δ s α  ∘ ε↑ q  =[δ-ε↓-inf s r α]=
δ s α ∘ ε↓ r+1 ∘ ε↑ q
```

## ε↓-ε↑ (0)

```
s ≤ r ≤ k

δ-ε↓-id s α • ε↓-ε↓ r s =[UIP]=
δ-ε↓-id s α • δ-ε↓-inf s r α

ε↓ r                  =[δ-ε↓-id s α]=
δ s α ∘ ε↓ s   ∘ ε↓ r =[ε↓-ε↓ r s]=
δ s α ∘ ε↓ r+1 ∘ ε↓ s

ε↓ r                  =[δ-ε↓-id s α]=
ε↓ r  ∘ δ s α  ∘ ε↓ s =[δ-ε↓-inf s r α]=
δ s α ∘ ε↓ r+1 ∘ ε↓ s
```

## ε↑-ε↑ (S)

```
q ≤ r ≤ p, s ≤ k

δ-ε↑-sup s q α • δ-ε↑-sup s r+1 α • ε↑-ε↑ r q =[UIP]=
ε↑-ε↑ r q      • δ-ε↑-sup s r α   • δ-ε↑-sup s q α

ε↑ r+1 ∘ ε↑ q   ∘ δ s α =[δ-ε↑-sup s q α]=
ε↑ r+1 ∘ δ s α  ∘ ε↑ q  =[δ-ε↑-sup s r+1 α]=
δ s α  ∘ ε↑ r+1 ∘ ε↑ q  =[ε↑-ε↑ r q]=
δ s α  ∘ ε↑ q   ∘ ε↑ r

ε↑ r+1 ∘ ε↑ q  ∘ δ s α =[ε↑-ε↑ r q]=
ε↑ q   ∘ ε↑ r  ∘ δ s α =[δ-ε↑-sup s r α]=
ε↑ q   ∘ δ s α ∘ ε↑ r  =[δ-ε↑-sup s q α]=
δ s α  ∘ ε↑ q  ∘ ε↑ r
```

## ε↑-ε↑ (0)

```
r ≤ p, s ≤ k

δ-ε↓-id s α • δ-ε↑-sup s r α • ε↓-ε↑ s r =[UIP]=
δ-ε↓-id s α

ε↑ r                 =[δ-ε↓-id s α]=
ε↑ r  ∘ δ s α ∘ ε↓ s =[δ-ε↑-sup s r α]=
δ s α ∘ ε↑ r  ∘ ε↓ s =[ε↓-ε↑ s r]=
δ s α ∘ ε↓ s  ∘ ε↑ r

ε↑ r =[δ-ε↓-id s α]=
δ s α ∘ ε↓ s ∘ ε↑ r
```
