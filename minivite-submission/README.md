# MiniVite
Sam Ezeh, Freddie

miniVite is an optimised version of vite for research. Vite is described as being an MPI+OpenMP implementation of the Louvain method for graph clustering. miniVite implements the same method but only implements a single phase of the Louvain method. Additionally, no heuristics are implemented for performance.

![Louvain-algorithm-The-Louvain-algorithm-starts-from-a-singleton-partition-in-which-each](https://github.com/Jackaed/UKSCC-Submission/assets/8216039/26a77237-1692-43ac-8875-674c691773f8)
Louvain method

Typical graphs often have nodes naturally segmented into “communities”, the Louvain method is a way of manipulating these graphs so nodes are clustered within their community. “Modularity” is the metric often used to partition the nodes however modularity optimization is an NP-complete problem. (Distributed Louvain Algorithm for Graph Community Detection, 2018). The Louvain method is used for an iterative heuristic for modularity optimisation.

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
