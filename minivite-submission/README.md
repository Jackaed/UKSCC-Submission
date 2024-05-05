# MiniVite
Sam Ezeh, Freddie

**What is miniVite?**

miniVite is a variant of Vite that only implements the first stage of the Louvain algorithm. Calculating graph modularity is NP-hard and as such, we approximate it using the greedy Louvain algorithm.

miniVite outputs the following values:

**Average total time (seconds)**

The time taken across each node

**Modularity**

Modularity is a metric that is used to partition the nodes.

**Iterations**

Iterations is the number of iterations required to optimise each node.

**MODS**

Modularity * Average total time 

<img src="https://github.com/Jackaed/UKSCC-Submission/assets/8216039/26a77237-1692-43ac-8875-674c691773f8" width="200" >

**Louvain Algorithm**

The Louvain algorithm works by optimising modularity on each node locally and then grouping it into a single node repetitively. These two phases are known as “Modularity Optimization” and “Community Aggregation”. miniVite only performs the first phase of the algorithm which consists of assigning each node in its community. The Louvain algorithm runs in O(n*log(n)). (miniVite: Algorithms - ECP Proxy Applications, 2024)


* Explain optimisations
* Build process writeup
* Describe minivite
* Answer questions from UKSCC assignment

# Results

| File name               | Variant   | Average total time (seconds) | Modularity | Iterations | MODS    |
| ----------------------- | --------- | ---------------------------- | ---------- | ---------- | ------- |
| **soc-Pokec.bin**       | Baseline  | 25.6391                      | 0.642421   | 87         | 16.4711 |
|                         | Optimised | 13.6502                      | 0.642421   | 87         | 8.76918 |
| **com-LiveJournal.bin** | Baseline  | 5.82639                      | 0.65447    | 67         | 3.8132  |
|                         | Optimised | 3.12556                      | 0.65447    | 67         | 2.04559 |
