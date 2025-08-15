# ArXivExplore

#### Headline Image<img width="8" height="17" alt="0h7z4dhzeevua" src="https://github.com/user-attachments/assets/a3ea8e66-4f05-4d0d-a6a2-a75d330c63eb" />

<img width="459" height="269" alt="0trfzzrk4horg" src="https://github.com/user-attachments/assets/0b211bf2-a79b-4852-b3bd-e0082869a463" />


#### Basic Description<img width="8" height="17" alt="0h48vuc1v6z1z" src="https://github.com/user-attachments/assets/2e27ce24-9fed-4424-a8d2-07498dc2b2e6" />

ArXivExplore helps the deep data analysis of all 2.6 million physics, math, cs, etc. articles on ArXiv, providing functionality for e.g. title/abstract word statistics; TeX source/formulae and citations dissection; neural networks for classification, clustering or recommendation; LLM automated concept definitions and author reports.

### Examples<img width="8" height="17" alt="0g5tuqi8k86uo" src="https://github.com/user-attachments/assets/46290353-31b0-4cb0-9663-171d66015bfe" />


#### Basic Examples

The first article ever on ArXiv:

```wl
ArXivIDs[All] // First
```

"physics/9403001"

```wl
In[]:= ArXivVersions["physics/9403001"]
```

```wl
Out[]= {{"version" -> "v1", "created" -> "Fri, 25 Apr 1986 15:39:49 GMT"}}
```

```wl
In[]:= ArXivTitles["physics/9403001"]
```

```wl
Out[]= "Desperately Seeking Superstrings"
```

```wl
In[]:= ArXivAuthors["physics/9403001"]
```

```wl
Out[]= {"Paul Ginsparg", "Sheldon Glashow"}
```

A ![1lsbzz7lyarl4](img/1lsbzz7lyarl4.png) showing the trends in the most popular title words in theoretical physics category ("hep-th", primary or cross-list):

```wl
In[]:= Block[{words = {"black", "gauge", "gravity", "string"}}, 
   ArXivPlot[words, {"hep-th", All}, PlotRange -> Full, PlotLegends -> words]]
```

![05dv5s7h5t6mm](img/05dv5s7h5t6mm.png)

All the 50 most common 2-neighbour title words on the whole ArXiv, ever:

```wl
In[]:= ArXivTopTitles[All, 50, 2] // Normal // Multicolumn[#, 3] &
```

![1aoujzxujkbl8](img/1aoujzxujkbl8.png)

Authors with more than one possible name (and categories) are conveniently registered as "ArXivAuthor" entities. For example:

```wl
In[]:= ArXivAuthorRegister["Vescovi", {"E. Vescovi", "Edoardo Vescovi"}]
```

![1xle9ymtgibyc](img/1xle9ymtgibyc.png)

We can then also easily create an author citations graph, with the tooltip indicating the articles ids:

![0tue5enz2f136](img/0tue5enz2f136.png)

![19tvuxiq9lcch](img/19tvuxiq9lcch.png)
