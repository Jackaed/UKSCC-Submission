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

**Did any of your changes impact the MODS score? What does this tell you?**
Yes, our optimisations decrease the time spent however the modularity stays the same. As MODS is Modularity * Average total time, the MODS value decreases from 16.4711 to 8.76918 for soc-Pokec.

**What the two input files are, and whether this is compute, memory, or communication bound.**
The two input files are graphs in a special .bin format specifically for Vite. miniVite is memory bound due to the usage of the distributed memory Louvain method implementation.

**How are the two input graphs different?**

File Size

soc-Pokec
1.14GB
com-LiveJournal
~0.50GB


This indicates that soc-Pokec is a larger graph than com-LiveJournal. Both are a representation of social networks. com-LiveJournal is made up of groups that users can join. soc-Pokec is made up of the friendship user links.

**Provide a strong-scaling graph for 1-4 node?**
<img width="361" alt="image222" src="https://github.com/Jackaed/UKSCC-Submission/assets/8216039/f3f8c859-5193-40a5-96cb-314689657415">


* Explain optimisations
* Build process writeup
* Describe minivite
* Answer questions from UKSCC assignment

# Results

| File name       | Variant   | Total time | Modularity | Iterations | MODS    |
| --------------- | --------- | ---------- | ---------- | ---------- | ------- |
| **Live Journal**       | Baseline  | 25.6391    | 0.642421   | 87         | 16.4711 |
|                 | **Optimised** | **13.6502s**    | 0.642421   | 87         | 8.76918 |
| **Pokec** | Baseline  | 5.82639    | 0.65447    | 67         | 3.8132  |
|                 | **Optimised** | **3.12556s**    | 0.65447    | 67         | 2.04559 |
