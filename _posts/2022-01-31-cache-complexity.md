---
title: "Cache Complexity"
header: Cache Complexity
date: 2022-01-31 00:00:00 -0400
categories: blog
---

Today Suhas talked about cache complexity.

Some motivation for the topic: all modern computer systems have a substantial
amount of main memory, typically implemented using DRAM. However, main memory
accesses are a severe bottleneck for the performance of any computer system.
An alternative to DRAM (slow and cheap) is SRAM (fast and expensive), but
creating main memory with only SRAM is not cost-effective. Thus, the cache
is an SRAM-based memory system that creates the illusion of fast and cheap
memory.While computer architecture focuses on optimizing cache usage for the
general case, we will discuss how to analyze the cache usage of algorithms and
examine how rewriting algorithms can result in better cache complexities.
