---
title: "Interactive Proofs and Zero-Knowledge"
header: Interactive Proofs and Zero-Knowledge
date: 2019-2-18 00:00:00 -0400
categories: blog
---

This meeting will be a talk on zero knowledge proofs by the chair of the school of computer science, Dr. Lance Fortnow (also Theory Club's advisor)!

Interactive Proofs and Zero-Knowledge

King Arthur calls his knights to Camelot to talk about the quest. Some of the knights have been fighting and Arthur needs to sit them at the round table so that only knights who are friends sit next to each other. Arthur has a diagram showing which pairs of knights are friendly but can’t come up with a good seating arrangement. So he calls upon his all-powerful wizard Merlin.

If Merlin can find a good seating arrangement he can just show it to Arthur who can check that only friendly knights sit next to each other. But what if there is no possible arrangement? How does Merlin convince Arthur it is impossible to find a good seating?

We will show that, surprisingly, if Arthur can ask Merlin randomly chosen questions, Merlin can convince Arthur that there is no good seating.

If there is a good seating, we show how Merlin can convince Arthur such a seating exists without revealing any information about the seating itself.

We’ll briefly talk about other results if you have multiple Merlins or very long scrolls that Merlin can write to you can prove far more complex problems and how this ties into the limits of approximation algorithms.

For complexity wonks: The seating example is the NP-complete Hamiltonian Cycle problem. The main results are that co-NP problems have interactive proofs and, under some cryptographic assumptions, NP problems have zero-knowledge interactive proofs.
