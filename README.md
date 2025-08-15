# ArXivExplore

#### Headline Image<img width="8" height="17" alt="0h7z4dhzeevua" src="https://github.com/user-attachments/assets/a3ea8e66-4f05-4d0d-a6a2-a75d330c63eb" />

<img width="459" height="269" alt="0trfzzrk4horg" src="https://github.com/user-attachments/assets/0b211bf2-a79b-4852-b3bd-e0082869a463" />


#### Basic Description<img width="8" height="17" alt="0h48vuc1v6z1z" src="https://github.com/user-attachments/assets/2e27ce24-9fed-4424-a8d2-07498dc2b2e6" />

ArXivExplore helps the deep data analysis of all 2.6 million physics, math, cs, etc. articles on ArXiv, providing functionality for e.g. title/abstract word statistics; TeX source/formulae and citations dissection; neural networks for classification, clustering or recommendation; LLM automated concept definitions and author reports.

### Examples<img width="8" height="17" alt="0g5tuqi8k86uo" src="https://github.com/user-attachments/assets/46290353-31b0-4cb0-9663-171d66015bfe" />


#### Basic Examples

The first article ever on ArXiv:

```wl
In[]:= ArXivIDs[All] // First
```

```wl
Out[]= "physics/9403001"
```


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

A <img width="67" height="17" alt="1lsbzz7lyarl4" src="https://github.com/user-attachments/assets/d9294929-01ca-43dc-8d81-cc0f34d09879" />
 showing the trends in the most popular title words in theoretical physics category ("hep-th", primary or cross-list):

```wl
In[]:= Block[{words = {"black", "gauge", "gravity", "string"}}, 
   ArXivPlot[words, {"hep-th", All}, PlotRange -> Full, PlotLegends -> words]]
```

<img width="440" height="226" alt="05dv5s7h5t6mm" src="https://github.com/user-attachments/assets/831c99a2-34ae-4cbc-96fa-1b6ebf709a07" />


All the 50 most common 2-neighbour title words on the whole ArXiv, ever:

```wl
In[]:= ArXivTopTitles[All, 50, 2] // Normal // Multicolumn[#, 3] &
```

<img width="642" height="291" alt="1aoujzxujkbl8" src="https://github.com/user-attachments/assets/2c7e8276-9bc9-424d-a14a-0aa0bf9c952d" />


Authors with more than one possible name (and categories) are conveniently registered as "ArXivAuthor" entities. For example:

```wl
In[]:= ArXivAuthorRegister["Vescovi", {"E. Vescovi", "Edoardo Vescovi"}]
```

<img width="54" height="23" alt="1xle9ymtgibyc" src="https://github.com/user-attachments/assets/144d4120-66b9-4267-8f6e-dff7ac1c8338" />


We can then also easily create an author citations graph, with the tooltip indicating the articles ids:



<!--<img width="579" height="24" alt="0tue5enz2f136" src="https://github.com/user-attachments/assets/ec7f673c-fbe9-406d-844f-9d1fd5b7a5a6" />-->

```wl
In[]:= ArXivAuthorGraph[Entity["ArXivAuthor", "Vescovi"], VertexLabels -> Placed[Automatic, Tooltip]]
```




<img width="360" height="404" alt="19tvuxiq9lcch" src="https://github.com/user-attachments/assets/3da063c7-9493-45a9-9b40-8331d69efd7a" />





#### Scope

The dimensions of the whole ArXiv main dataset (at the end of June 2025):

```wl
In[]:= ArXivDataset[All] // Dimensions
```

```wl
Out[]= {2775152, 14}
```

Let us create a super-database with all computer science "cs" type (primary or cross-list) categories:

```wl
In[]:= ArXivDataset[{"cs", All}] = ArXivDatasetAggregate[{"cs", All}] // EchoFunction[Dimensions];
```

```wl
Out[]= {696632, 14}
```

and then let us visualize the most and less frequent title words:

```wl
In[]:= Block[{cat = {"cs", All}, tabs, colrules, tabskey, compl, cut = 160, res = 10}, 
   colrules = {"learning" -> Style["learning", Purple, Bold], "using" -> Style["using", Purple, Bold], "theory" -> Style["theory", Red, Bold], "understanding" -> Style["understanding", Red, Bold]}; 
   tabs = MapAt[Apply[Sequence, #] &, 
      MapIndexed[Partition[Riffle[Map[Style[#, Bold] &, Range[res*(First[#2] - 1) + 1, res*First[#2]]], #], 2] &, Partition[Normal@ArXivTopTitles[cat, cut], UpTo@res]], {All, All,2}] /. colrules; 
   tabskey = Cases[tabs, _List?(MemberQ[#[[All, 2]], Alternatives["theory", "understanding"] /. colrules] &)]; 
   compl = Text[Style["... " <> ToString[Round[First@tabskey[[1, 1, 1]] - 1, 10]] <> "+words morepopular than\"understanding\"or \"theory\"in CS !", Bold, 9, TextAlignment -> Center]]; 
   GraphicsRow[Join[{TextGrid@tabs[[1]], compl}, TextGrid /@ tabskey], ImageSize -> Large]]
```

<img width="576" height="209" alt="00k3mufuabzoz" src="https://github.com/user-attachments/assets/6a6a7a99-06bb-4a46-b110-2b9d6369efe5" />


Let us calculate the 10 most frequent categories, with their meaning and number of articles each:

```wl
In[]:= KeyValueMap[{#1, ArXivCategoriesLegend[#1], #2} &, ArXivTopCategories[10]] // Normal // TableForm
```

|  |  |  |
| - | - | - |
| hep-ph | High Energy Physics - Phenomenology | 134315 |
| quant-ph | Quantum Physics | 113002 |
| cs.CV | Computer Vision and Pattern Recognition | 107036 |
| hep-th | High Energy Physics - Theory | 106818 |
| cs.LG | Machine Learning | 94387 |
| astro-ph | Astrophysics | 94246 |
| gr-qc | General Relativity and Quantum Cosmology | 64940 |
| cond-mat.mes-hall | Mesoscale and Nanoscale Physics | 64255 |
| cond-mat.mtrl-sci | Materials Science | 62135 |
| cs.CL | Computation and Language | 56074 |

We can create train and test sets using only 5000={4500,500} titles and abstracts for each category:

```wl
In[]:= {train10, test10} = ArXivClassifyCategoriesTrainTest[10, 5000];
```

we can train a NN to classify these categories, with layers' dimension 80 and dropout level 0.5:

```wl
In[]:= net10 = ArXivClassifyCategoriesNet[10, 80, 0.5]
```

<img width="303" height="68" alt="14511mlgn9487" src="https://github.com/user-attachments/assets/68072409-1a61-4efa-bf4d-6cd768c4a6fe" />


```wl
In[]:= netTrained10 = NetTrain[net10, train10, All, ValidationSet -> Scaled[0.07], MaxTrainingRounds -> 5]
```

<img width="541" height="456" alt="00mzq6bu6eua8" src="https://github.com/user-attachments/assets/f086cb91-9163-4780-99a3-6ddda47915cf" />


Even with a basic 30 minutes training on laptop CPU, we obtain 89% accuracy:

```wl
In[]:= NetMeasurements[netTrained10["TrainedNet"], test10, "Accuracy"]~PercentForm~2
```

<img width="24" height="17" alt="02wsi35nxqu1g" src="https://github.com/user-attachments/assets/65cccc18-4ffe-438f-b53c-2039808fdd04" />


and a rather clean confusion matrix:

```wl
In[]:= NetMeasurements[netTrained10["TrainedNet"], test10, "ConfusionMatrixPlot"]
```

<img width="311" height="311" alt="1dbrfbhx0gznl" src="https://github.com/user-attachments/assets/c6233c0a-4147-4810-bbef-9803a8cf105a" />


We could even classify authors within the same category, with ArXivClassifyAuthorNet.

Extracting $TEX$ introduction:

```wl
In[]:= ArXivTeXIntroduction[Echo@RandomChoice@ArXivIDs[All]] // Short[#, 10] &
```

```wl
>> "2211.13033"
```

<img width="681" height="405" alt="0jitsl5yh3n0o" src="https://github.com/user-attachments/assets/467be781-b418-45a1-a30e-f524bce80ebe" />


also $TEX$ formulae:

```wl
In[]:= Table[i -> Take[Lookup[#, i], UpTo[50]], {i, Keys[#]}] &@ArXivTeXFormulae[Echo@RandomChoice[ArXivIDs["hep-th"]]] // TabView
```

```wl
>> "2305.12610"
```

<img width="784" height="374" alt="1bugb9ay5b4g9" src="https://github.com/user-attachments/assets/a69cd6ef-e45d-46e1-9cee-553f9531b8e6" />


Explain a technical concept using an article introduction and <img width="81" height="17" alt="0mnjfe6thkyvg" src="https://github.com/user-attachments/assets/e080e967-8021-4a88-9ec4-958502c0398c" />:

```wl
In[]:= ArXivExplainConcept["Viterbi algorithm", "2401.02314", LLMEvaluator -> 
     <|"Prompts" -> "Keep the output contained and emphasize the relation to this paper"|>] // Text
```

<img width="763" height="452" alt="1060eaxqqlb8d" src="https://github.com/user-attachments/assets/1c7edb8e-aa83-41aa-b0cf-f9c6422a6965" />


Let us visualize all authors with more than 7 papers, in primary category "cs.NA":

```wl
In[]:= ArXivTopAuthors["cs.NA", 7] // Column
```

<img width="214" height="144" alt="Screenshot 2025-08-15 alle 16 20 46" src="https://github.com/user-attachments/assets/67fca5ce-f729-4c1d-a207-9b5a80ba3a80" />


Let us pick a random author among them and use LLM functionality to explain his overall work:

```wl
In[]:= ArXivExplainAuthor["Kevin Carlberg", "cs.NA", LLMEvaluator -> <|"Prompts" -> "Keep the output contained"|>] // Text
```

<img width="760" height="1505" alt="03fbo247tbe8m" src="https://github.com/user-attachments/assets/633cb4d7-c2be-460a-93ad-cffb44db9b74" />


### Full Documentation

See the full documentation of all ArXivExplore paclet functions at the [Wolfram Paclet Repository](https://resources.wolframcloud.com/PacletRepository/resources/DanieleGregori/ArXivExplore/).
