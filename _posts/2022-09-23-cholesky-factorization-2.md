---
title: "Cholesky factorization"
header: Cholesky factorization
date: 2022-09-23 00:00:00 -0400
categories: blog
---

Stephen presented on his research: exploiting the interplay between
statistical inference and numerical linear algebra to derive faster
algorithms for Gaussian elimination/the Cholesky factorization.

An abstract for the talk is as follows:

**Title:** Sparse Cholesky factorization by greedy conditional selection

**Abstract:** Dense kernel matrices resulting from pairwise evaluations of a
kernel function arise naturally in machine learning and statistics. Previous
work in constructing sparse transport maps or sparse approximate inverse
Cholesky factors of such matrices by minimizing Kullback-Leibler divergence
recovers the Vecchia approximation for Gaussian processes. However, these
methods often rely only on geometry to construct the sparsity pattern, ignoring
the conditional effect of adding an entry. In this work, we construct the
sparsity pattern by leveraging a greedy selection algorithm that maximizes
mutual information with target points, conditional on all points previously
selected. For selecting k points out of N, the naive time complexity is O(N
k^4), but by maintaining a partial Cholesky factor we reduce this to O(N k^2).
Furthermore, for multiple (m) targets we achieve a time complexity of O(N
k^2 + N m^2 + m^3) which is maintained in the setting of aggregated Cholesky
factorization where a selected point need not condition every target. We
directly apply the selection algorithm to image classification and recovery
of sparse Cholesky factors. By minimizing Kullback-Leibler divergence, we
apply the algorithm to Cholesky factorization, Gaussian process regression,
and preconditioning with the conjugate gradient, improving over k-nearest
neighbors particularly in high dimensional, unusual, or otherwise messy
geometries with non-isotropic kernel functions.


(hopefully more clear after the talk)

There'll be plenty of time for questions afterwards, and I
might take some time beforehand to familiarize people with
the background so people aren't too lost during the talk.

oh also here's a preview image
![Sodachi Oikura sitting on a upper triangular matrix](
{{ "/files/sodachi2.png" | prepend: site.baseurl }})

The slides may be found
[here]({{ "/files/sodachi2.png" | prepend: site.baseurl }})
and some background material from last year can be found
[here](/2022/cholesky-factorization-1).

