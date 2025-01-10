(* ::Package:: *)

(* ::Section:: *)
(*0. Package Header*)


NotebookDirectory[]


(* ::Subsection:: *)
(*Begin Package*)


BeginPackage["DanieleGregori`ArXivExplore`"];


(*BeginPackage["My`ArXivExplore`"];*)


(* ::Subsection::Closed:: *)
(*Main database*)


ArXivDataset::usage = "ArXivDataset[All] returns the whole ArXiv dataset cleaned and ordered by date of first version;
						ArXivDataset[cat] returns only the dataset for a specified primary category 'cat';
						ArXivDataset[[cat,All}] returns the dataset of all articles sharing (as primary or as cross-list) the cateory 'cat'.";
						(*Notice: in the present version all datasets are updated up to June 2024.*)
						


ArXivDatasetLookup::usage = 
"ArXivDatasetLookup[key] returns all the specified values for the key 'key' of the whole ArXiv dataset;
ArXivDatasetLookup[key,subdataset_List] returns all the specified keys of a certain subdataset;
ArXivDatasetLookup[key,cat_String] returns all the specified keys of a the specified primary category 'cat';
ArXivDatasetLookup[key,{cat_String,All}] returns all the specified keys of a the specified primary or cross-list category 'cat'";


ArXivDatasetAggregate::usage = 
"ArXivDatasetAggregate[prefix_String] aggregates all primary categories with a given prefix;
ArXivDatasetAggregate[{prefix_String,All}] aggregates all primary or cross-list categories with a given prefix.";


ArXivDatasetSubset::usage =
"ArXivDatasetSubset[idL_List] allow to create a custom dataset with the given article id list 'idL'.";


arXivDatasetKeys::usage = "arXivDatasetKeys returns all possible database keys";


(* ::Subsection::Closed:: *)
(*Categories*)


ArXivCategories::usage = 
"ArXivCategories[id] returns all the categories of a given id, searching in the whole ArXiv dataset;
ArXivCategories[id,cat] returns all the categories of a given id, from the ArXiv subdataset of the given category;
ArXivCategories[All,cat] returns all categories of a given category 'cat', associated with their id.";


ArXivCategoriesPrimary::usage = 
"ArXivCategoriesPrimary[id] returns all primary categories of a given id, searching in the whole ArXiv dataset;
ArXivCategoriesPrimary[id,cat] returns all primary categories of a given id, from the ArXiv subdataset of the given category;
ArXivCategoriesPrimary[All,cat] returns all primary categories of a given category 'cat', associated with their id.";


ArXivTopCategories::usage = 
"ArXivTopCategories[All] returns the ranking of all primary categories, in terms of their corresponding total articles;
ArXivTopCategories[cut] returns only the first 'cut' most frequent primary categories, with the number of corresponding articles.";


ArXivCategoriesLegend::usage = "ArXivCategoriesLegend[cat_String] associates each primary category name with its fulldescription.";


arXivCategoriesUnion::usage = "arXivCategoriesUnion returns all possible categories";


(*arXivCategoriesAssoc;*)


(* ::Subsection::Closed:: *)
(*T EX scraping*)


ArXivTeXDocument::usage = "ArXivTeXDocument[id] scrapes the TeX document of a given article id.";


ArXivTeXSections::usage = "ArXivTeXSections[id] scrapes from the TeX source the sections of a given article id.";


ArXivTeXIntroduction::usage = "ArXivTeXIntroduction[id] scrapes from the TeX source the introduction section of a given article id.";


arXivTeXIntroductionListClean;


arXivTeXIntroductionList;


ArXivTeXPreamble::usage =
"ArXivTeXPreamble[id] scrapes TeX preamble of a given article id.";


(*arXivTeX must still improve*)
arXivTeX::usage =
"arXivTeX[id] scrapes TeX source of a given article id.";


(*arXivTeXBeginEnd;*)


(*arXivTeXPartVisualize;*)


ArXivTeXFormulae::usage = 
"ArXivTeXFormulae[tex] scrapes from source TeX 'tex' all formulae and returns an association with each type;
ArXivTeXFormulae[tex,key] scrapes from source TeX 'tex' the formulae only of a given type 'key'.";


(* ::Subsection::Closed:: *)
(*Citations*)


ArXivCitationsTotal::usage = 
"ArXivCitationsTotal[id_String] returns the total citations of a given article id;
ArXivCitationsTotal[idL_List] returns the total citations of a each article of the id list 'idL'.";


ArXivCitations::usage = 
"ArXivCitations[id_String] returns all ids of articles citing a given article id;
ArXivCitations[idL_List] returns all ids of articles citing each article of the id list 'idL'.";


ArXivCitationsAuthor::usage = 
"ArXivCitationsAuthor[author_Entity] returns all pairs of ids of which the first is an article of a given author entity - on all ArXiv - and the last is another paper that cites it;
ArXivCitationsAuthor[author_String] returns all pairs of ids of which the first is an article of a given author - on all ArXiv - and the last is another paper that cites it;
ArXivCitationsAuthor[author_String,cat] returns all pairs of ids of which the first is an article of a given author - in category 'cat' - and the last is another paper that cites it;
ArXivCitationsAuthor[authorL_List,cat] returns all pairs of ids of which the first is an article of a given list of authors 'authorL' - in category 'cat' - and the last is another paper that cites it;
ArXivCitationsAuthor[authorL_List,catL_List] returns all pairs of ids of which the first is an article of a given the two lists 'doubleL' - the first made of author names and the second of corresponding categories - and the last is another paper that cites it.";


ArXivGraphAuthor::usage = 
"ArXivGraphAuthor[author_Entity] returns a citation graph of a given author registered entity;
ArXivGraphAuthor[author_String,cat_] returns a citation graph of a given author in a given category 'cat';
ArXivGraphAuthor[authorL_List,cat_] returns a citation graph of a given author list 'authorL' in a given category 'cat';
ArXivGraphAuthor[authorL_List,catL_List] returns a citation graph of a given the two lists 'doubleL' - the first made of author names and the second of corresponding categories.";


ArXivGraph::usage = 
"ArXivGraph[id_String] returns a citation graph of the given article id;
ArXivGraph[idL_List] returns a citation graph of the given article id list 'idL'.";


(*to make iterative:
ArXivGraph[idL_List,n_Integer] returns a citation graph of the given article id list 'idL', iterated 'n' times.*)


(* ::Subsection:: *)
(*Main data*)


(* ::Subsubsection::Closed:: *)
(*Articles*)


ArXivArticles::usage = "ArXivArticles[id] returns all article dataset items of a given article id or list of ids.";


(* ::Subsubsection::Closed:: *)
(*IDs*)


ArXivIDs::usage = 
"ArXivIDs[All] returns all article ids on ArXiv;
ArXivIDs[cat_String] returns all article ids of a given primary category 'cat' on ArXiv;
ArXivIDs[{cat_String,All}] returns all article ids of a given primary or cross-list category 'cat' on ArXiv.";


(* ::Subsubsection::Closed:: *)
(*Titles*)


ArXivTitles::usage = 
"ArXivTitles[id] returns all the titles of a given article id;
ArXivTitles[All,cat] returns all titles of a given category 'cat', associated with their id.";


(* ::Subsubsection::Closed:: *)
(*Abstracts*)


ArXivAbstracts::usage = 
"ArXivAbstracts[id] returns all the abstracts of a given article id;
ArXivAbstracts[All,cat] returns all abstracts of a given category 'cat', associated with their id.";


(* ::Subsubsection::Closed:: *)
(*Versions*)


ArXivVersions::usage = 
"ArXivVersions[id] returns all the versions of a given article id, searching in the whole ArXiv dataset;
ArXivVersions[All] returns all versions on all ArXiv, associated with their id;
ArXivVersions[id,cat] returns all the versions of a given article id, from the ArXiv subdataset of the given category;
ArXivVersions[All,cat] returns all versions of a given category 'cat', associated with their id.";


(*arXivVersionsID::usage=
"arXivVersionsID[All] returns all versions on all ArXiv, associated with their id;
arXivVersionsID[cat] returns all versions of a given category 'cat', associated with their id.";*)


arXivVersionsFirstID::usage = 
"arXivVersionsFirstID[All] returns all first versions dates on all ArXiv, associated with their id;
arXivVersionsFirstID[cat] returns all first versions dates of a given category 'cat', associated with their id.";


ArXivDates::usage =
"ArXivDates[All] returns all first versions dates on all ArXiv, associated with their id;
ArXivDates[cat] returns all first versions dates on all ArXiv, associated with their id;
ArXivDates[All,cat,int] returns an association between all article ids of a given category 'cat' and their dates in time resolution 'int'.";


(*ArXivVersions::usage = "ArXivVersions[category] returns all article versions of a given primary category.";*)


(*ArXivVersionFirstDate::usage = "ArXivVersionFirstDate[idmcategory] returns the first article versions of a given id in a given primary category.";*)


(* ::Subsubsection::Closed:: *)
(*Authors*)


(*double author list to fix*)


ArXivAuthors::usage = 
"ArXivAuthors[id] returns the authors (appropriately cleaned) of a given article id, searching on all ArXiv;
ArXivAuthors[id,cat] returns the authors (appropriately cleaned) of a given article id, searching only in the category 'cat';
ArXivAuthors[All,cat] returns all authors (appropriately cleaned) of a given category.";


ArXivTopAuthors::usage = 
"ArXivTopAuthors[All,n] returns all most prolific authors on all ArXiv, with more than 'n' papers;
ArXivTopAuthors[cat,n] returns all most prolific authors in a given category 'cat', with more than 'n' papers.";


ArXivArticlesAuthor::usage = 
"ArXivArticlesAuthor[author_Entity] returns all articles of a given author, as registered entity;
ArXivArticlesAuthor[author_String] returns all articles of a given author, searching on all ArXiv;
ArXivArticlesAuthor[author_String,cat] returns all articles of a given author, searching only in a given category 'cat';
ArXivArticlesAuthor[authorL_List,cat] returns all articles of a given author, with possible names given as a list 'authorL', searching only in a given category 'cat';
ArXivArticlesAuthor[author_String,cat] returns all articles of a given author searching in all categories of the list 'catL';
ArXivArticlesAuthor[authorL_List,catL_List] returns all articles of a given author, with possible names given as a list 'authorL', searching in each category of the list 'catL'.";


ArXivRegisterAuthor::usage =
"ArXivRegisterAuthor[author,authorS_String,cat] registers a single entity with label 'author' for author 'authorS' in category 'cat';
ArXivRegisterAuthor[author,authorL_List,cat] registers a single entity with label 'author' from list 'authorL' of author names in category 'cat';
ArXivRegisterAuthor[author,authorL_List,catL_List] registers a single entity with label 'author' from list 'authorL' of author names in categories 'catL'.";


(* ::Subsection:: *)
(*Word statistics*)


(* ::Subsubsection::Closed:: *)
(*Total*)


(*to improve*)


ArXivArticlesTrend::usage =
"ArXivArticlesTrend[cat,int] returns an association with the total new articles submissions in the category 'cat' for each time period of resolution 'int'.";


(*ArXivArticlesCount::usage = 
"ArXivArticlesCount[All,int] returns a TimeSeries of a given resolution 'int', counting all new articles submissions on all ArXiv;
ArXivArticlesCount[cat,int] returns a TimeSeries of a given resolution 'int', counting all new articles submissions in the category 'cat'.";*)


(* ::Subsubsection::Closed:: *)
(*Cleaned titles/abstracts*)


arXivTitlesCleanID::usage =
"arXivTitlesCleanID[cat] returns an association between all cleaned titles in a given category 'cat' associated and their respective ids.";
arXivTitlesCleanDated::usage =
"arXivTitlesCleanDated[cat,int] returns an association between all cleaned titles in a given category 'cat' associated and their respective dates.";


arXivAbstractsCleanID::usage =
"arXivAbstractsCleanID[cat] returns an association between all cleaned abstracts in a given category 'cat' associated and their respective ids.";
arXivAbstractsCleanDated::usage =
"arXivAbstractsCleanDated[cat,int] returns an association between all cleaned abstracts in a given category 'cat' associated and their respective dates.";


(* ::Subsubsection::Closed:: *)
(*Single words*)


arXivTitlesWordID::usage =
"arXivTitlesWordID[cat_,word_String] returns all cleaned titles in which a 'word' appears, associated with their article ids";
arXivAbstractsWordID::usage =
"arXivAbstractsWordID[cat_,word_String] returns all cleaned abstracts in which a 'word' appears, associated with their article ids";


arXivTitlesWordDated::usage =
"arXivTitlesWordDated[cat_,word_String] returns all cleaned titles in which a 'word' appears, associated with their dates";
arXivAbstractsWordDated::usage =
"arXivAbstractsWordDated[cat_,word_String] returns all cleaned abstracts in which a 'word' appears, associated with their dates";


arXivTitlesWordTrend::usage=
"arXivTitlesWordTrend[cat,word_String,int_:\"Month\"] returns all total title words 'word', associated with their dates of time resolutions 'int'.";
arXivAbstractsWordTrend::usage=
"arXivAbstractsWordTrend[cat,word_String,int_:\"Month\"] returns all total abstract words 'word', associated with their dates of time resolutions 'int'.";


(* ::Subsubsection::Closed:: *)
(*Neighbour words*)


arXivTitlesWordNeighboursID::usage =
"arXivTitlesWordNeighboursID[cat,n_Integer:2] returns all 'n'-neighbour words in cleaned titles of a given category 'cat', as an association with their ids;
arXivTitlesWordNeighboursID[cat,wordNeigh_String] returns all cleaned titles where the word neighbour combination 'wordNeigh' appears, in a given category 'cat', as an association with their ids.";
arXivTitlesWordNeighboursDated::usage=
"arXivTitlesWordNeighboursDated[cat,n_Integer,int_:\"Month\"] returns all 'n'-neighbour words in cleaned titles of a given category 'cat', as an association with its date strings of resolution 'int'.";
arXivTitlesWordNeighboursTop::usage=
"arXivTitlesWordNeighboursTop[cat,n_Integer:2,cut_Integer] returns all most frequent ever 'n'-neighbour words in cleaned titles of a given category 'cat', up to a cut-off 'cut'.";


arXivAbstractsWordNeighboursID::usage =
"arXivAbstractsWordNeighboursID[cat,n_Integer:2] returns all 'n'-neighbour words in cleaned abstracts of a given category 'cat', as an association with their ids.";
arXivAbstractsWordNeighboursDated::usage=
"arXivAbstractsWordNeighboursDated[cat,n_Integer,int_:\"Month\"] returns all 'n'-neighbour words in cleaned abstracts of a given category 'cat', as an association with its dates of resolution 'int'.";
arXivAbstractsWordNeighboursTop::usage=
"arXivAbstractsWordNeighboursTop[cat,n_Integer:2,cut_Integer:100] returns all most frequent ever 'n'-neighbour words in cleaned abstracts of a given category 'cat', up to a cut-off 'cut'.";


arXivTitlesWordNeighboursTrend::usage =
"arXivTitlesWordNeighboursTrend[cat,n_Integer:2,cut_Integer:10000,int_:\"Month\"] returns all most frequent 'n'-neighbour words in cleaned titles of a given category 'cat', as an association with its dates of resolution 'int', up to a cut-off 'cut';
arXivTitlesWordNeighboursTrend[cat,wordNeigh_String,cut_Integer:10000,int:\"Month\"] returns all total occurences of neighbour words 'wordNeigh' in titles of a given category 'cat', as an association with its dates of resolution 'int', using a cut-off 'cut'.";

arXivAbstractsWordNeighboursTrend::usage =
"arXivAbstractsWordNeighboursTrend[cat,n_Integer:2,cut_Integer:100,int_:\"Month\"] returns all most frequent 'n'-neighbour words in cleaned abstracts of a given category 'cat', as an association with its dates of resolution 'int', up to a cut-off 'cut';
arXivAbstractsWordNeighboursTrend[cat,wordNeigh_String,cut_Integer:100,int_:\"Month\"] all total occurences of neighbour words 'wordNeigh' in abstracts of a given category 'cat', as an association with its dates of resolution 'int', using a cut-off 'cut'.";


(* ::Subsubsection::Closed:: *)
(*Combinations words*)


arXivTitlesWordCombinationID::usage = 
"arXivTitlesWordCombinationID[cat,wordComb_And,int_:\"Month\"] returns all cleaned titles where the combination of words 'wordComb' appears, associated with their article ids.";


arXivAbstractsWordCombinationID::usage =
"arXivAbstractsWordCombinationID[cat,wordComb_And,int_:\"Month\"] returns all cleaned abstracts where the combination of words 'wordComb' appears, associated with their article ids.";


arXivTitlesWordCombinationDated::usage = 
"arXivTitlesWordCombinationDated[cat,wordComb_And,int_:\"Month\"] returns all cleaned titles where the combination of words 'wordComb' appears, associated with their dates of time resolutions 'int'.";


arXivAbstractsWordCombinationDated::usage =
"arXivAbstractsWordCombinationDated[cat,wordComb_And,int_:\"Month\"] returns all cleaned abstracts where the combination of words 'wordComb' appears, associated with their dates of time resolutions 'int'.";


arXivTitlesWordCombinationTrend::usage = 
"arXivTitlesWordCombinationTrend[cat,wordComb_And,int_:\"Month\"] returns all total combinations of title words 'wordComb', associated with their dates of time resolutions 'int'.";


arXivAbstractsWordCombinationTrend::usage = 
"arXivAbstractsWordCombinationTrend[cat,wordComb_And,int_:\"Month\"] returns all total combinations of abstract words 'wordComb', associated with their dates of time resolutions 'int'.";


(* ::Subsubsection::Closed:: *)
(*Top and search*)


ArXivTopTitles::usage = 
"ArXivTopTitles[cat,cutoff] returns all 'cutoff' most frequent title words, with their number of occurrences, in a given category 'cat';
ArXivTopTitles[cat,cutoff,n] returns all 'cutoff' most frequent title 'n'-words neighbours, with their number of occurrences, in a given category 'cat'.";
ArXivTopAbstracts::usage = 
"ArXivTopAbstracts[cat,cutoff] returns all 'cutoff' most frequent abstract words, with their number of occurrences, in a given category 'cat';
ArXivTopAbstracts[cat,cutoff,n] returns all 'cutoff' most frequent abstract 'n'-words neighbours, with their number of occurrences, in a given category 'cat'.";


(*combinations to add*)


arXivTitlesWordSearch::usage = 
"arXivTitlesWordSearch[word,cat] returns the ranking of the word among all most popular title words in a given category 'cat', with also its number of occurences.";
arXivAbstractsWordSearch::usage = 
"arXivAbstractsWordSearch[word,cat] returns the ranking of the word among all most popular abstract words in a given category 'cat', with also its number of occurences.";


arXivTitlesWordNeighboursSearch::usage =
"arXivTitlesWordNeighboursSearch[wordNeigh,cat] returns the ranking of the word neighbours 'wordNeigh' among all most popular title words in a given category 'cat', with also its number of occurences.";
arXivAbstractsWordNeighboursSearch::usage = 
"arXivAbstractsWordNeighboursSearch[word,cat] returns the ranking of the word neighbours 'wordNeigh' among all most popular abstract words in a given category 'cat', with also its number of occurences.";


(* ::Subsubsection::Closed:: *)
(*Word citations*)


(*should extend to word combinations and to abstracts*)


ArXivCitationsTitles::usage=
"ArXivCitationsTitles[word_String,cat] returns all total citations of all articles containing a certain word or word neighbour 'word', in category 'cat', associated with their ids.";


(* ::Subsubsection::Closed:: *)
(*WordCloud video (to update)*)


(*below to update*)


(*ArXivTitlesWordCloudVideo::usage = 
"ArXivTitlesWordCloudVideo[cat,int_:\"Month\"] creates a video of wordclouds of title words in a given category 'cat', over all time with resolution 'int'.";*)


(* ::Subsection:: *)
(*ArXivLogos*)


ArXivLogosTitles::usage = 
"ArXivLogosTitles[word_String,cat] returns all titles in category 'cat' containing the word 'word', associated with their article id or date;
ArXivLogosTitles[wordAnd_And,cat] returns all titles in category 'cat' containing the word conjuction (And) 'wordAnd', associated with their article id or date;
ArXivLogosTitles[wordOr_Or,cat] returns all titles in category 'cat' containing the word inclusive disjunction (Or) 'wordOr', associated with their article id or date;
ArXivLogosTitles[wordXor_Xor,cat] returns all titles in category 'cat' containing the word exclusive disjunction (Xor) 'wordXor', associated with their article id or date;
ArXivLogosTitles[wordAndOr,cat] returns all titles in category 'cat' containing the conjuction (And) of word inclusive disjunctions (Or) 'wordAndOr', associated with their article id or date.";


ArXivLogosAbstracts::usage = 
"ArXivLogosAbstracts[word_String,cat] returns all abstracts in category 'cat' containing the word 'word', associated with their article id or date;
ArXivLogosAbstracts[wordAnd_And,cat] returns all abstracts in category 'cat' containing the word conjuction (And) 'wordAnd', associated with their article id or date;
ArXivLogosAbstracts[wordOr_Or,cat] returns all abstracts in category 'cat' containing the word inclusive disjunction (Or) 'wordOr', associated with their article id or date;
ArXivLogosAbstracts[wordXor_Xor,cat] returns all abstracts in category 'cat' containing the word exclusive disjunction (Xor) 'wordXor', associated with their article id or date;
ArXivLogosAbstracts[wordAndOr,cat] returns all abstracts in category 'cat' containing the conjuction (And) of word inclusive disjunctions (Or) 'wordAndOr', associated with their article id or date.";


(* ::Subsection:: *)
(*ArXiv Plot*)


ArXivPlot::usage=
"ArXivPlot[All,cat] draws a DateListPlot of all total article submissions in category 'cat';
ArXivPlot[word_String,cat] draws a DateListPlot of the share of popularity of a title word 'word' in category 'cat';
ArXivPlot[wordL_List,cat] draws a DateListPlot of the share of popularity of the title words list 'wordL' in category 'cat';
ArXivPlot[logos,cat] draws a DateListPlot of the share of popularity of the title words logic combination 'logos' in category 'cat';
ArXivPlot[All,logos,cat] draws a DateListPlot of all total articles with the title words construct 'logos' in category 'cat'.";


ArXivPlotTitles::usage=
"ArXivPlotTitles[word_String,cat] draws a DateListPlot of the share of popularity of a title word 'word' in category 'cat';
ArXivPlotTitles[wordL_List,cat] draws a DateListPlot of the share of popularity of the title words list 'wordL' in category 'cat';
ArXivPlotTitles[logos,cat] draws a DateListPlot of the share of popularity of the title words logic combination 'logos' in category 'cat';
ArXivPlotTitles[All,logos,cat] draws a DateListPlot of all total articles with the title words construct 'logos' in category 'cat'.";


ArXivPlotAbstracts::usage=
"ArXivPlotAbstracts[word_String,cat] draws a DateListPlot of the share of popularity of an abstract word 'word' in category 'cat';
ArXivPlotAbstracts[wordL_List,cat] draws a DateListPlot of the share of popularity of the abstract words list 'wordL' in category 'cat';
ArXivPlotAbstracts[logos,cat] draws a DateListPlot of the share of popularity of the abstract words logic combination 'logos' in category 'cat';
ArXivPlotAbstracts[All,logos,cat] draws a DateListPlot of all total articles with the abstract words construct 'logos' in category 'cat'.";


(* ::Subsection:: *)
(*Neural networks*)


(* ::Subsubsection::Closed:: *)
(*Vocabularies*)


ArXivVocabularyTitles::usage = 
"ArXivVocabularyTitles[cat_String] gives the word vocabulary of all (cleaned) titles of the primary category 'cat';
ArXivVocabularyTitles[{cat_String,All}] gives the word vocabulary of all (cleaned) titles of the cross-list category 'cat';
ArXivVocabularyTitles[cut_Integer] gives the word vocabulary of all (cleaned) titles of the 'cut' most frequent categories;
ArXivVocabularyTitles[catL_List] gives the word vocabulary of all (cleaned) titles of the list of categories 'catL'.";


ArXivVocabularyAbstracts::usage = 
"ArXivVocabularyAbstracts[cat_String] gives the word vocabulary of all (cleaned) abstracts of the primary category 'cat';
ArXivVocabularyAbstracts[{cat_String,All}] gives the word vocabulary of all (cleaned) abstracts of the cross-list category 'cat';
ArXivVocabularyAbstracts[cut_Integer] gives the word vocabulary of all (cleaned) abstracts of the 'cut' most frequent categories;
ArXivVocabularyAbstracts[catL_List] gives the word vocabulary of all (cleaned) abstracts of the list of categories 'catL'.";


ArXivVocabularyIntroductions::usage =
"ArXivVocabularyIntroductions[id_String] gives the word vocabulary of TeX introduction of article 'id';
ArXivVocabularyIntroductions[idL_List] gives the word vocabulary of all TeX introductions of the articles id list 'idL'.";


(* ::Subsubsection::Closed:: *)
(*Category Classifier*)


ArXivClassifyCategoriesNet::usage = 
"ArXivClassifyCategoriesNet[cut_Integer,dim_Integer,drop] gives a net classifying the 'cut' most frequent categories, using as all linear layers' dimension 'dim', with dropout ratio 'drop';
ArXivClassifyCategoriesNet[catL_List,dim_Integer,drop] gives a net classifying the 'catL' list of categories, using as all linear layers' dimension 'dim', with dropout ratio 'drop';
ArXivClassifyCategoriesNet[catL_List,dim_List,drop] gives a net classifying the 'catL' list of categories, embedding titles in dimension dim[[1]], abstracts in dimension dim[[2]], catenate them and later pass them into a linear layer with dimension dim[[3]], with dropout ratio 'drop'.";


ArXivClassifyCategoriesTrainTest::usage = 
"ArXivClassifyCategoriesTrainTest[cut_Integer,nids_Integer] gives a training and test sets for the net ArXivClassifyCategoriesNet[cut,dim,drop] classifying the 'cut' most frequent categories, using up to 'nids' random articles in each category;
ArXivClassifyCategoriesTrainTest[catL_List,nids_Integer] gives a training and test sets for the net ArXivClassifyCategoriesNet[catL,dim,drop] classifying the 'catL' list of categories, using up to 'nids' random articles in each category.";


(* ::Subsubsection::Closed:: *)
(*Author Classifier*)


(*to complete with id list*)


ArXivClassifyAuthorsNet::usage = 
"ArXivClassifyAuthorsNet[authorL_:{_Entity..},dim_Integer,drop] gives a net classifying a list of author entities 'authorL', using as all linear layers' dimension 'dim', with dropout ratio 'drop';
ArXivClassifyAuthorsNet[authorL_:{_Entity..},dim_List,drop] gives a net classifying a list of author entities 'authorL', embedding titles in dimension dim[[1]], abstracts in dimension dim[[2]], (optional) introductions in dimension dim[[4]], catenate them and later passing them into a linear layer with dimension dim[[3]], with dropout ratio 'drop';
ArXivClassifyAuthorsNet[authorL_:{_Entity..},dim_List,drop,idL_List] gives a net classifying a list of author entities 'authorL', embedding titles in dimension dim[[1]], abstracts in dimension dim[[2]], introductions in dimension dim[[4]] - building introduction vocabulary with only the list of articles 'idL' - catenate them and later passing them into a linear layer with dimension dim[[3]], with dropout ratio 'drop';
ArXivClassifyAuthorsNet[authorL_List,cat,dim_Integer,drop] gives a net classifying the 'authorL' list of author strings in the same category 'cat', using as all linear layers' dimension 'dim', with dropout ratio 'drop';
ArXivClassifyAuthorsNet[authorL_List,cat,dim_List,drop] gives a net classifying the 'authorL' list of author strings in the same category 'cat', embedding titles in dimension dim[[1]], abstracts in dimension dim[[2]], catenate them and later passing them into a linear layer with dimension dim[[3]], with dropout ratio 'drop';
ArXivClassifyAuthorsNet[authorL_List,catL_List,dim_List,drop] gives a net classifying the 'authorL' list of author strings in categories given by 'catL' list, embedding titles in dimension dim[[1]], abstracts in dimension dim[[2]], catenate them and later passing them into a linear layer with dimension dim[[3]], with dropout ratio 'drop'.";


ArXivClassifyAuthorsTrainTest::usage = 
"ArXivClassifyAuthorsTrainTest[authorL_:{_Entity..},nids_Integer] gives a training and test sets for the net ArXivClassifyCategoriesNet[authorL:{_Entity..},dim,drop] classifying the 'authorL' list of author entities, using up to 'nids' random articles each;
ArXivClassifyAuthorsTrainTest[authorL_:{_Entity..},idL_List] gives a training and test sets for the net ArXivClassifyCategoriesNet[authorL:{_Entity..},dim,drop] classifying the 'authorL' list of author entities, using up the 'idL' list of articles;
ArXivClassifyAuthorsTrainTest[authorL_List,cat,nids_Integer] gives a training and test sets for the net ArXivClassifyCategoriesNet[authorL,dim,drop] classifying the 'authorL' list of author strings in the same category 'cat', using up to 'nids' random articles each;
ArXivClassifyAuthorsTrainTest[authorL_List,catL_List,nids_Integer] gives a training and test sets for the net ArXivClassifyCategoriesNet[authorL,dim,drop] classifying the 'authorL' list of author strings, in the categories given by the list 'catL', using up to 'nids' random articles each.";


(* ::Subsubsection::Closed:: *)
(*Features*)


ArXivFeaturesCategoriesNet::usage=
"ArXivFeaturesCategoriesNet[n_Integer] returns a feature extraction net, modifying 'n' top categories classifier net;
ArXivFeaturesCategoriesNet[n_Integer,N_Integer] returns a feature extraction net, modifying 'n' top categories classifier net, trained with 'N' examples for each category;
ArXivFeaturesCategoriesNet[n_Integer,N_Integer,dim_List,drop,rounds] returns a feature extraction net, modifying 'n' top categories classifier net with layers dimension list 'dim', dropout level 'drop', trained with 'N' examples for each category, in 'rounds' training rounds.";


ArXivFeaturesCategoriesSet::usage=
"ArXivFeaturesCategoriesSet[n_Integer,N_Integer] returns 'N' random articles in 'n' categories, in a form suitable for feature extraction or clustering, as an association with titles, abstracts and categories.";


ArXivFeaturesCategoriesNearest::usage=
"ArXivFeaturesCategoriesNearest[set_Association,k_Integer] returns the 'k' nearest feature articles of an association of titles, abstracts and categories 'set', by using a feature extractor net trained on category classification.;
ArXivFeaturesCategoriesNearest[net_NetGraph,set_Association,k_Integer] returns the 'k' nearest feature articles of an association of titles, abstracts and categories 'set', by using a feature extractor net 'net' trained on category classification.";


(* ::Subsubsection::Closed:: *)
(*Cluster*)


(*arXivCategoriesColors;*)


(*ArXivClusterGraph;*)


ArXivClusterCategoriesGraph::usage=
"ArXivClusterCategoriesGraph[set_Association,k_Integer] clusters the articles in association 'set' by using a feature extractor net trained on category classification. The clustering is done by choosing the 'k' nearest features to each article;
ArXivClusterCategoriesGraph[net_NetGraph,set_Association,k_Integer] clusters the articles in association 'set' by using a feature extractor net 'net' trained on category classification. The clustering is done by choosing the 'k' nearest features to each article.";


ArXivClusterLegend::usage=
"ArXivClusterLegend[n_Integer] returns an association between the 'n' most frequent categories and colors, to be used as a legend.";


(* ::Subsection::Closed:: *)
(*LLM*)


(*ArXivLLMConceptDefine;ArXivDefineConcept;*)
(*ArXivLLMAuthorReport;ArXivReportAuthor;*)
(*we want to use aso FindTextualAnswer*)


(*use just simgle word and add criterion "MostRecent" or "MostCitations"*)


ArXivExplainConcept::usage =
"ArXivExplainConcept[concept_String,id_String] explains 'concept' given an article id;
ArXivExplainConcept[concept_String,idL_List] explains 'concept' given an articles list 'idL'.";


ArXivExplainAuthor::usage =
"ArXivExplainAuthor[author_Entity] explains the work of an 'author' as registered entity;
ArXivExplainAuthor[author_String] explains the work of an 'author' as string;
ArXivExplainAuthor[author_String,cat_] explains the work of an 'author' in category 'cat';
ArXivExplainAuthor[authorL_List] explains the work of an author whose possible names are the list 'authorL'.;
ArXivExplainAuthor[authorL_List,catL_List] the two lists 'doubleL' - the first made of author names and the second of corresponding categories.";


(* ::Subsection:: *)
(*End public Header*)


Begin["DanieleGregori`Private`"];


(*Begin["My`Private`"];*)


(* ::Section:: *)
(*1. ArXiv main database*)


(* ::Subsection:: *)
(*Dataset from Kaggle (optional)*)


(* ::Subsubsection::Closed:: *)
(*Dataset Kaggle download*)


(*only when new download from Kaggle is made:*)
(*you need a Kaggle account*)


(*dirDatabase=FileNameJoin[{StringDelete[NotebookDirectory[],"Kernel"~~_~~EndOfString],"Assets"}];*)


(*datasetFull=Block[{rawDbText,rawDb},
					rawDbText=Import[FileNameJoin[{dirDatabase,"arxiv-metadata-oai-snapshot.json"}],"Text"]//EchoTiming;
					rawDb=StringJoin["{\"id\":",#]&/@StringSplit[rawDbText,"{\"id\":"]//EchoTiming;
					ParallelMap[Interpreter["JSON"],rawDb]//EchoTiming];*)	


(* ::Subsubsection::Closed:: *)
(*Kaggle delete duplicate articles*)


(*datasetDuplicateFree=Block[{ds,idFull,idsDuplicate,positionsDuplicates},
							ds=datasetFull;
							idFull=Map[Lookup[#,"id"]&,ds]//EchoFunction[Length]//EchoFunction[DuplicateFreeQ]//EchoTiming;
							idsDuplicate=Cases[Normal@ReverseSort@Counts[idFull],HoldPattern[_String->n_Integer/;n>=2]]//EchoTiming//Echo;
							positionsDuplicates=Position[ds,{"id"->#,__}]&/@Keys[idsDuplicate];
							Join[
								DeleteCases[ds,Apply[Alternatives,{"id"->#,__}&/@Keys[idsDuplicate]]],
								Part[ds,Flatten[Last/@positionsDuplicates]
								]
							]]//QuietEcho//EchoTiming;*)


(* ::Subsubsection::Closed:: *)
(*Kaggle dataset date ordered*)


(*dateObjects=Block[{assMonths},
					assMonths=<|"Jan"->1,"Feb"->2,"Mar"->3,"Apr"->4,"May"->5,"Jun"->6,"Jul"->7,"Aug"->8,"Sep"->9,"Oct"->10,"Nov"->11,"Dec"->12|>;
					Map[DateObject@Reverse@
					ToExpression@MapAt[
					assMonths[#]&,
							StringSplit[StringDrop[StringDrop[
										Lookup[First@Lookup[#,"versions"],"created"]
																,5],-12]],
										{2}]&,
												datasetDuplicateFree]]//EchoTiming;*)


(*datasetDateOrdered=Flatten[
						Values@KeySort@
								Merge[Rule@@@
											Transpose[{dateObjects,datasetDuplicateFree}],
									  Identity],
						   1];//EchoTiming*)


(*ArXivDataset[All]=datasetDateOrdered;*)


(*dateDataset="2024-09";*)


(*Export[FileNameJoin[{dirDatabase,"arxiv-database"<>"-"<>dateDataset<>".json"}],ArXivDataset[All]]//EchoTiming;*)


(*can delete what follows?*)


(*datasetDateObjects[All]=KeySort@Merge[Rule@@@Transpose[{dateObjects,datasetDuplicateFree}],Identity];
arXivDatasetDated[All]["Day"]=datasetDateObjects[All];
arXivDatasetDated[All]["Month"]=Map[Flatten[#,1]&,Merge[KeyValueMap[DateObject@Drop[First[#1],-1]->#2&,datasetDateObjects[All]],Identity]];
arXivDatasetDated[All]["Year"]=Map[Flatten[#,1]&,Merge[KeyValueMap[DateObject@Drop[First[#1],-2]->#2&,datasetDateObjects[All]],Identity]];*)


(* ::Subsection:: *)
(*Dataset cleaned import*)


(* ::Subsubsection::Closed:: *)
(*Dataset date*)


dateDataset="2024-09";


(* ::Subsubsection::Closed:: *)
(*Dataset local import*)


dirDatabase=FileNameJoin[{StringDelete[NotebookDirectory[],"Kernel"~~_~~EndOfString],"Assets"}];


datasetLocal=Import[First@Flatten@StringCases[FileNames["*",dirDatabase],__~~"arxiv-database"<>"-"<>dateDataset<>".json"],"JSON"](*//EchoTiming*);


(*with format json it takes just a bit more than 1 minute*)


(* ::Subsubsection::Closed:: *)
(*Dataset WolframCloud import*)


(*warning: it can be slow uploading and downloading the ~4.5 GB database file*)


(*CloudPut[ArXivDataset[All],"arxiv-database"<>"-"<>dateDataset,Permissions->"Public"]//EchoTiming;*)


(* ::Input:: *)
(*(*databaseGet=CloudGet["https://www.wolframcloud.com/obj/dangregori/ArXivDatabase/"<>"arxiv-database"<>"-"<>dateDataset]//EchoTiming;*)*)


(*databaseGet===ArXivDataset[All]*)


(*databaseGet===datasetLocal*)


(* ::Subsubsection::Closed:: *)
(*Dataset setting*)


If[ 
   (datasetLocal=!=$Failed&&ValueQ[datasetLocal])(*//EchoFunction["local imp: ",#&]*),
   
    ArXivDataset[All]=datasetLocal,
    
    ArXivDataset[All]=
       CloudGet["https://www.wolframcloud.com/obj/dangregori/ArXivDatabase/"<>"arxiv-database"<>"-"<>dateDataset]
                //EchoFunction["cloud imp: ", (#=!=$Failed&&ValueQ[#])&]];


(*ArXivDataset[All]===databaseGet*)


(* ::Subsubsection::Closed:: *)
(*Dataset dates*)


(*the following dateObjects takes long, about 1 minute*) 
(*it would be more clever to compute just the needed dateobjects and then distribute them*)


(*dateObjects=Block[{assMonths},
					assMonths=<|"Jan"->1,"Feb"->2,"Mar"->3,"Apr"->4,"May"->5,"Jun"->6,"Jul"->7,"Aug"->8,"Sep"->9,"Oct"->10,"Nov"->11,"Dec"->12|>;
					Map[DateObject@Reverse@
					ToExpression@MapAt[
					assMonths[#]&,
							StringSplit[StringDrop[StringDrop[
										Lookup[First@Lookup[#,"versions"],"created"]
																,5],-12]],
										{2}]&,
												ArXivDataset[All]]](*//EchoTiming*);*)


(*dateObjects takes half the time*)


(*it can be redundant with arXivVersionsFirstDate later*)


dateStrings=Block[{assMonths},
					assMonths=<|"Jan"->1,"Feb"->2,"Mar"->3,"Apr"->4,"May"->5,"Jun"->6,"Jul"->7,"Aug"->8,"Sep"->9,"Oct"->10,"Nov"->11,"Dec"->12|>;
					Map[Reverse@
					ToExpression@MapAt[
					assMonths[#]&,
							StringSplit[StringDrop[StringDrop[
										Lookup[First@Lookup[#,"versions"],"created"]
																,5],-12]],
										{2}]&,
												ArXivDataset[All]]];


(*(possibly redundant later)*)


dateObjects=Map[DateObject,dateStrings];


datasetDateObjects[All]=KeySort@Merge[Rule@@@Transpose[{dateObjects,ArXivDataset[All]}],Identity];
arXivDatasetDated[All]["Day"]=datasetDateObjects[All];
arXivDatasetDated[All]["Month"]=Map[Flatten[#,1]&,Merge[KeyValueMap[DateObject@Drop[First[#1],-1]->#2&,datasetDateObjects[All]],Identity]];
arXivDatasetDated[All]["Year"]=Map[Flatten[#,1]&,Merge[KeyValueMap[DateObject@Drop[First[#1],-2]->#2&,datasetDateObjects[All]],Identity]];


(* ::Section:: *)
(*2. Scraping extra data*)


(* ::Subsection:: *)
(*T EX source files *)


(* ::Subsubsection::Closed:: *)
(*T EX import*)


linksTeXFunc[id_]:="https://arxiv.org/e-print/"<>id
importTeX[id_]:=Import[linksTeXFunc[id],"Text"]
importTeXDoc[id_]:=StringCases[importTeX[id],"\\begin{document}"~~__~~"\\end{document}"][[1]]


arXivTeX[id_]:=If[
						StringTake[importTeX[id],4]==="%PDF", Failure["PDF",<|"Message"->"No TeX source available, only PDF."|>],
								If[Head[Import[linksTeXFunc[id]]]=!=List,
								importTeX[id],
										Sow@Cases[Import[linksTeXFunc[id],"TAR"],
											_String?(StringEndsQ[#,".tex"]&)];Failure["TAR",<|"Message"->"The TeX source is divided in multiple files (inside in a TAR file). Use Reap to show them."|>]]]
(*in case the head of default import is string, we have a TAR file with many tex files inside,
but it is not clear to me how to access the tex files in that zipped folder through the API*)
(*if StringTake[#,4]==%PDF there is not TeX!!*)





ArXivTeXPreamble[id_]:=
  First@StringSplit[
	StringJoin@@DeleteCases[
		Map[StringDelete[
			StringJoin["\\documentclass",#],
						"\\documentclass"~~RegularExpression["(?i)[a-z]|\\d"]~~__]&,
						StringSplit[importTeX[id],"\\documentclass"]],""],
							"\\begin{document}"]




(* ::Subsubsection::Closed:: *)
(*T EX partition*)


sectionsTeX[id_]:=(*to improve, it does not always work*)StringSplit[importTeX[id],"\\section"]


ArXivTeXDocument[id_]:=importTeXDoc[id]


ArXivTeXSections[id_]:=(*to improve, it does not always work*)StringSplit[importTeXDoc[id],"\\section"]


sectionsTeXDoc[id_]:=ArXivExtractSections[id]


sectionsNone[id_]:=Block[{tex,texDoc},
texDoc=Enclose@ConfirmQuiet[importTeXDoc[id],Part::partw];

tex=If[!FailureQ[texDoc],texDoc,importTeX[id]];

StringSplit[tex,{"\\end{abstract}","\\begin{thebibliography}"}]]


(* ::Input:: *)
(**)


(*for debugging:*)
(*splitTeX20[id_]:=StringPartition[#,Floor[StringLength[#]/20]]&@importTeX[id]
splitTeX50[id_]:=StringPartition[#,Floor[StringLength[#]/50]]&@importTeX[id]
splitTeX[id_,length_]:=StringPartition[#,length]&@importTeX[id]*)


(* ::Subsection:: *)
(*Introduction extraction*)


(* ::Subsubsection::Closed:: *)
(*Introduction main*)


(*about 10% success, can improve*)


(* ::Input::Initialization:: *)
ArXivTeXIntroduction[id_]:=ArXivTeXIntroduction[id]=(*to improve, it does not always work*)
Block[{
tex,texSource,texDoc,
sections,sectionsAlternative,sectionNone,
casesIntro,casesIntroAlter(*obsolete*),
ifSplitF,
tryCases,trySecond},

texSource=If[!FailureQ[arXivTeX[id]],arXivTeX[id],Echo[arXivTeX[id]];importTeX[id]];

texDoc=Enclose@ConfirmQuiet[importTeXDoc[id],Part::partw];

tex=If[!FailureQ[texDoc],texDoc,texSource];
(*
texUncomm=importTeXDocUncomm[id];*)
(*
EchoFunction["string length tex doc: ",StringLength[texDoc]];*)

sections=StringSplit[tex,"\\section"];
(*having a tex structured in section is not always the case*)

(*other separators: *)
sectionsAlternative=StringSplit[tex,{(*"\\emph",*)"\\sxn",(*"\\textbf",*)"\\newsec"}];

 (*no separators, only bibliography: *)
sectionNone=StringSplit[tex,{"\\end{abstract}","\\begin{thebibliography}"}];


casesIntro=
{"{Introduction}"~~__,"{Introduction.}"~~__,"{\\bf Introduction}"~~__,"{\\bf Introduction.}"~~__,"{\\label{"~~__~~"}"<>"Introduction}"~~__,"{\\label{"~~__~~"}"~~Whitespace..~~"Introduction}"~~__,
"{Introduction"~~__~~"\\label{"~~__~~"}}"~~__,

"{Summary}"~~__};

casesIntroAlter=casesIntro;

tryCases=
Flatten@
DeleteCases[
If[Echo[Length[sections],"length sections"]>1,
StringCases[sections,casesIntro],
If[Echo[Length[sectionsAlternative],"length sections alternative"]>1,
	StringCases[sectionsAlternative,casesIntroAlter],{sectionNone[[2]]}]
	]
	,{}];

trySecond=
If[Length[sections]>1,
sections[[2]],
If[Length[sectionsAlternative]>1,
	sectionsAlternative[[2]],tex]
	];

If[Echo[Length[tryCases],"length cases"]>=1,tryCases[[1]],trySecond]

	]//QuietEcho


(* ::Subsubsection::Closed:: *)
(*Introduction list & cleaned*)


(*arXivTeXIntroductionList[idL_List,thresh_:50000]:=Association@Cases[Map[Pause[1];(#->StringTake[ArXivTeXIntroduction[#],UpTo[thresh]])&,idL],HoldPattern[_->_String]]*)


arXivTeXIntroductionSafe[id_String]:=(If[Head[#]===String,#,"none"]&@ArXivTeXIntroduction[id])


arXivTeXIntroductionList[idL_List,thresh_:50000]:=Association@Map[Pause[1];(#->StringTake[(If[Head[#]===String,#,"none"]&@ArXivTeXIntroduction[#]),UpTo[thresh]])&,idL]


arXivTeXIntroductionListClean[idL_List,thresh_:50000]:=ParallelMap[TextWords@*ToLowerCase,arXivTeXIntroductionList[idL]]


arXivTeXIntroductionAuthor[author_Entity]:=Association@Cases[Map[Pause[1];(#->StringTake[arXivTeXIntroductionSafe[#],UpTo[50000]])&,ArXivArticlesAuthor[author]],HoldPattern[_->_String]]


arXivTeXIntroductionAuthor[author_Entity,n_Integer,thresh_:50000]:=Association@Cases[Map[Pause[1];(#->StringTake[arXivTeXIntroductionSafe[#],UpTo[thresh]])&,RandomSample[ArXivArticlesAuthor[author],UpTo[n]]],HoldPattern[_->_String]]


(* ::Subsection::Closed:: *)
(*Formulae extraction*)


(*can improve*)


arXivTeXBeginEnd[tex_String]:=Module[{listbeg,listend,indexes1},
listbeg=EchoFunction[Length]@StringPosition[tex,"\\begin"];
listend=EchoFunction[Length]@StringPosition[tex,"\\end"];
indexes1=Echo@Union[First/@listbeg,First/@listend];
Join[Table[
First@StringCases[
StringTake[StringDrop[tex,indexes1[[i]]],UpTo[Min[indexes1[[i]]+14,indexes1[[i+1]]]]],
Shortest["begin{"~~__~~"}"]|Shortest["end{"~~__~~"}"]],{i,Range[Length[indexes1]-1]}],{"end{document}"}]]


arXivTeXPartVisualize[texlist_List,keyword_String]:=
Association@DeleteCases[
MapIndexed[First[#2]->TabView@StringCases[#,Shortest["\\begin{"<>keyword<>"}"~~__~~"\\end{"<>keyword<>"}"]]&,texlist],
						HoldPattern[_Integer->TabView[{}]]]


ArXivTeXFormulae[id_String,eqword_String]:=
StringCases[ArXivTeXDocument[id],Shortest["\\begin{"<>eqword<>"}"~~__~~"\\end{"<>eqword<>"}"]]


ArXivTeXFormulae[id_String]:=
Association@DeleteCases[Join[
{"$"->StringCases[ArXivTeXDocument[id],Shortest["$"~~__~~"$"]]},
Table[
word->StringCases[ArXivTeXDocument[id],Shortest["\\begin{"<>word<>"}"~~__~~"\\end{"<>word<>"}"]],
	{word,{"equation","align","aligned","gather","equation*","align*","aligned*","gather*"}}],
{"\\be"->(*Rest@*)StringCases[ArXivTeXDocument[id],Shortest["\\be"~~Whitespace~~__~~"\\ee"]],
"\\bea"->StringCases[ArXivTeXDocument[id],Shortest["\\bea"~~Whitespace~~__~~"\\eea"]],
"\\ba"->StringCases[ArXivTeXDocument[id],Shortest["\\ba"~~Whitespace~~__~~"\\ea"]],
"\\["->StringCases[ArXivTeXDocument[id],Shortest["\\["~~Whitespace~~__~~"\\]"]]}],
HoldPattern[_String->{}]]


(* ::Subsection::Closed:: *)
(*Citations*)


apiCitationsFull[articles_List,field_:"citationCount"]:=Block[{response,posnull,responseclean},(*AssociationThread[articles,*)
response=URLExecute[
HTTPRequest[
  "https://api.semanticscholar.org/graph/v1/paper/batch",
  <|
   "Method"->"POST",
   "Headers"->{"Content-Type"->"application/json"},
   "Query"->{"fields"->field(*"referenceCount,citationCount,title"*)},
   "Body"->ExportString[<|"ids"->Map[StringJoin["ARXIV:",#]&,articles]|>,"JSON"]
  |>],
"RawJSON"
];
responseclean=DeleteCases[Sow@response,Null];
posnull=Complement[Table[{i},{i,Length[articles]}],Position[response,<|"paperId"->_String,"citationCount"->_Integer|>]];
If[field=="citationCount",AssociationThread[Delete[articles,posnull],responseclean],response]](*]*)


apiCitationsIDs[articles_List]:=Block[{response},
response=URLExecute[
HTTPRequest[
  "https://api.semanticscholar.org/graph/v1/paper/batch",
  <|
   "Method"->"POST",
   "Headers"->{"Content-Type"->"application/json"},
   "Query"->{"fields"->"externalIds"},
   "Body"->ExportString[<|"ids"->articles|>,"JSON"]
  |>],
"RawJSON"
];
Map[Lookup[Lookup[#,"externalIds"],"ArXiv"]&,response]]


ArXivCitationsTotal[articles_List,field_:"citationCount"]:=
		KeyValueMap[{#1,Lookup[#2,field]}&,
			Association@(*EchoFunction["missing data for id: ",Keys@Complement[Normal@apiCitationsFullGlob[articles],#]&]@*)
							DeleteCases[Normal@apiCitationsFull[articles,field],
										HoldPattern[_String->_Symbol]]]


ArXivCitationsTotal[id_String,field_:"citationCount"]:=
		ArXivCitationsTotal[{id},field]


ArXivCitations[id_String]:=
DeleteMissing@apiCitationsIDs[Flatten@Map[Lookup[#,"paperId"]&,Lookup[apiCitationsFull[{id},"citations"],"citations"]]]


ArXivCitations[idL_List]:=Association@Map[#->ArXivCitations[#]&,idL]


(*ArXivCitations[id_String,n_Integer]:=*)



ArXivCitationsAuthor[author_String,cat___]:=ArXivCitationsAuthor[author,cat]=Block[{part,list1,listc},
part=Partition[Flatten@Values@ArXivArticlesAuthor[author,cat],UpTo[8]];
list1=Quiet@
Flatten[Sow@MapIndexed[Monitor[Table[(Pause[3];(i->ArXivCitations[i])),{i,#}],ProgressIndicator[First[#2]/(Length[part])]]&,part],1];
listc=ReplaceAll[List@@@
	DeleteCases[list1,HoldPattern[_String->_DeleteMissing]],
		{s_String,l_List?(MemberQ[#,_Lookup]&)}:>{s,DeleteCases[l,_Lookup]}];
Flatten[Map[Thread[Table[#[[1]],Length[#[[2]]]]->#[[2]]]&,listc]]]
ArXivCitationsAuthor[authorL_List,cat___]:=Flatten@Map[ArXivCitationsAuthor[#,cat]&,authorL]
ArXivCitationsAuthor[authorL_List,catL_List]:=Flatten@MapThread[ArXivCitationsAuthor[#1,#2]&,{authorL,catL}]


ArXivCitationsAuthor[author_Entity]:=Block[{part,list1,listc},
part=Partition[ArXivArticlesAuthor[author],UpTo[8]];
list1=Quiet@
Flatten[Sow@MapIndexed[Monitor[Table[(Pause[3];(i->ArXivCitations[i])),{i,#}],ProgressIndicator[First[#2]/(Length[part])]]&,part],1];
listc=ReplaceAll[List@@@
	DeleteCases[list1,HoldPattern[_String->_DeleteMissing]],
		{s_String,l_List?(MemberQ[#,_Lookup]&)}:>{s,DeleteCases[l,_Lookup]}];
Flatten[Map[Thread[Table[#[[1]],Length[#[[2]]]]->#[[2]]]&,listc]]]


ArXivGraphAuthor[author_String,cat___,options:OptionsPattern[Graph]]:=
Graph[EchoFunction["total citations",Length]@ArXivCitationsAuthor[author,cat],options(*VertexLabels->Placed[Automatic,Tooltip]*)]
ArXivGraphAuthor[authorL_List,cat___,options:OptionsPattern[Graph]]:=
Graph[EchoFunction["total citations",Length]@Flatten@Map[ArXivCitationsAuthor[#,cat]&,authorL],options]
ArXivGraphAuthor[authorL_List,catL_List,options:OptionsPattern[Graph]]:=
Graph[EchoFunction["total citations",Length]@Flatten@MapThread[ArXivCitationsAuthor[#1,#2]&,{authorL,catL}],options]


ArXivGraphAuthor[author_Entity,options:OptionsPattern[Graph]]:=
Graph[EchoFunction["total citations",Length]@ArXivCitationsAuthor[author],options(*VertexLabels->Placed[Automatic,Tooltip]*)]


ArXivGraph[id_String,options:OptionsPattern[Graph]]:=
Graph[Thread[id->EchoFunction["total citations",Length]@ArXivCitations[id]],options(*VertexLabels->Placed[Automatic,Tooltip]*)]
ArXivGraph[idL_List,options:OptionsPattern[Graph]]:=
Graph[EchoFunction["total citations",Length]@Nest[Cases[DeleteCases[Flatten@Map[Pause[3];Thread[#->Quiet@ArXivCitations[#]]&,#],_?(!FreeQ[#,Failure]&),\[Infinity]],HoldPattern[_String->_String]]&,idL,1],options]


(*ArXivGraph[id_String,options:OptionsPattern[Graph]]:=
Graph[]*)


(*EchoFunction[Length]@Nest[Cases[DeleteCases[Flatten@Map[Thread[#->Quiet@ArXivCitations[#]]&,#],_?(!FreeQ[#,Failure]&),\[Infinity]],HoldPattern[_String->_String]]&,ArXivCitations["1908.08030"],1]*)


(*Graph@%*)


(* ::Subsection::Closed:: *)
(*API new articles (for next release)*)


(*to do*)
(*ArXivNewArticles[]*)


(* ::Section:: *)
(*3. Main data functionality*)


(* ::Subsection:: *)
(*Dataset lookup utilities*)


(* ::Subsubsection::Closed:: *)
(*Dataset lookup (I)*)


datasetKeys=Flatten@Union[Keys/@ArXivDataset[All]];


arXivDatasetKeys=datasetKeys;


(*Clear[ArXivDatasetLookup]*)
ArXivDatasetLookup[key_String]/;MemberQ[datasetKeys,key]:=ArXivDatasetLookup[key]=Cases[ArXivDataset[All],(key->term_):>term,{2}]
ArXivDatasetLookup[key_String,subds_List]/;MemberQ[datasetKeys,key]:=ArXivDatasetLookup[key,subds]=Cases[subds,(key->term_):>term,{2}]


(* ::Subsubsection::Closed:: *)
(*IDs*)


(*maybe ArXivDatasetItem better set as function*)


arXivIDsAssoc[All]:=arXivIDsAssoc[All]=arXivIDsAssoc[]=ArXivDatasetLookup["id"];


arXivDatasetItem=AssociationThread[arXivIDsAssoc[All],ArXivDataset[All]];


ArXivArticles[id_String]:=arXivDatasetItem[id]


ArXivArticles[ids_List]:=Lookup[arXivDatasetItem,ids]


(* ::Subsubsection::Closed:: *)
(*Categories and Dataset lookup (II)*)


arXivCategoriesAssoc[All]:=arXivCategoriesAssoc[All]=
AssociationThread[ArXivDatasetLookup["id"],StringSplit[#," "]&/@ArXivDatasetLookup["categories"]];
ArXivCategories[id_String,All]:=Lookup[arXivCategoriesAssoc[All],id]
ArXivCategories[id_String]:=ArXivCategories[id,All]


arXivCategoriesPrimaryAssoc[All]:=arXivCategoriesPrimaryAssoc[All]=
									Map[First,arXivCategoriesAssoc[All]];
ArXivCategoriesPrimary[id_String]:=Lookup[arXivCategoriesPrimaryAssoc[All],id]


categoriesUnion=Union@Flatten[ArXivDatasetLookup["categories"]];

arXivCategoriesUnion=Union[Flatten[StringSplit/@categoriesUnion]];

ArXivCategoriesUnion=arXivCategoriesUnion;

ArXivCategoriesLegend=AssociationThread[arXivCategoriesUnion,
										{"Accelerator Physics", "Adaptation and Self-Organizing systems", "Algebraic Geometry", "MAYBE Adaptation and Self-Organizing Science", "Astrophysics", "Cosmology and Nongalactic Astrophysics", "Earth and Planetary Astrophysics", "Astrophysics of Galaxies", "High Energy Astrophysical Phenomena", "Instrumentation and Methods for Astrophysics", "Solar and Stellar Astrophysics", "MAYBE Atomic Physics", "MAYBE Bayesian Analysis", "MAYBE Chaotic Dynamics", "MAYBE Chemical Physics", "MAYBE Computation and Language", "MAYBE Comp Gases", "Condensed Matter", "Disordered Systems and Neural Networks", "Mesoscale and Nanoscale Physics", "Materials Science", "Other Condensed Matter", "Quantum Gases", "Soft Condensed Matter", "Statistical Mechanics", "Strongly Correlated Electrons", "Superconductivity", "Artificial Intelligence", "Hardware Architecture", "Computational Complexity", "Computational Engineering, Finance, and Science", "Computational Geometry", "Computation and Language", "Cryptography and Security", "Computer Vision and Pattern Recognition", "Computers and Society", "Databases", "Distributed, Parallel, and Cluster Computing", "Digital Libraries", "Discrete Mathematics", "Data Structures and Algorithms", "Emerging Technologies", "Formal Languages and Automata Theory", "General Literature", "Graphics", "Computer Science and Game Theory", "Human-Computer Interaction", "Information Retrieval", "Information Theory", "Machine Learning", "Logic in Computer Science", "Multiagent Systems", "Multimedia", "Mathematical Software", "Numerical Analysis", "Neural and Evolutionary Computing", "Networking and Internet Architecture", "Other Computer Science", "Operating Systems", "Performance", "Programming Languages", "Robotics", "Symbolic Computation", "Sound", "Software Engineering", "Social and Information Networks", "Systems and Control", "MAYBE differential geometry", "Econometrics", "General Economics", "Theoretical Economics", "Audio and Speech Processing", "Image and Video Processing", "Signal Processing", "Systems and Control", "MAYBE functional analysis", "General Relativity and Quantum Cosmology", "High Energy Physics - Experiment", "High Energy Physics - Lattice", "High Energy Physics - Phenomenology", "High Energy Physics - Theory", "Commutative Algebra", "Algebraic Geometry", "Analysis of PDEs", "Algebraic Topology", "Classical Analysis and ODEs", "Combinatorics", "Category Theory", "Complex Variables", "Differential Geometry", "Dynamical Systems", "Functional Analysis", "General Mathematics", "General Topology", "Group Theory", "Geometric Topology", "History and Overview", "ALIAS Information Theory", "K-Theory and Homology", "Logic", "Metric Geometry", "ALIAS Mathematical Physics", "Numerical Analysis", "Number Theory", "Operator Algebras", "Optimization and Control", "Mathematical Physics", "Probability", "Quantum Algebra", "Rings and Algebras", "Representation Theory", "Symplectic Geometry", "Spectral Theory", "Statistics Theory", "MAYBE materials theory", "Adaptation and Self-Organizing Systems", "Chaotic Dynamics", "Cellular Automata and Lattice Gases", "Pattern Formation and Solitons", "Exactly Solvable and Integrable Systems", "Nuclear Experiment", "Nuclear Theory", "MAYBE Pattern Formation and Solitons", "Accelerator Physics", "Atmospheric and Oceanic Physics", "Applied Physics", "Atomic and Molecular Clusters", "Atomic Physics", "Biological Physics", "Chemical Physics", "Classical Physics", "Computational Physics", "Data Analysis, Statistics and Probability", "Physics Education", "Fluid Dynamics", "General Physics", "Geophysics", "History and Philosophy of Physics", "Instrumentation and Detectors", "Medical Physics", "Optics", "Plasma Physics", "Popular Physics", "Physics and Society", "Space Physics", "MAYBE Plasma Physics", "MAYBE Quantum Algebra", "Quantitative Biology", "Biomolecules", "Cell Behavior", "Genomics", "Molecular Networks", "Neurons and Cognition", "Other Quantitative Biology", "Populations and Evolution", "Quantitative Methods", "Subcellular Processes", "Tissues and Organs", "Computational Finance", "Economics", "General Finance", "Mathematical Finance", "Portfolio Management", "Pricing of Securities", "Risk Management", "Statistical Finance", "Trading and Market Microstructure", "Quantum Physics", "MAYBE Solvable Integrable Systems", "Applications", "Computation", "Methodology", "Machine Learning", "Other Statistics", "ALIAS Statistics Theory", "MAYBE Superconductivity"}];


ArXivTopCategories[cut_Integer:172]/;cut<=172:=ArXivCategoriesTop[cut]=
				Take[ReverseSort@Counts[Values[arXivCategoriesPrimaryAssoc[All]]],cut]


ArXivTopCategories[All]:=ArXivTopCategories[All]=ArXivTopCategories[];


(*the following cases should be addressed through ArXivDatasetAggregate||prefix=="astro-ph"||prefix=="cond-mat"||prefix=="q-bio"*)


ArXivDataset[cat_String]/;(MemberQ[arXivCategoriesUnion,cat](*&&cat!="astro-ph"&&cat!="cond-mat"&&cat!="q-bio"*)):=
			ArXivDataset[cat]=Lookup[arXivDatasetItem,Lookup[GroupBy[Normal@arXivCategoriesPrimaryAssoc[All],Last->First],cat]]


ArXivDataset[{cat_String,All}]/;(MemberQ[arXivCategoriesUnion,cat](*&&cat!="astro-ph"&&cat!="cond-mat"&&cat!="q-bio"*)):=
			ArXivDataset[{cat,All}]=Lookup[arXivDatasetItem,Cases[Normal@arXivCategoriesAssoc[All],HoldPattern[id_String->lc_List?(MemberQ[#,cat]&)]:>id]]


ArXivDatasetLookup[key_String,cat_String]/;(MemberQ[datasetKeys,key](*&&MemberQ[arXivCategoriesUnion,cat]*)):=
			ArXivDatasetLookup[key,cat]=Cases[ArXivDataset[cat],(key->term_):>term,{2}]


ArXivDatasetLookup[key_String,{cat_String,All}]/;(MemberQ[datasetKeys,key](*&&MemberQ[arXivCategoriesUnion,cat]*)):=
			ArXivDatasetLookup[key,{cat,All}]=Cases[ArXivDataset[{cat,All}],(key->term_):>term,{2}]


arXivIDsAssoc[cat_]:=arXivIDsAssoc[cat]=ArXivDatasetLookup["id",cat];


ArXivIDs[cat_]:=arXivIDsAssoc[cat]


arXivCategoriesAssoc[cat_]:=arXivCategoriesAssoc[cat]=
				AssociationThread[ArXivDatasetLookup["id",cat],StringSplit[#," "]&/@ArXivDatasetLookup["categories",cat]]
ArXivCategories[id_String,cat_]:=Lookup[arXivCategoriesAssoc[cat],id]


arXivCategoriesID[cat_]:=arXivCategoriesAssoc[cat]


ArXivCategories[All,cat_]:=arXivCategoriesID[cat]


arXivCategoriesPrimaryAssoc[cat_]:=arXivCategoriesPrimaryAssoc[cat]=Map[First,arXivCategoriesAssoc[cat]];
ArXivCategoriesPrimary[id_String,cat_]:=Lookup[arXivCategoriesPrimaryAssoc[cat],id]


ArXivCategoriesPrimary[All,cat_]:=arXivCategoriesPrimaryAssoc[cat]


(* ::Subsubsection::Closed:: *)
(*Dataset aggregate*)


ArXivDatasetAggregate[prefix_String]:=ArXivDatasetAggregate[prefix]=Block[{databraw},
								databraw=ArXivDataset[#]&/@Flatten@StringCases[arXivCategoriesUnion,prefix~~___];
								DeleteCases[DeleteDuplicates[Flatten[databraw,1]],_ArXivDataset(*to understand*)]]




ArXivDatasetAggregate[{prefix_String,All}]:=ArXivDatasetAggregate[{prefix,All}]=Block[{databraw},
								databraw=ArXivDataset[{#,All}]&/@Flatten@StringCases[arXivCategoriesUnion,prefix~~___];
								DeleteCases[DeleteDuplicates[Flatten[databraw,1]],_ArXivDataset]]

(*ArXivDataset[prefix_String]/;(!MemberQ[arXivCategoriesUnion,prefix](*the following to fix:*)
						||prefix=="astro-ph"||prefix=="cond-mat"||prefix=="q-bio"):=ArXivDatasetAggregate[prefix]*)


(* ::Subsubsection::Closed:: *)
(*Dataset subset*)


ArXivDatasetSubset[idL_List]:=Map[ArXivArticles,idL]


(* ::Subsection:: *)
(*Dataset elements*)


(* ::Subsubsection::Closed:: *)
(*Titles*)


(*Clear[ArXivTitles]*)
arXivTitlesAssoc[cat_]:=arXivTitlesAssoc[cat]=
				AssociationThread[ArXivDatasetLookup["id",cat],ArXivDatasetLookup["title",cat]]


arXivTitlesAssoc[All]:=arXivTitlesAssoc[All]=
				AssociationThread[ArXivDatasetLookup["id"],ArXivDatasetLookup["title"]];


ArXivTitles[id_String]:=Lookup[arXivTitlesAssoc[All],id]


arXivTitlesID[cat_]:=arXivTitlesAssoc[cat]


ArXivTitles[All,cat_]:=arXivTitlesID[cat]


(* ::Subsubsection::Closed:: *)
(*Abstracts*)


(*Clear[ArXivAbstracts]*)
arXivAbstractsAssoc[cat_]:=arXivAbstractsAssoc[cat]=
				AssociationThread[ArXivDatasetLookup["id",cat],ArXivDatasetLookup["abstract",cat]]


arXivAbstractsAssoc[All]:=arXivAbstractsAssoc[All]=
				AssociationThread[ArXivDatasetLookup["id"],ArXivDatasetLookup["abstract"]];


ArXivAbstracts[id_]:=Lookup[arXivAbstractsAssoc[All],id]


arXivAbstractsID[cat_]:=arXivAbstractsAssoc[cat]


ArXivAbstracts[All,cat_]:=arXivAbstractsID[cat]


(* ::Subsubsection::Closed:: *)
(*Versions and date structuring*)


dateDays=dateStrings;


dateMonths=Map[Take[#,2]&,dateStrings];


dateYears=Map[Take[#,1]&,dateStrings];


arXivIDsDated[All,int_:"Month"]:=arXivIDsDated[All,int]=
	Which[  
			int==="Day",AssociationThread[ArXivIDs[All],dateDays],
			int==="Month",AssociationThread[ArXivIDs[All],dateMonths],
			int==="Year",AssociationThread[ArXivIDs[All],dateYears]]
arXivIDsDated[cat_,int_:"Month"]:=arXivIDsDated[cat,int]=AssociationThread[ArXivIDs[cat],Lookup[arXivIDsDated[All,int],ArXivIDs[cat]]]


ArXivDates[All]:=arXivIDsDated[All,"Day"]


ArXivDates[cat_]:=arXivIDsDated[cat,"Day"]


ArXivDates[All,cat_,int_:"Month"]:=arXivIDsDated[cat,int]


arXivVersionsAssoc[cat_]:=arXivVersionsAssoc[cat]=
				AssociationThread[ArXivDatasetLookup["id",cat],ArXivDatasetLookup["versions",cat]]


arXivVersionsAssoc[All]:=arXivVersionsAssoc[All]=
				AssociationThread[ArXivDatasetLookup["id"],ArXivDatasetLookup["versions"]];


ArXivVersions[id_,cat_:All]:=Lookup[arXivVersionsAssoc[cat],id]


(*arXivVersionsID[cat_]:=arXivVersionsAssoc[cat]*)


ArXivVersions[All]=arXivVersionsAssoc[All];


ArXivVersions[All,cat_]:=arXivVersionsAssoc[cat];


(*can be redundant with dateObjects*)


(*Clear[ArXivVersionFirstDate]*)
arXivVersionsFirstDate[cat___]:=
	arXivVersionsFirstDate[cat]=
		Block[{assMonths},
				assMonths=<|"Jan"->1,"Feb"->2,"Mar"->3,"Apr"->4,"May"->5,"Jun"->6,"Jul"->7,"Aug"->8,"Sep"->9,"Oct"->10,"Nov"->11,"Dec"->12|>;
				AssociationThread[ArXivDatasetLookup["id",cat],
				Map[DateObject[#,"Day"]&,
				Map[{ToExpression@#[[3]],assMonths[#[[2]]],ToExpression@#[[1]]}&,
				Map[StringSplit[StringDrop[StringDrop[#,-13],5]]&,
				Last/@Last/@First/@ArXivDatasetLookup["versions",cat]]]]]]


ArXivVersionsFirstDate[id_,cat___]:=Lookup[arXivVersionsFirstDate[cat],id]


arXivVersionsFirstID[cat_]:=arXivVersionsFirstDate[cat]
arXivVersionsFirstID[All]:=arXivVersionsFirstID[All]=arXivVersionsFirstDate[];


arXivDatasetDated[cat_][int_]/;cat=!=All:=
	(*arXivDatasetDated[cat][int]=*)
	Block[{catF,invcasF,categNameF},
	catF[arg_]:=Which[Head[cat]===String,
					First/@StringSplit/@ArXivDatasetLookup["categories",arg],
					Head[cat]===List,
					StringSplit/@ArXivDatasetLookup["categories",arg]];
	categNameF[argcat_String]:=
			Which[MemberQ[arXivCategoriesUnion,argcat]&&argcat!="cond-mat"&&argcat!="astro-ph",
						argcat,
						!(MemberQ[arXivCategoriesUnion,argcat]&&argcat!="cond-mat"&&argcat!="astro-ph"),
						Alternatives@@Flatten@StringCases[arXivCategoriesUnion,argcat~~__]];
	invcasF[arg_]:=Transpose@{ArXivDatasetLookup["id",arg],catF[arg]};
	Map[Lookup[
			arXivDatasetItem,
			First/@
			Which[
			Head[cat]===String,Cases[invcasF[#],{_,categNameF[cat]}],
			Head[cat]===List,Cases[invcasF[#],{_,_List?(MemberQ[#,categNameF@cat[[1]]]&)}]]]&,
					arXivDatasetDated[All][int]]]


(*mostly redundant*)


(*arXivVersionsFirstID is the only that deserves to survives*)


(*gives arrors*)


(*really useful?*)
(*arXivDates[cat___]["Day"]:=AssociationThread[arXivIDsAssoc[cat],Values[arXivVersionFirstDate[cat]]]
arXivDates[cat___]["Month"]:=Map[DateObject[Drop[Part[#,1],-1],"Month"]&,AssociationThread[arXivIDsAssoc[cat],Values[arXivVersionsFirstDate[cat]]]]
arXivDates[cat___]["Year"]:=Map[DateObject[Drop[Part[#,1],-2],"Year"]&,AssociationThread[arXivIDsAssoc[cat],Values[arXivVersionsFirstDate[cat]]]]*)


(* ::Subsubsection::Closed:: *)
(*Author functionality*)


(*Clear[ArXivAuthors]*)
arXivAuthorsAssoc[cat_]:=arXivAuthorsAssoc[cat]=
							AssociationThread[ArXivDatasetLookup["id",cat],
								DeleteCases[Map[
									StringReplace[#,{(StartOfString ~~Whitespace) | (Whitespace ~~ EndOfString) :> "",
											("The BABAR Collaboration: B. Aubert, et al"|"The BABAR Collaboration, B. Aubert, et al")->"BABAR Collaboration"}]&,
	                                     
											Map[Sequence@@@
													StringSplit[#,{" and ",","}]&,StringReplace[#,", and "->" , "]&/@
															StringDelete[#,{"("~~__~~")","\n"}]&/@ArXivDatasetLookup["authors",cat]]
													],"",{2}]]
													
arXivAuthorsAssoc[All]:=arXivAuthorsAssoc[All]=
							AssociationThread[ArXivDatasetLookup["id"],
								DeleteCases[Map[
									StringReplace[#,{(StartOfString ~~Whitespace) | (Whitespace ~~ EndOfString) :> "",
											("The BABAR Collaboration: B. Aubert, et al"|"The BABAR Collaboration, B. Aubert, et al")->"BABAR Collaboration"}]&,
	                                     
											Map[Sequence@@@
													StringSplit[#,{" and ",","}]&,StringReplace[#,", and "->" , "]&/@
															StringDelete[#,{"("~~__~~")","\n"}]&/@ArXivDatasetLookup["authors"]]
													],"",{2}]];
													
arXivAuthorsID[cat_]:=arXivAuthorsAssoc[cat]


ArXivAuthors[id_,cat_:All]:=Lookup[arXivAuthorsAssoc[cat],id]


ArXivAuthors[All,cat_]:=arXivAuthorsID[cat]


(*Clear[arXivAuthorsTop]*)
ArXivTopAuthors[cat_,cut_Integer]:=ArXivTopAuthors[cat,cut]=
										Cases[Normal@ReverseSort@Counts@Flatten[Values@arXivAuthorsAssoc[cat]],
												HoldPattern[_String->_Integer?(#>cut&)]]


ArXivArticlesAuthor[author_String]/;MemberQ[Flatten@Values@Take[arXivAuthorsAssoc[All]],author]:=ArXivArticlesAuthor[author]=
										<|author->
										Cases[List@@@Normal@arXivAuthorsAssoc[All],
												{id_String,{author}}|{id_String,{author,__}}|{id_String,{__,author}}|{id_String,{__,author,__}}
												:>id
												]|>

ArXivArticlesAuthor[author_String,cat_:All]/;(MemberQ[Flatten@Values@Take[arXivAuthorsAssoc[cat]],author]):=
							ArXivArticlesAuthor[author,cat]=
										<|author->
										Cases[List@@@Normal@arXivAuthorsAssoc[cat],
												{id_String,{author}}|{id_String,{author,__}}|{id_String,{__,author}}|{id_String,{__,author,__}}
												:>id
												]|>
												
ArXivArticlesAuthor[authors_List,cat___]:=Merge[Map[ArXivArticlesAuthor[#,cat]&,authors],First]

ArXivArticlesAuthor[author_String,catL_List]:=Merge[Map[ArXivArticlesAuthor[author,#]&,catL],Flatten]

ArXivArticlesAuthor[authors_List,catL_List]:=Merge[MapThread[ArXivArticlesAuthor[#1,#2]&,{authors,catL}],Flatten]


arXivStoreAuthors=
EntityStore["ArXivAuthor"-><|
"EntityValidationFunction"->StringQ,
"Properties"-><|
"Label"-><|
"DefaultFunction"->CanonicalName
|>,
"Names"-><|
"DefaultFunction"->Function[entity,{}]
|>,
"Categories"-><|
"DefaultFunction"->Function[entity,All]
|>,
"Articles"-><|
"DefaultFunction"->Function[entity,{}]
|>
|>
|>];


EntityRegister[arXivStoreAuthors];


ArXivRegisterAuthor[label_String,authorS_String,cat_]:=(Entity["ArXivAuthor",label]["Names"]={authorS};Entity["ArXivAuthor",label]["Categories"]={cat};Entity["ArXivAuthor",label]["Articles"]=Union@Flatten@Values@ArXivArticlesAuthor[authorS,cat];Entity["ArXivAuthor",label])


ArXivRegisterAuthor[label_String,authorL_List]:=(Entity["ArXivAuthor",label]["Names"]=authorL;Entity["ArXivAuthor",label]["Articles"]=Union@Flatten@Values@ArXivArticlesAuthor[authorL];Entity["ArXivAuthor",label])


ArXivRegisterAuthor[label_String,authorL_List,catL_List]:=(Entity["ArXivAuthor",label]["Names"]=authorL;Entity["ArXivAuthor",label]["Categories"]=catL;Entity["ArXivAuthor",label]["Articles"]=Union@Flatten@Values@ArXivArticlesAuthor[authorL,catL];Entity["ArXivAuthor",label])


ArXivArticlesAuthor[author_Entity]:=EntityValue[author,"Articles"]


(* ::Section:: *)
(*4. Word statistics*)


(* ::Subsection::Closed:: *)
(*Total articles trends*)


ArXivArticlesTrend[cat_,int_:"Month"]:=
					ArXivArticlesTrend[cat,int]=
					Block[{groupBy},
					groupBy=GroupBy[List@@@Normal@arXivIDsDated[cat,int],Last->First];
					Map[Length,groupBy]]


(* ::Subsection:: *)
(*Cleaning words new*)


(*why memoisation not effective?*)


(* ::Subsubsection::Closed:: *)
(*Cleaned - ID*)


(*we should not delete punctuation, especially for distinguishing sentences*)


arXivTitlesTextWordsID[cat_]:=arXivTitlesTextWordsID[cat]=
		ParallelMap[ToLowerCase@TextWords@#&,arXivTitlesID[cat]]


Options[arXivTitlesCleanID]={"Stopwords"->True,"Dollar"->True};


arXivTitlesCleanID[cat_,OptionsPattern[arXivTitlesCleanID]]:=
	arXivTitlesCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
	Which[
			OptionValue["Dollar"]&&OptionValue["Stopwords"],
			arXivTitlesTextWordsID[cat],
			OptionValue["Dollar"]&&!OptionValue["Stopwords"],
			ParallelMap[DeleteStopwords@#&,arXivTitlesTextWordsID[cat]],
			!OptionValue["Dollar"]&&OptionValue["Stopwords"],
			ParallelMap[DeleteCases[#,"$"]&,arXivTitlesTextWordsID[cat]],
			!OptionValue["Dollar"]&&!OptionValue["Stopwords"],
			ParallelMap[DeleteCases[DeleteStopwords@#,"$"]&,arXivTitlesTextWordsID[cat]]]


arXivAbstractsTextWordsID[cat_]:=arXivAbstractsTextWordsID[cat]=
		ParallelMap[ToLowerCase@TextWords@#&,arXivAbstractsID[cat]]


Options[arXivAbstractsCleanID]={"Stopwords"->True,"Dollar"->True};
arXivAbstractsCleanID[cat_,OptionsPattern[arXivAbstractsCleanID]]:=
	arXivAbstractsCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
	Which[
			OptionValue["Dollar"]&&OptionValue["Stopwords"],
			arXivAbstractsTextWordsID[cat],
			OptionValue["Dollar"]&&!OptionValue["Stopwords"],
			ParallelMap[DeleteStopwords@#&,arXivAbstractsTextWordsID[cat]],
			!OptionValue["Dollar"]&&OptionValue["Stopwords"],
			ParallelMap[DeleteCases[#,"$"]&,arXivAbstractsTextWordsID[cat]],
			!OptionValue["Dollar"]&&!OptionValue["Stopwords"],
			ParallelMap[DeleteCases[DeleteStopwords@#,"$"]&,arXivAbstractsTextWordsID[cat]]]


(* ::Subsubsection::Closed:: *)
(*Cleaned - date*)


(*arXivIDsDated[cat_,int_:"Month"]:=arXivIDsDated[cat,int]=ParallelMap[ArXivDatasetLookup["id",#]&,arXivDatasetDated[cat][int]]*)


(*arXivDateObjectsID=AssociationThread[ArXivDatasetLookup["id"],dateObjects];*)


Options[arXivTitlesCleanDated]={"Stopwords"->False,"Dollar"->False};
arXivTitlesCleanDated[cat_,int___:"Month",OptionsPattern[arXivTitlesCleanDated]]:=
			arXivTitlesCleanDated[cat,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
						Block[{groupBy},
							groupBy=GroupBy[List@@@Normal@arXivIDsDated[cat,int],Last->First];	
							AssociationThread[Keys[groupBy],	
								Map[Lookup[
									arXivTitlesCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]],
											#]&,Values@groupBy]]]


Options[arXivAbstractsCleanDated]={"Stopwords"->False,"Dollar"->False};
arXivAbstractsCleanDated[cat_,int___:"Month",OptionsPattern[arXivAbstractsCleanDated]]:=
			arXivAbstractsCleanDated[cat,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
						Block[{groupBy},
							groupBy=GroupBy[List@@@Normal@arXivIDsDated[cat,int],Last->First];	
							AssociationThread[Keys[groupBy],	
								Map[Lookup[
									arXivAbstractsCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]],
											#]&,Values@groupBy]]]


(*to compare with arXivTitlesCleanDated*)


(* ::Subsubsection::Closed:: *)
(*As option*)


Options[ArXivTitles]={"Cleaned"->False,"Dated"->False};


ArXivTitles[All,cat_,OptionsPattern[ArXivTitles]]:=
							Which[!OptionValue["Dated"]&&!OptionValue["Cleaned"],	
								ArXivTitles[All,cat],
								!OptionValue["Dated"]&&OptionValue["Cleaned"],
								arXivTitlesCleanID[cat,"Stopwords"->True,"Dollar"->True],
								OptionValue["Dated"]&&OptionValue["Cleaned"],
								arXivTitlesCleanDated[cat,"Month","Stopwords"->False,"Dollar"->False]]


Options[ArXivAbstracts]={"Cleaned"->False,"Dated"->False};


ArXivAbstracts[All,cat_,OptionsPattern[ArXivAbstracts]]:=
							Which[!OptionValue["Dated"]&&!OptionValue["Cleaned"],	
								ArXivAbstracts[All,cat],
								!OptionValue["Dated"]&&OptionValue["Cleaned"],
								arXivAbstractsCleanID[cat,"Stopwords"->True,"Dollar"->True],
								OptionValue["Dated"]&&OptionValue["Cleaned"],
								arXivAbstractsCleanDated[cat,"Month","Stopwords"->False,"Dollar"->False]]


(* ::Subsection::Closed:: *)
(*Single word counting*)


(*rigorous because cut off infinite*)


Options[arXivTitlesWordsTop]={"Stopwords"->False,"Dollar"->False};
arXivTitlesWordsTop[cat_,cut_Integer,OptionsPattern[arXivTitlesWordsTop]]:=
	arXivTitlesWordsTop[cat,cut,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Take[ReverseSort@Counts@Flatten@Values@arXivTitlesCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]],UpTo@cut]


Options[arXivAbstractsWordsTop]={"Stopwords"->False,"Dollar"->False};
arXivAbstractsWordsTop[cat_,cut_Integer,OptionsPattern[arXivAbstractsWordsTop]]:=
	arXivAbstractsWordsTop[cat,cut,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Take[ReverseSort@Counts@Flatten@Values@arXivAbstractsCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]],UpTo@cut]


Options[ArXivTopTitles]={"Stopwords"->False,"Dollar"->False};


Options[ArXivTopAbstracts]={"Stopwords"->False,"Dollar"->False};


ArXivTopTitles[cat_,cut_Integer,OptionsPattern[ArXivTopTitles]]:=arXivTitlesWordsTop[cat,cut,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]


ArXivTopAbstracts[cat_,cut_Integer,OptionsPattern[ArXivTopAbstracts]]:=arXivAbstractsWordsTop[cat,cut,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]


Options[arXivTitlesWordID]={"Stopwords"->False,"Dollar"->False};
arXivTitlesWordID[cat_,word_String,OptionsPattern[arXivTitlesWordID]]:=
	arXivTitlesWordID[cat,word,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Association@Cases[
			Normal@arXivTitlesCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]],
						HoldPattern[_String->_List?(MemberQ[#,word]&)]]
Options[arXivAbstractsWordID]={"Stopwords"->False,"Dollar"->False};
arXivAbstractsWordID[cat_,word_String,OptionsPattern[arXivAbstractsWordID]]:=
	arXivAbstractsWordID[cat,word,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Association@Cases[
			Normal@arXivAbstractsCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]],
						HoldPattern[_String->_List?(MemberQ[#,word]&)]]


Options[arXivTitlesWordDated]={"Stopwords"->False,"Dollar"->False};
arXivTitlesWordDated[cat_,word_String,OptionsPattern[arXivTitlesWordDated]]:=
	arXivTitlesWordDated[cat,word,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Map[Cases[#,_List?(MemberQ[#,word]&)]&,
			arXivTitlesCleanDated[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]]
Options[arXivAbstractsWordDated]={"Stopwords"->False,"Dollar"->False};
arXivAbstractsWordDated[cat_,word_String,OptionsPattern[arXivAbstractsWordDated]]:=
	arXivAbstractsWordDated[cat,word,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Map[Cases[#,_List?(MemberQ[#,word]&)]&,
			arXivAbstractsCleanDated[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]]


Options[arXivTitlesWordTrend]={"Stopwords"->False,"Dollar"->False};

arXivTitlesWordTrend[cat_,cut_(*:\[Infinity]*),int_:"Month",OptionsPattern[arXivTitlesWordTrend]]:=
	arXivTitlesWordTrend[cat,cut,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Map[Take[ReverseSort@Counts@Flatten[#,1],UpTo[cut]]&,
				arXivTitlesCleanDated[cat,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]
				]
arXivTitlesWordTrend[cat_,word_String,int_:"Month",OptionsPattern[arXivTitlesWordTrend]]:=
	arXivTitlesWordTrend[cat,word,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		(*<|word->*)Map[Lookup[#,word]&,
				arXivTitlesWordTrend[cat,\[Infinity],int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]
				](*|>*)
				
(*error below???*)
(*arXivTitlesWordTrend[cat_,word_Or(*error???*),int_:"Month",OptionsPattern[arXivTitlesWordTrend]]:=
	arXivTitlesWordTrend[cat,word,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Merge[Map[ArXivTitlesWordTrend[cat,#,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]&,List@@word],Total]*)


Options[arXivAbstractsWordTrend]={"Stopwords"->False,"Dollar"->False};

arXivAbstractsWordTrend[cat_,cut_(*:\[Infinity]*),int_:"Month",OptionsPattern[arXivAbstractsWordTrend]]:=
	arXivAbstractsWordTrend[cat,cut,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Map[Take[ReverseSort@Counts@Flatten[#,1],UpTo[cut]]&,
				arXivAbstractsCleanDated[cat,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]
				]
arXivAbstractsWordTrend[cat_,word_String,int_:"Month",OptionsPattern[arXivAbstractsWordTrend]]:=
	arXivAbstractsWordTrend[cat,word,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		(*<|word->*)Map[Lookup[#,word]&,
				arXivAbstractsWordTrend[cat,\[Infinity],int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]
				](*|>*)
				

(*error below???*)
(*arXivAbstractsWordTrend[cat_,word_Or,int_:"Month",OptionsPattern[arXivAbstractsWordTrend]]:=
	arXivAbstractsWordTrend[cat,word,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Merge[Map[arXivAbstractsWordTrend[cat,#,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]&,List@@word],Total]*)


(* ::Subsection:: *)
(*Neighbour words*)


(* ::Subsubsection::Closed:: *)
(*Titles*)


Options[arXivTitlesWordNeighboursID]={"Stopwords"->False,"Dollar"->False};

arXivTitlesWordNeighboursID[cat_,n_Integer:2,OptionsPattern[arXivTitlesWordNeighboursID]]:=
	arXivTitlesWordNeighboursID[cat,n,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{resultAsList,resultAsString},
			resultAsList=Map[Partition[#,n,1]&,arXivTitlesCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]];
			resultAsString=Map[StringRiffle,resultAsList,{2}]]
			
arXivTitlesWordNeighboursID[cat_,word_String,OptionsPattern[arXivTitlesWordNeighboursID]]:=
	arXivTitlesWordNeighboursID[cat,word,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{length},
			length=Length@StringSplit[word];
			Association@Cases[Normal@arXivTitlesWordNeighboursID[cat,length],HoldPattern[_String->_List?(MemberQ[#,word]&)]]]


Options[arXivTitlesWordNeighboursTop]={"Stopwords"->False,"Dollar"->False};
arXivTitlesWordNeighboursTop[cat_,n_Integer:2,cut_Integer:10000,OptionsPattern[arXivTitlesWordNeighboursTop]]:=
	arXivTitlesWordNeighboursTop[cat,n,cut,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Take[ReverseSort@Counts@Flatten[
					Values[arXivTitlesWordNeighboursID[cat,n,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]],
										1],UpTo[cut]]


ArXivTopTitles[cat_,cut_Integer,n_Integer,OptionsPattern[ArXivTopTitles]]:=arXivTitlesWordNeighboursTop[cat,n,cut,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]


Options[arXivTitlesWordNeighboursDated]={"Stopwords"->False,"Dollar"->False};
arXivTitlesWordNeighboursDated[cat_,n_Integer:2,int_:"Month",OptionsPattern[arXivTitlesWordNeighboursDated]]:=
	arXivTitlesWordNeighboursDated[cat,n,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{resultAsList,resultAsString},
			resultAsList=Map[Partition[#,n,1]&,arXivTitlesCleanDated[cat,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]],{2}];
			resultAsString=Map[StringRiffle,resultAsList,{3}]]
		


arXivTitlesWordNeighboursTrend[cat_,n_Integer:2,cut_Integer:10000,int_:"Month"]:=
	arXivTitlesWordNeighboursTrend[cat,n,int]=
		Map[Take[ReverseSort@Counts@Flatten[#,1],UpTo[cut]]&,
				arXivTitlesWordNeighboursDated[cat,n,int,"Stopwords"->False,"Dollar"->False]
				]
				
arXivTitlesWordNeighboursTrend[cat_,wordNeigh_String,int_:"Month"]:=
	arXivTitlesWordNeighboursTrend[cat,wordNeigh,int]=
		Block[{lengthNeigh},
				lengthNeigh=Length@StringSplit[wordNeigh];
				(*<|string->*)
					Map[Lookup[#,wordNeigh]&,arXivTitlesWordNeighboursTrend[cat,lengthNeigh,int]](*|>*)
				]
				
(*arXivTitlesWordNeighboursTrend[cat_,wordNeigh_Or,int_:"Month"]:=
	arXivTitlesWordNeighboursTrend[cat,wordNeigh,int]=
		Merge[Map[arXivTitlesWordNeighboursTrend[cat,#,int]&,List@@wordNeigh],Total]*)


(* ::Subsubsection::Closed:: *)
(*Abstracts*)


Options[arXivAbstractsWordNeighboursID]={"Stopwords"->False,"Dollar"->False};
arXivAbstractsWordNeighboursID[cat_,n_Integer:2,OptionsPattern[arXivAbstractsWordNeighboursID]]:=
	arXivAbstractsWordNeighboursID[cat,n,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{resultAsList,resultAsString},
			resultAsList=ParallelMap[Partition[#,n,1]&,arXivAbstractsCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]];
			resultAsString=ParallelMap[StringRiffle,resultAsList,{2}]]
			
arXivAbstractsWordNeighboursID[cat_,word_String,OptionsPattern[arXivAbstractsWordNeighboursID]]:=
	arXivAbstractsWordNeighboursID[cat,word,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{length},
			length=Length@StringSplit[word];
			Association@Cases[Normal@arXivAbstractsWordNeighboursID[cat,length],HoldPattern[_String->_List?(MemberQ[#,word]&)]]]


Options[arXivAbstractsWordNeighboursTop]={"Stopwords"->False,"Dollar"->False};
arXivAbstractsWordNeighboursTop[cat_,n_Integer:2,cut_Integer:10000,OptionsPattern[arXivAbstractsWordNeighboursTop]]:=
	arXivAbstractsWordNeighboursTop[cat,n,cut,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Take[ReverseSort@Counts@Flatten[Values[arXivAbstractsWordNeighboursID[cat,n,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]],1],UpTo[cut]]


ArXivTopAbstracts[cat_,cut_Integer,n_Integer,OptionsPattern[ArXivTopAbstracts]]:=arXivAbstractsWordNeighboursTop[cat,n,cut,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]


Options[arXivAbstractsWordNeighboursDated]={"Stopwords"->False,"Dollar"->False};
arXivAbstractsWordNeighboursDated[cat_,n_Integer:2,int_:"Month",OptionsPattern[arXivAbstractsWordNeighboursDated]]:=
	arXivAbstractsWordNeighboursDated[cat,n,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{resultAsList,resultAsString},
			resultAsList=Map[Partition[#,n,1]&,arXivAbstractsCleanDated[cat,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]],{2}];
			resultAsString=Map[StringRiffle,resultAsList,{3}]]


Options[arXivAbstractsWordNeighboursTrend]={"Stopwords"->False,"Dollar"->False};

arXivAbstractsWordNeighboursTrend[cat_,n_Integer:2,cut_Integer:10000,int_:"Month",OptionsPattern[arXivAbstractsWordNeighboursTrend]]:=
	arXivAbstractsWordNeighboursTrend[cat,n,cut,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Map[Take[ReverseSort@Counts@Flatten[#,1],UpTo[cut]]&,arXivAbstractsWordNeighboursDated[cat,n,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]]

arXivAbstractsWordNeighboursTrend[cat_,string_String,cut_Integer:10000,int_:"Month",OptionsPattern[arXivAbstractsWordNeighboursTrend]]:=
	arXivAbstractsWordNeighboursTrend[cat,string,cut,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{lengthNeigh},
				lengthNeigh=Length@StringSplit[string];
				(*<|string->*)
					Map[Lookup[#,string]&,arXivAbstractsWordNeighboursTrend[cat,lengthNeigh,cut,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]](*|>*)
				]
				
(*arXivAbstractsWordNeighboursTrend[cat_,wordNeigh_Or,cut_:10000,int_:"Month",OptionsPattern[arXivAbstractsWordNeighboursTrend]]:=
	arXivAbstractsWordNeighboursTrend[cat,wordNeigh,cut,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Merge[Map[arXivAbstractsWordNeighboursTrend[cat,#,cut,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]&,List@@wordNeigh],Total]*)


(* ::Subsection:: *)
(*Combination words *)


(* ::Subsubsection::Closed:: *)
(*Titles combinations*)


Options[arXivTitlesWordCombinationID]={"Stopwords"->False,"Dollar"->False};
(*Options[arXivTitlesWordNeighCombinationID]={"Stopwords"->False,"Dollar"->False};
*)Options[arXivTitlesWordCombinationDated]={"Stopwords"->False,"Dollar"->False};
Options[arXivTitlesWordCombinationTrend]={"Stopwords"->False,"Dollar"->False};


(*arXivTitlesWordCombinationID[cat_,wordComb_And,OptionsPattern[arXivTitlesWordCombinationID]]:=
	arXivTitlesWordCombinationID[cat,wordComb,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{cleanA,mq},
		cleanA=arXivTitlesCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]];
		mq[arg_]:=And@@Map[MemberQ[arg,#]&,List@@wordComb];
		Association@Cases[Normal@cleanA,HoldPattern[_String->_List?(mq[#]&)]]]*)


arXivTitlesWordCombinationID[cat_,wordAnd_And,OptionsPattern[arXivTitlesWordCombinationID]]:=
	arXivTitlesWordCombinationID[cat,wordAnd,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{cleanA,mq},
		cleanA=arXivTitlesCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]];
		mq[arg_]:=And@@Map[MemberQ[If[Length[StringSplit[#]]==1,arg,StringRiffle/@Partition[arg,2,1]],#]&,List@@wordAnd];
		Association@Cases[Normal@cleanA,HoldPattern[_String->_List?(mq[#]&)]]]


arXivTitlesWordCombinationID[cat_,wordAndOr:And[___,PatternSequence[_Or..],___],OptionsPattern[arXivTitlesWordCombinationID]]:=
	(*arXivTitlesWordCombinationID[cat,wordAnd,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=*)
		Block[{cleanA,mq},
		cleanA=arXivTitlesCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]];
		mq[arg_]:=And@@Map[
	If[Head[#]===String,
		MemberQ[If[Length[StringSplit[#]]==1,arg,StringRiffle/@Partition[arg,2,1]],#],
		Or@@Map[If[Length[StringSplit[#]]==1,MemberQ[arg,#],MemberQ[StringRiffle/@Partition[arg,2,1],#]]&,(List@@#)]]
		&,List@@wordAndOr];
		Association@Cases[Normal@cleanA,HoldPattern[_String->_List?(mq[#]&)]]]


arXivTitlesWordCombinationID[cat_,wordOr_Or,OptionsPattern[arXivTitlesWordCombinationID]]:=
	arXivTitlesWordCombinationID[cat,wordOr,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{cleanA,mq},
		cleanA=arXivTitlesCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]];
		mq[arg_]:=Or@@Map[MemberQ[If[Length[StringSplit[#]]==1,arg,StringRiffle/@Partition[arg,2,1]],#]&,List@@wordOr];
		Association@Cases[Normal@cleanA,HoldPattern[_String->_List?(mq[#]&)]]]


arXivTitlesWordCombinationID[cat_,wordXor_Xor,OptionsPattern[arXivTitlesWordCombinationID]]:=
	arXivTitlesWordCombinationID[cat,wordXor,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{cleanA,mq},
		cleanA=arXivTitlesCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]];
		mq[arg_]:=Xor@@Map[MemberQ[If[Length[StringSplit[#]]==1,arg,StringRiffle/@Partition[arg,2,1]],#]&,List@@wordXor];
		Association@Cases[Normal@cleanA,HoldPattern[_String->_List?(mq[#]&)]]]


arXivTitlesWordCombinationDated[cat_,wordComb_,int_:"Month",OptionsPattern[arXivTitlesWordCombinationDated]]:=
	arXivTitlesWordCombinationDated[cat,wordComb,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{cleanA,mq},
		cleanA=arXivTitlesCleanDated[cat,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]];
		mq[arg_]:=Apply[Head[wordComb],Map[MemberQ[If[Length[StringSplit[#]]==1,arg,StringRiffle/@Partition[arg,2,1]],#]&,List@@wordComb]];
		AssociationThread[Keys@cleanA,
		Map[Cases[#,_?(mq[#]&)]&,Values@cleanA]]]


arXivTitlesWordCombinationDated[cat_,wordAndOr:And[___,PatternSequence[_Or..],___],int_:"Month",OptionsPattern[arXivTitlesWordCombinationDated]]:=
	(*arXivTitlesWordCombinationDated[cat,wordComb,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=*)
		Block[{cleanA,mq},
		cleanA=arXivTitlesCleanDated[cat,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]];
		mq[arg_]:=And@@Map[
	If[Head[#]===String,
		MemberQ[If[Length[StringSplit[#]]==1,arg,StringRiffle/@Partition[arg,2,1]],#],
		Or@@Map[If[Length[StringSplit[#]]==1,MemberQ[arg,#],MemberQ[StringRiffle/@Partition[arg,2,1],#]]&,(List@@#)]]
		&,List@@wordAndOr];
		AssociationThread[Keys@cleanA,
		Map[Cases[#,_?(mq[#]&)]&,Values@cleanA]]]


arXivTitlesWordCombinationTrend[cat_,wordComb_,int_:"Month",OptionsPattern[arXivTitlesWordCombinationTrend]]:=
	arXivTitlesWordCombinationTrend[cat,wordComb,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		 Map[Length,arXivTitlesWordCombinationDated[cat,wordComb,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]]


(* ::Subsubsection::Closed:: *)
(*Abstracts combinations*)


Options[arXivAbstractsWordCombinationID]={"Stopwords"->False,"Dollar"->False};
(*Options[arXivAbstractsWordNeighCombinationID]={"Stopwords"->False,"Dollar"->False};
*)Options[arXivAbstractsWordCombinationDated]={"Stopwords"->False,"Dollar"->False};
Options[arXivAbstractsWordCombinationTrend]={"Stopwords"->False,"Dollar"->False};


arXivAbstractsWordCombinationID[cat_,wordComb_,OptionsPattern[arXivAbstractsWordCombinationID]]:=
	arXivAbstractsWordCombinationID[cat,wordComb,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{cleanA,mq},
		cleanA=arXivAbstractsCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]];
		mq[arg_]:=Apply[Head[wordComb],Map[MemberQ[If[Length[StringSplit[#]]==1,arg,StringRiffle/@Partition[arg,2,1]],#]&,List@@wordComb]];
		Association@Cases[Normal@cleanA,HoldPattern[_String->_List?(mq[#]&)]]]


arXivAbstractsWordCombinationID[cat_,wordAndOr:And[___,PatternSequence[_Or..],___],OptionsPattern[arXivTitlesWordCombinationID]]:=
	(*arXivTitlesWordCombinationID[cat,wordAndOr,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=*)
		Block[{cleanA,mq},
		cleanA=arXivAbstractsCleanID[cat,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]];
		mq[arg_]:=And@@Map[
	If[Head[#]===String,
		MemberQ[If[Length[StringSplit[#]]==1,arg,StringRiffle/@Partition[arg,2,1]],#],
		Or@@Map[If[Length[StringSplit[#]]==1,MemberQ[arg,#],MemberQ[StringRiffle/@Partition[arg,2,1],#]]&,(List@@#)]]
		&,List@@wordAndOr];
		Association@Cases[Normal@cleanA,HoldPattern[_String->_List?(mq[#]&)]]]


arXivAbstractsWordCombinationDated[cat_,wordComb_,int_:"Month",OptionsPattern[arXivAbstractsWordCombinationDated]]:=
	arXivAbstractsWordCombinationDated[cat,wordComb,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Block[{cleanA,mq},
		cleanA=arXivAbstractsCleanDated[cat,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]];
		mq[arg_]:=Apply[Head[wordComb],Map[MemberQ[If[Length[StringSplit[#]]==1,arg,StringRiffle/@Partition[arg,2,1]],#]&,List@@wordComb]];
		AssociationThread[Keys@cleanA,
		Map[Cases[#,_?(mq[#]&)]&,Values@cleanA]]]


arXivAbstractsWordCombinationDated[cat_,wordAndOr:And[___,PatternSequence[_Or..],___],int_:"Month",OptionsPattern[arXivAbstractsWordCombinationDated]]:=
	(*arXivAbstractsWordCombinationDated[cat,wordAndOr,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=*)
		Block[{cleanA,mq},
		cleanA=arXivAbstractsCleanDated[cat,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]];
		mq[arg_]:=And@@Map[
	If[Head[#]===String,
		MemberQ[If[Length[StringSplit[#]]==1,arg,StringRiffle/@Partition[arg,2,1]],#],
		Or@@Map[If[Length[StringSplit[#]]==1,MemberQ[arg,#],MemberQ[StringRiffle/@Partition[arg,2,1],#]]&,(List@@#)]]
		&,List@@wordAndOr];
		AssociationThread[Keys@cleanA,
		Map[Cases[#,_?(mq[#]&)]&,Values@cleanA]]]


arXivAbstractsWordCombinationTrend[cat_,wordComb_,int_:"Month",OptionsPattern[arXivAbstractsWordCombinationTrend]]:=
	arXivAbstractsWordCombinationTrend[cat,wordComb,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		 Map[Length,arXivAbstractsWordCombinationDated[cat,wordComb,int,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]]


(*below to do*)


(*just fix a word or pair of words and look how frequently other words pair with them*)


(*ArXivAbstractsCombinationCount[cat_,cut_Integer,int_:"Month"]:=ArXivAbstractsCombinationCount[cat,cut,int]=
					Block[{keyCombs},
					keyCombs=Tuples[Keys@arXivAbstractsWordsTop[cat,cut,int],{2}];
					Map[ArXivAbstractsCombinationCount[cat,#,int]&,keyCombs]]*)


(*ArXivAbstractsCombinationsTop[cat_,cut_Integer,int_:"Month"]:=ArXivAbstractsCombinationsTop[cat,cut,int]=
					ReverseSort@Merge[Values@ArXivAbstractsCombinationCount[cat,cut,int],Total]*)


(* ::Subsection::Closed:: *)
(*ArXiv Logos*)


Options[ArXivLogosTitles]={"Dated"->False};


ArXivLogosTitles[word_,cat_,OptionsPattern[ArXivLogosTitles]]:=
							If[!OptionValue["Dated"],	
								If[Head[word]===String,
									If[Length[StringSplit[word]]==1,
										arXivTitlesWordID[cat,word],
										arXivTitlesWordNeighboursID[cat,word]],
									arXivTitlesWordCombinationID[cat,word]],
								If[Head[word]===String,
									If[Length[StringSplit[word]]==1,
										arXivTitlesWordDated[cat,word],
										arXivTitlesWordNeighboursDated[cat,word]],
									arXivTitlesWordCombinationDated[cat,word]]]


Options[ArXivLogosAbstracts]={"Dated"->False};


ArXivLogosAbstracts[word_,cat_,OptionsPattern[ArXivLogosAbstracts]]:=
							If[!OptionValue["Dated"],
								If[Head[word]===String,
									If[Length[StringSplit[word]]==1,
										arXivAbstractsWordID[cat,word],
										arXivAbstractsWordNeighboursID[cat,word]],
									arXivAbstractsWordCombinationID[cat,word]],
									If[Head[word]===String,
									If[Length[StringSplit[word]]==1,
										arXivAbstractsWordDated[cat,word],
										arXivAbstractsWordNeighboursDated[cat,word]],
									arXivAbstractsWordCombinationDated[cat,word]]]


(* ::Subsection::Closed:: *)
(*ArXiv Plot*)


ArXivPlot[All,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[KeyMap[DateObject,ArXivArticlesTrend[cat,"Month"]],options]


(*there is maybe issue with the division by ArXivArticlesTrend in Merge*)


arXivPlotWordKernel[word_String,cat_,part_(*,int_:"Month",cut_Integer:1000*)]:=
	Block[{wordRank,wordTrend(*,int="Month"*)},
			wordRank=Length@StringSplit[word];
			wordTrend=Which[part==="Titles",
							If[wordRank==1,arXivTitlesWordTrend[cat,word(*,int*)],arXivTitlesWordNeighboursTrend[cat,word,"Month"]],
							part==="Abstracts",
							If[wordRank==1,arXivAbstractsWordTrend[cat,word(*,int*)],arXivAbstractsWordNeighboursTrend[cat,word,10000,"Month"]]];
			KeyMap[DateObject,DeleteMissing@
							Merge[{wordTrend,ArXivArticlesTrend[cat,"Month"]},N@Divide[#[[1]],#[[2]]]&]
							]]
							
arXivPlotWordKernel[All,word_String,cat_,part_(*,int_:"Month",cut_Integer:1000*)]:=
	Block[{wordRank,wordTrend(*,int="Month"*)},
			wordRank=Length@StringSplit[word];
			wordTrend=Which[part==="Titles",
							If[wordRank==1,arXivTitlesWordTrend[cat,word(*,int*)],arXivTitlesWordNeighboursTrend[cat,word,"Month"]],
							part==="Abstracts",
							If[wordRank==1,arXivAbstractsWordTrend[cat,word(*,int*)],arXivAbstractsWordNeighboursTrend[cat,word,10000,"Month"]]];
			KeyMap[DateObject,DeleteMissing@
							wordTrend
							]]
							
(*the following to be extended to combinations of neighbour words*)							
							
arXivPlotWordKernel[wordComb_?(Head[#]===And||Head[#]===Or||Head[#]===Xor&),cat_,part_]:=
			Block[{combTrend},
			combTrend=Which[part==="Titles",
							arXivTitlesWordCombinationTrend[cat,wordComb],
							part==="Abstracts",
							arXivAbstractsWordCombinationTrend[cat,wordComb]];
			KeyMap[DateObject,DeleteMissing@
							Merge[{combTrend,ArXivArticlesTrend[cat]},N@Divide[#[[1]],#[[2]]]&]
							]]
							
arXivPlotWordKernel[All,wordComb_?(Head[#]===And||Head[#]===Or||Head[#]===Xor&),cat_,part_]:=
			Block[{combTrend},
			combTrend=Which[part==="Titles",
							arXivTitlesWordCombinationTrend[cat,wordComb],
							part==="Abstracts",
							arXivAbstractsWordCombinationTrend[cat,wordComb]];
			KeyMap[DateObject,DeleteMissing@
							combTrend
							]]


ArXivPlot[word_String,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[First@Map[arXivPlotWordKernel[#,cat,"Titles"]&,{word}],options]
ArXivPlotTitles[word_String,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[First@Map[arXivPlotWordKernel[#,cat,"Titles"]&,{word}],options]
ArXivPlotAbstracts[word_String,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[First@Map[arXivPlotWordKernel[#,cat,"Abstracts"]&,{word}],options]

														
																																										
ArXivPlot[wordL_List,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[#,cat,"Titles"]&,wordL],options]
ArXivPlotTitles[wordL_List,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[#,cat,"Titles"]&,wordL],options]
ArXivPlotAbstracts[wordL_List,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[#,cat,"Abstracts"]&,wordL],options]

		
ArXivPlot[wordComb_?(Head[#]===And||Head[#]===Or||Head[#]===Xor&),cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[arXivPlotWordKernel[wordComb,cat,"Titles"],options]
ArXivPlotTitles[wordComb_?(Head[#]===And||Head[#]===Or||Head[#]===Xor&),cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[arXivPlotWordKernel[wordComb,cat,"Titles"],options]
ArXivPlotAbstracts[wordComb_?(Head[#]===And||Head[#]===Or||Head[#]===Xor&),cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[arXivPlotWordKernel[wordComb,cat,"Abstracts"],options]

ArXivPlot[wordCombL:{_?(Head[#]===And||Head[#]===Or||Head[#]==Xor&)..},cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[#,cat,"Titles"]&,wordCombL],options]
ArXivPlotTitles[wordCombL:{_?(Head[#]===And||Head[#]===Or||Head[#]==Xor&)..},cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[#,cat,"Titles"]&,wordCombL],options]
ArXivPlotAbstracts[wordCombL:{_?(Head[#]===And||Head[#]===Or||Head[#]==Xor&)..},cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[#,cat,"Abstracts"]&,wordCombL],options]
	


ArXivPlot[All,word_String,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[First@Map[arXivPlotWordKernel[All,#,cat,"Titles"]&,{word}],options]
ArXivPlotTitles[All,word_String,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[First@Map[arXivPlotWordKernel[All,#,cat,"Titles"]&,{word}],options]
ArXivPlotAbstracts[All,word_String,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[First@Map[arXivPlotWordKernel[All,#,cat,"Abstracts"]&,{word}],options]
														
ArXivPlot[All,wordL_List,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[All,#,cat,"Titles"]&,wordL],options]
ArXivPlotTitles[All,wordL_List,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[All,#,cat,"Titles"]&,wordL],options]
ArXivPlotAbstracts[All,wordL_List,cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[All,#,cat,"Abstracts"]&,wordL],options]
	
ArXivPlot[All,wordComb_?(Head[#]===And||Head[#]===Or||Head[#]===Xor&),cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[arXivPlotWordKernel[All,wordComb,cat,"Titles"],options]
ArXivPlotTitles[All,wordComb_?(Head[#]===And||Head[#]===Or||Head[#]===Xor&),cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[arXivPlotWordKernel[All,wordComb,cat,"Titles"],options]
ArXivPlotAbstracts[All,wordComb_?(Head[#]===And||Head[#]===Or||Head[#]===Xor&),cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[arXivPlotWordKernel[All,wordComb,cat,"Abstracts"],options]

ArXivPlot[All,wordCombL:{_?(Head[#]===And||Head[#]===Or||Head[#]==Xor&)..},cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[All,#,cat,"Titles"]&,wordCombL],options]
ArXivPlotTitles[All,wordCombL:{_?(Head[#]===And||Head[#]===Or||Head[#]==Xor&)..},cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[All,#,cat,"Titles"]&,wordCombL],options]
ArXivPlotAbstracts[All,wordCombL:{_?(Head[#]===And||Head[#]===Or||Head[#]==Xor&)..},cat_,options:OptionsPattern[DateListPlot]]:=
	DateListPlot[Map[arXivPlotWordKernel[All,#,cat,"Abstracts"]&,wordCombL],options]



(* ::Subsection::Closed:: *)
(*Word search (can be extended)*)


(* ::Input:: *)
(**)


arXivTitlesWordSearch[word_String,cat_,cut_:2000]:=Cases[Transpose@{Range[cut],Normal@arXivTitlesWordsTop[cat,cut]},{_,HoldPattern[word->_]}]
arXivAbstractsWordSearch[word_String,cat_,cut_:2000]:=Cases[Transpose@{Range[cut],Normal@arXivAbstractsWordsTop[cat,cut]},{_,HoldPattern[word->_]}]


arXivTitlesWordNeighboursSearch[wordNeigh_String,cat_,cut_:2000]:=Cases[Transpose@{Range[cut],Normal@arXivTitlesWordNeighboursTop[cat,Length@StringSplit@wordNeigh,cut]},{_,HoldPattern[wordNeigh->_]}]
arXivAbstractsWordNeighboursSearch[wordNeigh_String,cat_,cut_:2000]:=Cases[Transpose@{Range[cut],Normal@arXivAbstractsWordNeighboursTop[cat,Length@StringSplit@wordNeigh,cut]},{_,HoldPattern[wordNeigh->_]}]


(* ::Input:: *)
(*(*ArXivTitleWordSearch[word_String,{cat_,All},cut_:2000]:=Cases[Transpose@{Range[cut],Normal@ArXivTitleWordsTop[{cat,All},cut]},{_,HoldPattern[word->_]}]*)*)


(* ::Subsection::Closed:: *)
(*Word citations (can be extended)*)


arXivTitlesWordCitationID[cat_,word_String]:=
	arXivTitlesWordCitationID[cat,word]=
		Block[{ids,part},
		ids=Keys@arXivTitlesWordID[cat,word];
		part=Partition[ids,UpTo[500]];
		Association[Rule@@@Partition[Flatten[Map[ArXivCitationsTotal,part]],2]]]


arXivTitlesWordNeighboursCitationID[cat_,word_String]:=
	arXivTitlesWordNeighboursCitationID[cat,word]=
		Block[{ids,part},
		ids=Keys@arXivTitlesWordNeighboursID[cat,word];
		part=Partition[ids,UpTo[500]];
		Association[Rule@@@Partition[Flatten[Map[ArXivCitationsTotal,part]],2]]]


ArXivCitationsTitles[word_String,cat_]:=If[Length@StringSplit[word]==1,arXivTitlesWordCitationID[cat,word],arXivTitlesWordNeighboursCitationID[cat,word]]


(*ArXivTitlesWordCitationTrend[cat_,word_String,int_:"Month"]:=
		(*ArXivTitlesWordCitationTrend[cat,word,int]=*)
			Block[{list,mainsplit,res=500,numpart,listpart,mainalg,ass},
					list=Normal@arXivTitlesCleanDated[cat,int];
					mainsplit=Cases[list,HoldPattern[_->_?(MemberQ[#,word]&)]];
					numpart=Echo@Length[Partition[mainsplit,UpTo[res]]];
					listpart[n_]:=Which[n<numpart,Take[mainsplit,{(n-1)*res+1,n*res}],n==numpart,Drop[mainsplit,(n-1)*res]];
					ass[n_]:=AssociationThread[Sequence@@Reverse@Transpose[listpart[n]]];
					Flatten[Monitor[
					Table[DeleteCases[Normal@Merge[{ass[n],Association[Rule@@@QuietEcho@ArXivCitationsTotal[#[[2]]]]}&@
										Transpose@listpart[n],Identity],
										HoldPattern[_->{_String}]],
							{n,1,numpart}]
						,n],1]]*)


(* ::Subsection:: *)
(*WordCloud code to update*)


(* ::Subsubsection::Closed:: *)
(*Title words redundant code*)


(*using a map on dated dataset is not effective for parallelism*)


(*(possibly redundant, can improve?)*)


arXivTitlesDated[cat_,int_:"Month"]:=arXivTitlesDated[cat,int]=Map[ArXivDatasetLookup["title",#]&,arXivDatasetDated[cat][int]]


arXivTitlesClean0[cat_,int_]:=arXivTitlesClean0[cat,int]=Map[DeleteStopwords@ToLowerCase@#&,(*EchoTiming@*)ParallelMap[TextWords[#]&,
																					arXivTitlesDated[cat,int]],{2}]
arXivTitlesCleanComplete[cat_,int_]:=arXivTitlesCleanComplete[cat,int]=Map[ToLowerCase@#&,(*EchoTiming@*)ParallelMap[TextWords[#]&,
																					arXivTitlesDated[cat,int]],{2}]



(*to save memory apply DeleteStopwords only later!*)


Options[arXivTitlesClean]={"Complete"->False};
arXivTitlesClean[cat_,int_:"Month",OptionsPattern[arXivTitlesClean]]:=
If[OptionValue["Complete"],arXivTitlesCleanComplete[cat,int],arXivTitlesClean0[cat,int]]


arXivTitlesWordCount[cat_,int_:"Month"]:=arXivTitlesWordCount[cat,int]=
		Apply[TimeSeries,
		{List@@@Normal[Map[ReverseSort@Counts@Flatten[#]&,arXivTitlesClean[cat,int]]]}]


arXivTitlesWordCount[cat_,word_String,int_:"Month"]:=arXivTitlesWordCount[cat,word,int]=
		TimeSeries@@List@MapAt[Lookup[#,word]&,Normal@arXivTitlesWordCount[cat,int],{All,2}]


arXivTitlesCleanDated[cat_,int_:"Month"]:=arXivTitlesCleanDated[cat,int]=
				Association[Rule@@@Transpose@List[
				Transpose@{ArXivVersionFirstDate[#,cat]&/@ArXivDatasetLookup["id",cat],ArXivDatasetLookup["id",cat]},
					Flatten[Values@Normal[arXivTitlesClean[cat,int]],1]]]


(*ArXivTitlesCombinationCount[cat_,wordl_List,int_:"Month"]:=ArXivTitlesCombinationCount[cat,wordl,int]=
					
					TimeSeries@@{List@@@Block[{mq},
							mq[arg_]:=And@@Map[MemberQ[arg,#]&,wordl];
							MapAt[
							Length,MapAt[Cases[#,_List?(mq[#]&)]&,
											ArXivTitlesClean[cat,int]//Normal,
									{All,2}],
									{All,2}]
							]}
							(*time series*)*)
(*ArXivAbstractsCombinationCount[cat_,wordl_List,int_:"Month"]:=ArXivAbstractsCombinationCount[cat,wordl,int]=
					
					TimeSeries@@{List@@@Block[{mq},
							mq[arg_]:=And@@Map[MemberQ[arg,#]&,wordl];
							MapAt[
							Length,MapAt[Cases[#,_List?(mq[#]&)]&,
											ArXivAbstractsClean[cat,int]//Normal,
									{All,2}],
									{All,2}]
							]}*)


(* ::Subsubsection::Closed:: *)
(*WordCloud titles video (to update)*)


(*PlotLabel->labels[[First[#2]]],
													ScalingFunctions->"Log",PlotTheme->"NeonColor",Background->GrayLevel[.2],ImageSize->{600,600}*)


(*ClearAll[arXivTitlesWordCloud]
arXivTitlesWordCloud[cat_,int_:"Month",options:OptionsPattern[WordCloud]]:=arXivTitlesWordCloud[cat,int,options]=
			Block[{dates,labels,clouds},
								
								dates=Which[(*int=="Day",
											Map[StringRiffle[ToString/@DateValue[First[#],{"Year","Month","Day"}],"-"]&,
												Normal[ArXivTitlesWordCount[cat,int]]],*)
												(*date range is better*)
											int=="Month",
											Map[StringRiffle[ToString/@#,"-"]&,
												Keys[arXivTitlesCleanDated[cat,int]]],
											int=="Year",
											Map[ToString@First[#]&,
												Keys[arXivTitlesCleanDated[cat,int]]]];
							    labels=Take[Map[Style["arXiv ["<>cat<>"]"<>"\n"<>"article title words"<>"\n"<>#<>"\n",22,LightBlue]&,dates],-3];
								clouds=Parallelize@MapIndexed[WordCloud[
													Take[List@@@Normal@ReverseSort@Counts@Flatten[#],UpTo@50]&,
													Disk[],
													options]&,										
													Take[Values@arXivTitlesCleanDated[cat],-3]];	
								AssociationThread[dates,clouds]
													]*)


(*arXivTitlesWordCloud[cat_,int_:"Month"]:=arXivTitlesWordCloud[cat,int]=
			Block[{dates,labels,clouds},
								
								dates=Which[(*int=="Day",
											Map[StringRiffle[ToString/@DateValue[First[#],{"Year","Month","Day"}],"-"]&,
												Normal[ArXivTitlesWordCount[cat,int]]],*)
												(*date range is better*)
											int=="Month",
											Map[StringRiffle[ToString/@DateValue[First[#],{"Year","Month"}],"-"]&,
												Normal[ArXivTitlesWordTrend[cat,int]]],
											int=="Year",
											Map[ToString@DateValue[First[#],{"Year"}]&,
												Normal[ArXivTitlesWordTrend[cat,int]]]];
							    labels=Map[Style["arXiv ["<>cat<>"]"<>"\n"<>"article title words"<>"\n"<>#<>"\n",22,LightBlue]&,dates];
								clouds=Parallelize@MapIndexed[WordCloud[
													#,
													Disk[],
													PlotLabel->labels[[First[#2]]],
													ScalingFunctions->"Log",PlotTheme->"NeonColor",Background->GrayLevel[.2],ImageSize->{600,600}]&,										
													Last/@Normal[ArXivTitlesWordTrend[cat,int]]];	
								AssociationThread[dates,clouds]
													]*)


(*ArXivTitlesWordCloudVideo[cat_,int_:"Month"]:=ArXivTitlesWordCloudVideo[cat,int]=
				SlideShowVideo[Values[arXivTitlesWordCloud[cat,int]],DefaultDuration->300]*)


(* ::Section:: *)
(*5. Neural networks*)


(* ::Subsection:: *)
(*Vocabularies*)


(* ::Subsubsection::Closed:: *)
(*Vocabulary titles*)


Options[ArXivVocabularyTitles]={"Stopwords"->False,"Dollar"->False};


ArXivVocabularyTitles[catL_List,OptionsPattern[ArXivVocabularyTitles]]:=ArXivVocabularyTitles[catL,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
								Union@Flatten@Map[Union@Flatten@Values[arXivTitlesCleanDated[#,"Month","Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]]&,catL]
ArXivVocabularyTitles[cut_Integer,OptionsPattern[ArXivVocabularyTitles]]:=
						ArXivVocabularyTitles[Keys@ArXivTopCategories[cut],"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]


ArXivVocabularyTitles[cat_String]:=ArXivVocabularyTitles[cat]=ArXivVocabularyTitles[{cat}]
ArXivVocabularyTitles[{cat_String,All}]:=ArXivVocabularyTitles[{cat,All}]=ArXivVocabularyTitles[{{cat,All}}]


(* ::Subsubsection::Closed:: *)
(*Vocabulary abstracts*)


Options[ArXivVocabularyAbstracts]={"Stopwords"->False,"Dollar"->False};


ArXivVocabularyAbstracts[catL_List,OptionsPattern[ArXivVocabularyAbstracts]]:=ArXivVocabularyAbstracts[catL,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
		Union@Flatten@Map[Union@Flatten@Values[arXivAbstractsCleanDated[#,"Month","Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]]&,catL];
ArXivVocabularyAbstracts[cut_Integer,OptionsPattern[ArXivVocabularyAbstracts]]:=
		ArXivVocabularyAbstracts[Keys@ArXivTopCategories[cut],"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]


ArXivVocabularyAbstracts[cat_String]:=ArXivVocabularyAbstracts[cat]=ArXivVocabularyAbstracts[{cat}]
ArXivVocabularyAbstracts[{cat_String,All}]:=ArXivVocabularyAbstracts[{cat,All}]=ArXivVocabularyAbstracts[{{cat,All}}]


(* ::Subsubsection::Closed:: *)
(*Vocabulary introductions*)


ArXivVocabularyIntroductions[idL_List,thresh_:50000]:=Union@Flatten@Values@arXivTeXIntroductionListClean[idL,thresh]
ArXivVocabularyIntroductions[idL_List]:=ArXivVocabularyIntroductions[idL,50000]


ArXivVocabularyIntroductions[id_String]:=ArXivVocabularyIntroductions[{id}]


(* ::Subsection:: *)
(*Embeddings*)


(* ::Subsubsection::Closed:: *)
(*Embedding Layer*)


embeddingVoc[depth_, vocabulary_] :=
	 NetGraph @
		FunctionLayer[
			Module[{emb1, emb2, posembed},
				emb1 = EmbeddingLayer[depth][#Input];
				posembed = SequenceIndicesLayer[50][#Input];
				emb2 = EmbeddingLayer[depth][posembed];
				emb1 + emb2
			]&
			,
			"Input" -> {"Varying", NetEncoder[{"Class", vocabulary}]}
		]


(* ::Subsection:: *)
(*NNs*)


(* ::Subsubsection::Closed:: *)
(*Elementary Recurrent Layer*)


netRecurrentElem[dim_Integer,drop_:0.9]:=NetGraph[
												{"Drop1"->DropoutLayer[drop],
												"LSTM1"->LongShortTermMemoryLayer[dim,"Input"->{"Varying",dim}],
												"SL1"->SequenceLastLayer[]},

												{NetPort["In1"]->"Drop1","Drop1"->"LSTM1","LSTM1"->"SL1","SL1"->NetPort["Out"]},

												"In1"->{"Varying",dim},"Out"->Automatic
												]


(* ::Subsubsection::Closed:: *)
(*Category classifier net*)


Options[ArXivClassifyCategoriesNet]={"Stopwords"->True,"Dollar"->True};


ArXivClassifyCategoriesNet[catL_List,dim_List,drop_:0.9,OptionsPattern[ArXivClassifyCategoriesNet]]/;Length[dim]===3:=
	ArXivClassifyCategoriesNet[catL,dim,drop,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]=
			Block[{classes=catL, 
					vocT=ArXivVocabularyTitles[catL,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]],
					vocA=ArXivVocabularyAbstracts[catL,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]},
					NetGraph[
							{"preTitles"->NetPrepend[netRecurrentElem[dim[[1]],drop],embeddingVoc[dim[[1]],vocT]],
							"preAbstracts"->NetPrepend[netRecurrentElem[dim[[2]],drop],embeddingVoc[dim[[2]],vocA]],
							"Cat"->CatenateLayer[],
							"Ramp1"->Ramp,"Lin1"->LinearLayer[dim[[3]]],
							"Ramp2"->Ramp,"Lin2"->LinearLayer[Length[classes]],
							"Soft"->SoftmaxLayer[]},
							
							{NetPort["InTitles"]->"preTitles",NetPort["InAbstracts"]->"preAbstracts",
							"preTitles"->"Cat","preAbstracts"->"Cat",
							"Cat"->"Ramp1","Ramp1"->"Lin1",
							"Lin1"->"Ramp2","Ramp2"->"Lin2",
							"Lin2"->"Soft","Soft"->NetPort["Out"]},
							
							"InTitles"->NetEncoder[{"Class",vocT}],"InAbstracts"->NetEncoder[{"Class",vocA}],
							"Out"->NetDecoder[{"Class",classes}]
							]
					] 
					
ArXivClassifyCategoriesNet[catL_List,dim_Integer,drop_:0.9,OptionsPattern[ArXivClassifyCategoriesNet]]:=
		ArXivClassifyCategoriesNet[catL,{dim,dim,dim},drop,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]

ArXivClassifyCategoriesNet[cut_Integer,dim_List,drop_:0.9,OptionsPattern[ArXivClassifyCategoriesNet]]:=
	ArXivClassifyCategoriesNet[Keys@ArXivTopCategories[cut],dim,drop,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]

ArXivClassifyCategoriesNet[cut_Integer,dim_Integer,drop_:0.9,OptionsPattern[ArXivClassifyCategoriesNet]]:=
	ArXivClassifyCategoriesNet[Keys@ArXivTopCategories[cut],dim,drop,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]


(* ::Subsubsection::Closed:: *)
(*Authors classifier net*)


Options[ArXivClassifyAuthorsNet]={"Introductions"->False};


ArXivClassifyAuthorsNet[authorL_List,catL_List,dim_List,drop_:0.9,OptionsPattern[ArXivClassifyAuthorsNet]]/;Length@dim===3:=
	ArXivClassifyAuthorsNet[authorL,catL,dim,drop,"Introductions"->OptionValue["Introductions"]]=
		Block[{classes=authorL, 
				vocT=ArXivVocabularyTitles[Union@catL,"Stopwords"->True,"Dollar"->True],
				vocA=ArXivVocabularyAbstracts[Union@catL,"Stopwords"->True,"Dollar"->True]},
				NetGraph[
						{"preTitles"->NetPrepend[netRecurrentElem[dim[[1]],drop],embeddingVoc[dim[[1]],vocT]],
						"preAbstracts"->NetPrepend[netRecurrentElem[dim[[2]],drop],embeddingVoc[dim[[2]],vocA]],
						"Cat"->CatenateLayer[],
						"Ramp1"->Ramp,"Lin1"->LinearLayer[dim[[3]]],
						"Ramp2"->Ramp,"Lin2"->LinearLayer[Length[classes]],
						"Soft"->SoftmaxLayer[]},
					
						{NetPort["InTitles"]->"preTitles",NetPort["InAbstracts"]->"preAbstracts",
						"preTitles"->"Cat","preAbstracts"->"Cat",
						"Cat"->"Ramp1","Ramp1"->"Lin1",
						"Lin1"->"Ramp2","Ramp2"->"Lin2",
						"Lin2"->"Soft","Soft"->NetPort["Out"]},
					
						"InTitles"->NetEncoder[{"Class",vocT}],"InAbstracts"->NetEncoder[{"Class",vocA}],
						"Out"->NetDecoder[{"Class",classes}]
						]
				]
				
ArXivClassifyAuthorsNet[authorL_List,catL_List,dim_Integer,drop_:0.9,OptionsPattern[ArXivClassifyAuthorsNet]]/;Length@dim===3:=
	ArXivClassifyAuthorsNet[authorL,catL,{dim,dim,dim},drop,"Introductions"->OptionValue["Introductions"]]

ArXivClassifyAuthorsNet[authorL_List,cat_,dim_List,drop_:0.9,OptionsPattern[ArXivClassifyAuthorsNet]]/;Length@dim===3:=
	ArXivClassifyAuthorsNet[authorL,{cat},dim,drop,"Introductions"->OptionValue["Introductions"]]

ArXivClassifyAuthorsNet[authorL_List,cat_,dim_Integer,drop_:0.9,OptionsPattern[ArXivClassifyAuthorsNet]]:=
	ArXivClassifyAuthorsNet[authorL,{cat},{dim,dim,dim},drop,"Introductions"->OptionValue["Introductions"]]


ArXivClassifyAuthorsNet[authorL:{_Entity..},dim_List,drop_,idL_List,OptionsPattern[ArXivClassifyAuthorsNet]]:=
	Block[{classes=Map[EntityValue[#,"Label"]&,authorL],catL=Union@Flatten@Map[EntityValue[#,"Categories"]&,authorL],vocT,vocA,vocI}, 
				vocT=ArXivVocabularyTitles[Union@catL,"Stopwords"->True,"Dollar"->True];
				vocA=ArXivVocabularyAbstracts[Union@catL,"Stopwords"->True,"Dollar"->True];
				
				If[!OptionValue["Introductions"],
				NetGraph[
						{"preTitles"->NetPrepend[netRecurrentElem[dim[[1]],drop],embeddingVoc[dim[[1]],vocT]],
						"preAbstracts"->NetPrepend[netRecurrentElem[dim[[2]],drop],embeddingVoc[dim[[2]],vocA]],
						"Cat"->CatenateLayer[],
						"Ramp1"->Ramp,"Lin1"->LinearLayer[dim[[3]]],
						"Ramp2"->Ramp,"Lin2"->LinearLayer[Length[classes]],
						"Soft"->SoftmaxLayer[]},
					
						{NetPort["InTitles"]->"preTitles",NetPort["InAbstracts"]->"preAbstracts",
						"preTitles"->"Cat","preAbstracts"->"Cat",
						"Cat"->"Ramp1","Ramp1"->"Lin1",
						"Lin1"->"Ramp2","Ramp2"->"Lin2",
						"Lin2"->"Soft","Soft"->NetPort["Out"]},
					
						"InTitles"->NetEncoder[{"Class",vocT}],"InAbstracts"->NetEncoder[{"Class",vocA}],
						"Out"->NetDecoder[{"Class",classes}]
						],
				vocI=ArXivVocabularyIntroductions[idL];		
						NetGraph[
						{"preTitles"->NetPrepend[netRecurrentElem[dim[[1]],drop],embeddingVoc[dim[[1]],vocT]],
						"preAbstracts"->NetPrepend[netRecurrentElem[dim[[2]],drop],embeddingVoc[dim[[2]],vocA]],
						"preIntroductions"->NetPrepend[netRecurrentElem[dim[[4]],drop],embeddingVoc[dim[[4]],vocI]],
						"Cat1"->CatenateLayer[],
						"Cat2"->CatenateLayer[],
						"Ramp0"->Ramp,
						"Ramp1"->Ramp,"Lin1"->LinearLayer[dim[[3]]],
						"Ramp2"->Ramp,"Lin2"->LinearLayer[Length[classes]],
						"Soft"->SoftmaxLayer[]},
					
						{NetPort["InTitles"]->"preTitles",NetPort["InAbstracts"]->"preAbstracts",
						NetPort["InIntroductions"]->"preIntroductions",
						"preTitles"->"Cat1","preAbstracts"->"Cat1",
						"preIntroductions"->"Cat2",
						"Cat1"->"Ramp0","Ramp0"->"Cat2",
						"Cat2"->"Ramp1","Ramp1"->"Lin1",
						"Lin1"->"Ramp2","Ramp2"->"Lin2",
						"Lin2"->"Soft","Soft"->NetPort["Out"]},
					
						"InTitles"->NetEncoder[{"Class",vocT}],"InAbstracts"->NetEncoder[{"Class",vocA}],
						"InIntroductions"->NetEncoder[{"Class",vocI}],
						"Out"->NetDecoder[{"Class",classes}]
						]]
				]


ArXivClassifyAuthorsNet[authorL:{_Entity..},dim_List,drop_:0.9,OptionsPattern[ArXivClassifyAuthorsNet]]:=
	Block[{classes,catL,articlesL,vocT,vocA,vocI}, 
				classes=Map[EntityValue[#,"Label"]&,authorL];
				catL=Union@Flatten@Map[EntityValue[#,"Categories"]&,authorL];
				articlesL=Union@Flatten@Map[EntityValue[#,"Articles"]&,authorL];
				vocT=ArXivVocabularyTitles[Union@catL,"Stopwords"->True,"Dollar"->True];
				vocA=ArXivVocabularyAbstracts[Union@catL,"Stopwords"->True,"Dollar"->True];
				
				If[!OptionValue["Introductions"],
				NetGraph[
						{"preTitles"->NetPrepend[netRecurrentElem[dim[[1]],drop],embeddingVoc[dim[[1]],vocT]],
						"preAbstracts"->NetPrepend[netRecurrentElem[dim[[2]],drop],embeddingVoc[dim[[2]],vocA]],
						"Cat"->CatenateLayer[],
						"Ramp1"->Ramp,"Lin1"->LinearLayer[dim[[3]]],
						"Ramp2"->Ramp,"Lin2"->LinearLayer[Length[classes]],
						"Soft"->SoftmaxLayer[]},
					
						{NetPort["InTitles"]->"preTitles",NetPort["InAbstracts"]->"preAbstracts",
						"preTitles"->"Cat","preAbstracts"->"Cat",
						"Cat"->"Ramp1","Ramp1"->"Lin1",
						"Lin1"->"Ramp2","Ramp2"->"Lin2",
						"Lin2"->"Soft","Soft"->NetPort["Out"]},
					
						"InTitles"->NetEncoder[{"Class",vocT}],"InAbstracts"->NetEncoder[{"Class",vocA}],
						"Out"->NetDecoder[{"Class",classes}]
						],
				vocI=ArXivVocabularyIntroductions[articlesL];		
						NetGraph[
						{"preTitles"->NetPrepend[netRecurrentElem[dim[[1]],drop],embeddingVoc[dim[[1]],vocT]],
						"preAbstracts"->NetPrepend[netRecurrentElem[dim[[2]],drop],embeddingVoc[dim[[2]],vocA]],
						"preIntroductions"->NetPrepend[netRecurrentElem[dim[[4]],drop],embeddingVoc[dim[[4]],vocI]],
						"Cat1"->CatenateLayer[],
						"Cat2"->CatenateLayer[],
						"Ramp0"->Ramp,
						"Ramp1"->Ramp,"Lin1"->LinearLayer[dim[[3]]],
						"Ramp2"->Ramp,"Lin2"->LinearLayer[Length[classes]],
						"Soft"->SoftmaxLayer[]},
					
						{NetPort["InTitles"]->"preTitles",NetPort["InAbstracts"]->"preAbstracts",
						NetPort["InIntroductions"]->"preIntroductions",
						"preTitles"->"Cat1","preAbstracts"->"Cat1",
						"preIntroductions"->"Cat2",
						"Cat1"->"Ramp0","Ramp0"->"Cat2",
						"Cat2"->"Ramp1","Ramp1"->"Lin1",
						"Lin1"->"Ramp2","Ramp2"->"Lin2",
						"Lin2"->"Soft","Soft"->NetPort["Out"]},
					
						"InTitles"->NetEncoder[{"Class",vocT}],"InAbstracts"->NetEncoder[{"Class",vocA}],
						"InIntroductions"->NetEncoder[{"Class",vocI}],
						"Out"->NetDecoder[{"Class",classes}]
						]]
				]


ArXivClassifyAuthorsNet[authorL:{_Entity..},dim_Integer,drop_:0.9,OptionsPattern[ArXivClassifyAuthorsNet]]:=ArXivClassifyAuthorsNet[authorL,{dim,dim,dim},drop,"Introductions"->OptionValue["Introductions"]]


(* ::Subsection:: *)
(*Training and testing sets*)


(* ::Subsubsection::Closed:: *)
(*Train & test category*)


Options[ArXivClassifyCategoriesTrainTest]={"Stopwords"->True,"Dollar"->True};


ArXivClassifyCategoriesTrainTest[catL_List,nids_Integer,OptionsPattern[ArXivClassifyCategoriesTrainTest]]:=Block[{listIDs,listFull,classes,td},
							classes=catL;
							listIDs[argcat_]:=RandomSample[ArXivIDs[argcat],UpTo@nids];
							listFull=MapThread[
							Association["InTitles"->#1,"InAbstracts"->#2,"Out"->#3]&,
												{Flatten[Map[Lookup[arXivTitlesCleanID[#,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]],listIDs[#]]&,classes],1],
												Flatten[Map[Lookup[arXivAbstractsCleanID[#,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]],listIDs[#]]&,classes],1],
												Flatten[Map[Table[#,Length[listIDs[#]]]&,classes],1]
																		}];
							td=TakeDrop[RandomSample@listFull,
							Floor[9/10 Length[listFull]]];
							Map[Merge[#,Identity]&,td]]
							
ArXivClassifyCategoriesTrainTest[cut_Integer,nids_Integer,OptionsPattern[ArXivClassifyCategoriesTrainTest]]:=
			ArXivClassifyCategoriesTrainTest[Keys@ArXivTopCategories[cut],nids,"Stopwords"->OptionValue["Stopwords"],"Dollar"->OptionValue["Dollar"]]


(* ::Subsubsection::Closed:: *)
(*Train & test authors*)


Options[ArXivClassifyAuthorsTrainTest]={"Introductions"->False};


ArXivClassifyAuthorsTrainTest[authorL_List,catL_List,nids_Integer,OptionsPattern[ArXivClassifyAuthorsTrainTest]]:=
						Block[{listIDs,listCats,listFull,classes,td},
								classes=authorL;
								listIDs[argaut_,argcat_]:=RandomSample[First@Values@ArXivArticlesAuthor[argaut,argcat],UpTo@nids];
								listFull=MapThread[
													Association["InTitles"->#1,"InAbstracts"->#2,"Out"->#3]&,
															{Flatten[MapThread[
															Lookup[arXivTitlesCleanID[#2,"Stopwords"->True,"Dollar"->True],listIDs[#1,#2]]&,
																	{classes,catL}],1],
															Flatten[MapThread[
															Lookup[arXivAbstractsCleanID[#2,"Stopwords"->True,"Dollar"->True],listIDs[#1,#2]]&,
																	{classes,catL}],1],
															Flatten[MapThread[
															Table[#1,Length[listIDs[#1,#2]]]&,
																	{classes,catL}],1]}
													];
								td=TakeDrop[RandomSample@listFull,
								Floor[9/10 Length[listFull]]];
								Map[Merge[#,Identity]&,td]]


ArXivClassifyAuthorsTrainTest[authorL_List,cat_,nids_Integer,OptionsPattern[ArXivClassifyAuthorsTrainTest]]:=
							ArXivClassifyAuthorsTrainTest[authorL,Table[cat,Length@authorL],nids,"Introductions"->OptionValue["Introductions"]]


ArXivClassifyAuthorsTrainTest[authorL:{_Entity..},nids_Integer,OptionsPattern[ArXivClassifyAuthorsTrainTest]]:=
						Block[{listIDs,listCats,listFull,classes,categories,catUni,names,td},
								classes=Map[EntityValue[#,"Label"]&,authorL];
								listIDs[argaut_]:=RandomSample[ArXivArticlesAuthor[argaut],UpTo@nids];
								categories=Union@Flatten@Map[EntityValue[#,"Categories"]&,authorL];
								catUni=StringRiffle[Map[ToString,categories],"&&"];
								ArXivDataset[catUni]=ArXivDatasetSubset[Union@Flatten@Map[ArXivIDs,categories]];
								listFull=If[OptionValue["Introductions"],
											MapThread[
													Association["InTitles"->#1,"InAbstracts"->#2,"InIntroductions"->#3,"Out"->#4]&,
															{Flatten[Map[
															Lookup[arXivTitlesCleanID[catUni,"Stopwords"->True,"Dollar"->True],listIDs[#]]&,
																	authorL],1],
															Flatten[Map[
															Lookup[arXivAbstractsCleanID[catUni,"Stopwords"->True,"Dollar"->True],listIDs[#]]&,
																	authorL],1],
															Flatten[Map[
															Values@arXivTeXIntroductionListClean[listIDs[#]]&,
																	authorL],1],
															Flatten[Map[
															Table[EntityValue[#,"Label"],Length[listIDs[#]]]&,
																	authorL],1]}
													],
											MapThread[
													Association["InTitles"->#1,"InAbstracts"->#2,"Out"->#3]&,
															{Flatten[Map[
															Lookup[arXivTitlesCleanID[catUni,"Stopwords"->True,"Dollar"->True],listIDs[#]]&,
																	authorL],1],
															Flatten[Map[
															Lookup[arXivAbstractsCleanID[catUni,"Stopwords"->True,"Dollar"->True],listIDs[#]]&,
																	authorL],1],
															Flatten[Map[
															Table[EntityValue[#,"Label"],Length[listIDs[#]]]&,
																	authorL],1]}
													]];
								td=TakeDrop[RandomSample@listFull,
								Floor[9/10 Length[listFull]]];
								Map[Merge[#,Identity]&,td]]


(*unefficient computation of useless cleaned titles and abstracts*)


(*arXivTitlesCleanID,arXivAbstractsCleanID to replace*)


ArXivClassifyAuthorsTrainTest[authorL:{_Entity..},idL_List,OptionsPattern[ArXivClassifyAuthorsTrainTest]]:=
						Block[{listIDs,listCats,listFull,classes,categories,catUni,names,td},
								classes=Map[EntityValue[#,"Label"]&,authorL];
								listIDs[argaut_]:=Cases[idL,Alternatives@@ArXivArticlesAuthor[argaut]];
								categories=Union@Flatten@Map[EntityValue[#,"Categories"]&,authorL];
								catUni=StringRiffle[Map[ToString,categories],"&&"];
								ArXivDataset[catUni]=ArXivDatasetSubset[Union@Flatten@Map[ArXivIDs,categories]];
								listFull=If[OptionValue["Introductions"],
											MapThread[
													Association["InTitles"->#1,"InAbstracts"->#2,"InIntroductions"->#3,"Out"->#4]&,
															{Flatten[Map[
															Lookup[arXivTitlesCleanID[catUni,"Stopwords"->True,"Dollar"->True],listIDs[#]]&,
																	authorL],1],
															Flatten[Map[
															Lookup[arXivAbstractsCleanID[catUni,"Stopwords"->True,"Dollar"->True],listIDs[#]]&,
																	authorL],1],
															Flatten[Map[
															Values@arXivTeXIntroductionListClean[listIDs[#]]&,
																	authorL],1],
															Flatten[Map[
															Table[EntityValue[#,"Label"],Length[listIDs[#]]]&,
																	authorL],1]}
													],
											MapThread[
													Association["InTitles"->#1,"InAbstracts"->#2,"Out"->#3]&,
															{Flatten[Map[
															Lookup[arXivTitlesCleanID[catUni,"Stopwords"->True,"Dollar"->True],listIDs[#]]&,
																	authorL],1],
															Flatten[Map[
															Lookup[arXivAbstractsCleanID[catUni,"Stopwords"->True,"Dollar"->True],listIDs[#]]&,
																	authorL],1],
															Flatten[Map[
															Table[EntityValue[#,"Label"],Length[listIDs[#]]]&,
																	authorL],1]}
													]];
								td=TakeDrop[RandomSample@listFull,
								Floor[9/10 Length[listFull]]];
								Map[Merge[#,Identity]&,td]]


(* ::Subsection:: *)
(*Features*)


(* ::Subsubsection::Closed:: *)
(*Features Categories*)


(*net*)


ArXivFeaturesCategoriesNet[n_,m_:5000,dimL_List:{128,64,32},drop_:0.5,rounds_:5]:=
ArXivFeaturesCategoriesNet[n,m,dimL,drop,rounds]=Block[{train,test,net,netTrain,netAccuracy,netF1,netConfusion},
{train,test}=ArXivClassifyCategoriesTrainTest[n,m];
net=ArXivClassifyCategoriesNet[n,dimL,drop];
netTrain=
NetTrain[net,train,All,ValidationSet->Scaled[0.1],MaxTrainingRounds->rounds]//Sow;
{netAccuracy,netF1,netConfusion}=NetMeasurements[netTrain["TrainedNet"],test,{"Accuracy","F1Score","ConfusionMatrixPlot"}];
AssociationThread[{"Accuracy","F1Score","ConfusionMatrixPlot"},{netAccuracy,netF1,netConfusion}]//Sow;
NetDelete[netTrain["TrainedNet"],{"Soft","Lin2","Ramp2"}]]


ArXivFeaturesCategoriesNet[n_]:=ArXivFeaturesCategoriesNet[n]=
		ArXivFeaturesCategoriesNet[n,5000,{128,64,32},0.5,5]


(*set*)


ArXivFeaturesCategoriesSet[n_,m_]:=
Block[{cats,ids,titlesClean,abstractsClean,categories},
cats=Keys@ArXivTopCategories[n];
ids=Association@Map[#->RandomSample[ArXivIDs[#],m]&,cats]//Sow;
titlesClean=Association@Map[#->Lookup[arXivTitlesCleanID[#],ids[#]]&,cats];
abstractsClean=Association@Map[#->Lookup[arXivAbstractsCleanID[#],ids[#]]&,cats];
Merge[KeyValueMap[{AssociationThread[{"InIDs","InTitles","InAbstracts"},#2],"Out"->Table[#1,m]}&,Merge[{ids,titlesClean,abstractsClean},Identity]],Flatten[#,1]&]]


(* ::Subsubsection:: *)
(*Features Authors (next release)*)


(* ::Subsubsection::Closed:: *)
(*Features Nearest*)


arXivFeaturesNearestBlock[netF_NetGraph,set_Association,k_Integer(*neighbours*),n_(*features*),seedSample_:1(*random*)]:=
Block[{lgTest,lstRandom,lstID,featuresInfoRd,featuresInfoID,featuresInfo,features,featureNearestF,jCat,legColors,assColors},
	jCat=Length@Union@Lookup[set,"Out"];
	lgTest=First@Values@Map[Length,set];
	lstRandom=(SeedRandom[seedSample];RandomSample[Range@lgTest,n]);
	lstID=If[MemberQ[Keys@set,"InIDs"],Lookup[set,"InIDs"],lstRandom];
	featuresInfoRd=Association@Table[i->Map[#[[i]]&,set],{i,lstRandom}];
	featuresInfoID:=Association@Map[#[[1]]->AssociationThread[{"InTitles","InAbstracts","Out"},Rest[#]]&,Transpose@Values[set]];
	featuresInfo=If[MemberQ[Keys@set,"InIDs"],featuresInfoID,featuresInfoRd];
	features=Map[netF,featuresInfo];

	featureNearestF=
Map[Take[Part[First@Transpose@#,Flatten@Comap[{PositionSmallest[Last@Transpose@#,k]&},#]],k]&,
GroupBy[Normal@DeleteCases[AssociationThread[Tuples[Keys@features,{2}],MapApply[CosineDistance,Tuples[Values@features,{2}]]],0.],(#[[1,1]]&)->({#[[1,2]],#[[2]]}&)]]]

arXivFeaturesNearestBlock[netF_NetGraph,set_Association,k_Integer(*neighbours*)]:=
	arXivFeaturesNearestBlock[netF,set,k,First@Values@Map[Length,set]]


ArXivFeaturesCategoriesNearest[netF_NetGraph,set_Association,k_Integer(*neighbours*),n_(*features*),seedSample_:1(*random*)]:=arXivFeaturesNearestBlock[netF,set,k,n,seedSample]
ArXivFeaturesCategoriesNearest[netF_NetGraph,set_Association,k_Integer(*neighbours*)]:=arXivFeaturesNearestBlock[netF,set,k]


ArXivFeaturesCategoriesNearest[set_Association,k_Integer(*neighbours*),n_(*features*),seedSample_:1(*random*)]:=
	Block[{netF=ArXivFeaturesCategoriesNet[Length@Union@Lookup[set,"Out"]]},
				arXivFeaturesNearestBlock[netF,set,k,n,seedSample]]
ArXivFeaturesCategoriesNearest[set_Association,k_Integer(*neighbours*)]:=
	Block[{netF=ArXivFeaturesCategoriesNet[Length@Union@Lookup[set,"Out"]]},
				arXivFeaturesNearestBlock[netF,set,k]]


(* ::Subsection:: *)
(*Cluster*)


(* ::Subsubsection::Closed:: *)
(*Cluster Color*)


(*legendColor100=<|"hep-ph"->Hue[0.9125],"hep-th"->Hue[0.895],"hep-ex"->Hue[0.8775],"hep-lat"->Hue[0.86],"quant-ph"->Hue[0.79],"cs.CV"->Hue[0.7870833333333334],"cs.LG"->Hue[0.7841666666666667],"cs.CL"->Hue[0.78125],"cs.IT"->Hue[0.7783333333333333],"cs.RO"->Hue[0.7754166666666666],"cs.CR"->Hue[0.7725],"cs.AI"->Hue[0.7695833333333333],"cs.NI"->Hue[0.7666666666666666],"cs.DS"->Hue[0.7637499999999999],"cs.SE"->Hue[0.7608333333333334],"cs.DC"->Hue[0.7579166666666667],"cs.HC"->Hue[0.755],"cs.CY"->Hue[0.7520833333333333],"cs.IR"->Hue[0.7491666666666666],"cs.LO"->Hue[0.7462500000000001],"cs.SI"->Hue[0.7433333333333334],"cs.GT"->Hue[0.7404166666666667],"cs.NE"->Hue[0.7375],"cs.SD"->Hue[0.7345833333333334],"cs.DB"->Hue[0.7316666666666667],"cs.CC"->Hue[0.72875],"cs.SY"->Hue[0.7258333333333333],"cs.PL"->Hue[0.7229166666666667],"cs.DM"->Hue[0.72],"astro-ph"->Hue[0.71],"astro-ph.GA"->Hue[0.7],"astro-ph.SR"->Hue[0.69],"astro-ph.CO"->Hue[0.6799999999999999],"astro-ph.HE"->Hue[0.6699999999999999],"astro-ph.EP"->Hue[0.66],"astro-ph.IM"->Hue[0.6499999999999999],"gr-qc"->Hue[0.5800000000000001],"cond-mat.mes-hall"->Hue[0.573],"cond-mat.mtrl-sci"->Hue[0.5660000000000001],"cond-mat.str-el"->Hue[0.5589999999999999],"cond-mat.stat-mech"->Hue[0.552],"cond-mat.supr-con"->Hue[0.5449999999999999],"cond-mat.soft"->Hue[0.538],"cond-mat.quant-gas"->Hue[0.5309999999999999],"cond-mat.dis-nn"->Hue[0.524],"cond-mat"->Hue[0.5169999999999999],"cond-mat.other"->Hue[0.51],"math.AP"->Hue[0.5072],"math.CO"->Hue[0.5044],"math.PR"->Hue[0.5016],"math.AG"->Hue[0.4988],"math.NT"->Hue[0.496],"math.OC"->Hue[0.49319999999999997`],"math-ph"->Hue[0.49039999999999995`],"math.DG"->Hue[0.48760000000000003`],"math.NA"->Hue[0.4848],"math.DS"->Hue[0.482],"math.FA"->Hue[0.47920000000000007`],"math.GT"->Hue[0.47639999999999993`],"math.RT"->Hue[0.4736],"math.CA"->Hue[0.4708],"math.ST"->Hue[0.46799999999999997`],"math.GR"->Hue[0.46520000000000006`],"math.RA"->Hue[0.46240000000000003`],"math.CV"->Hue[0.4596],"math.LO"->Hue[0.4568],"math.QA"->Hue[0.45399999999999996`],"math.AT"->Hue[0.45120000000000005`],"math.AC"->Hue[0.4484],"math.OA"->Hue[0.4456],"math.MG"->Hue[0.44279999999999997`],"math.SG"->Hue[0.43999999999999995`],"nucl-th"->Hue[0.4049999999999999],"nucl-ex"->Hue[0.37],"physics.optics"->Hue[0.365],"physics.flu-dyn"->Hue[0.36],"physics.ins-det"->Hue[0.355],"physics.soc-ph"->Hue[0.35],"physics.atom-ph"->Hue[0.345],"physics.chem-ph"->Hue[0.33999999999999997`],"physics.plasm-ph"->Hue[0.33499999999999996`],"physics.app-ph"->Hue[0.33000000000000007`],"physics.gen-ph"->Hue[0.32499999999999996`],"physics.comp-ph"->Hue[0.32000000000000006`],"physics.bio-ph"->Hue[0.31500000000000006`],"physics.acc-ph"->Hue[0.30999999999999994`],"physics.class-ph"->Hue[0.30500000000000005`],"physics.med-ph"->Hue[0.29999999999999993`],"stat.ME"->Hue[0.2766666666666666],"stat.ML"->Hue[0.2533333333333333],"stat.AP"->Hue[0.22999999999999998`],"eess.SP"->Hue[0.21250000000000002`],"eess.IV"->Hue[0.19499999999999995`],"eess.SY"->Hue[0.1775],"eess.AS"->Hue[0.16000000000000003`],"q-bio.PE"->Hue[0.1366666666666666],"q-bio.NC"->Hue[0.11333333333333329`],"q-bio.QM"->Hue[0.08999999999999997],"nlin.CD"->Hue[0.05499999999999994],"nlin.SI"->Hue[0.019999999999999907`]|>;
arXivCategoriesColors[catL_List]:=Association@FilterRules[Normal[legendColor100],catL]
arXivCategoriesColors[n_Integer]:=Association[FilterRules[Normal[legendColor100],Keys[ArXivTopCategories[n]]]]*)


ArXivClusterLegend[n_Integer]:=Block[{keys,splitkeys,group,lgr,groupkeys},
keys=Keys@ArXivTopCategories[n];
splitkeys=AssociationMap[Reverse,AssociationMap[StringSplit[#,{".","-"}]&,keys]];
group=GroupBy[Keys@splitkeys,First];
lgr=Length[group];
groupkeys=group/.Normal@splitkeys;
Association@KeyValueMap[#1->Hue[#2]&,Association@Flatten@Map[Thread,MapIndexed[#->N[(#2[[1]]-1+ MapIndexed[#2[[1]]-1&,#]/Length[#])/(Length[Values@groupkeys])](*N[(#2[[1]]+ MapIndexed[#2[[1]]&,#]/Length[#])/(Length[Flatten@Values@groupkeys])]*)&,Values@groupkeys]]]]


(* ::Subsubsection::Closed:: *)
(*Cluster Graph*)


Options[ArXivClusterCategoriesGraph]=Join[{"3D"->False},Options[Graph]];


Options[arXivClusterGraphBlock]=Join[{"3D"->False},Options[Graph]];


Options[arXivClusterGraphBlockRandom]=Join[{"3D"->False},Options[Graph]];


Options[arXivClusterGraphBlockID]=Join[{"3D"->False},Options[Graph]];


(*this is partly old and partly new code*)


(*arXivClusterGraphBlock[netF_NetGraph,test_Association,k_Integer(*neighbours*),n_(*features*),seedSample_:1(*random*),options:OptionsPattern[arXivClusterGraphBlock]]:=
Block[{lgTest,lstRandom,lstID,featuresInfoRd,featuresInfoID,featuresInfo,features,featureNearestF,jCat,legColors,assColors},
	jCat=Length@Union@Lookup[test,"Out"];
	lgTest=First@Values@Map[Length,test];
	lstRandom=(SeedRandom[seedSample];RandomSample[Range@lgTest,n]);
	lstID=If[MemberQ[Keys@test,"InIDs"],Lookup[test,"InIDs"],lstRandom];
	featuresInfoRd=Association@Table[i->Map[#[[i]]&,test],{i,lstRandom}];
	featuresInfoID:=Association@Map[#[[1]]->AssociationThread[{"InTitles","InAbstracts","Out"},Rest[#]]&,Transpose@Values[test]];
	featuresInfo=If[MemberQ[Keys@test,"InIDs"],featuresInfoID,featuresInfoRd];
	features=Map[netF,featuresInfo];

	featureNearestF[i_]:=
Map[Take[Part[First@Transpose@#,Flatten@Comap[{PositionSmallest[Last@Transpose@#,i]&},#]],i]&,
GroupBy[Normal@DeleteCases[AssociationThread[Tuples[Keys@features,{2}],MapApply[CosineDistance,Tuples[Values@features,{2}]]],0.],(#[[1,1]]&)->({#[[1,2]],#[[2]]}&)]];

legColors=(*arXivCategoriesColors*)ArXivClusterLegend[jCat];
assColors=Association@KeyValueMap[#1->Style[#1,legColors[#2]]&,Map[Last,featuresInfo]];

If[!OptionValue["3D"],
	Graph[Flatten@Map[Thread,Normal@KeyMap[Table[assColors@#,k]&,featureNearestF[k]],FilterRules[options,Options[Graph]]],VertexLabels->Automatic],
	Graph3D[Flatten@Map[Thread,Normal@KeyMap[Table[assColors@#,k]&,featureNearestF[k]],FilterRules[options,Options[Graph]]],VertexLabels->Automatic]]]

arXivClusterGraphBlock[netF_NetGraph,test_Association,k_Integer(*neighbours*),options:OptionsPattern[arXivClusterGraphBlock]]:=
	arXivClusterGraphBlock[netF,test,k,First@Values@Map[Length,test],options]*)


arXivClusterGraphBlockRandom[netF_NetGraph,test_Association,k_Integer(*neighbours*),n_(*features*),seedSample_:1(*random*),options:OptionsPattern[arXivClusterGraphBlockRandom]]:=
Block[{lgTest,lstRandom,lstID,featuresInfoRd,featuresInfoID,featuresInfo,features,featureNearestF,jCat,legColors,assColors},
	jCat=Length@Union@Lookup[test,"Out"];
	lgTest=First@Values@Map[Length,test];
	lstRandom=(SeedRandom[seedSample];RandomSample[Range@lgTest,n]);
	(*lstID=If[MemberQ[Keys@test,"InIDs"],Lookup[test,"InIDs"],lstRandom];*)
	featuresInfoRd=Association@Table[i->Map[#[[i]]&,test],{i,lstRandom}];
	(*featuresInfoID:=Association@Map[#[[1]]->AssociationThread[{"InTitles","InAbstracts","Out"},Rest[#]]&,Transpose@Values[test]];*)
	featuresInfo=featuresInfoRd(*If[MemberQ[Keys@test,"InIDs"],featuresInfoID,featuresInfoRd]*);
	features=Map[netF,featuresInfo];

	featureNearestF[i_]:=
Map[Take[Part[First@Transpose@#,Flatten@Comap[{PositionSmallest[Last@Transpose@#,i]&},#]],i]&,
GroupBy[Normal@DeleteCases[AssociationThread[Tuples[Keys@features,{2}],MapApply[CosineDistance,Tuples[Values@features,{2}]]],0.],(#[[1,1]]&)->({#[[1,2]],#[[2]]}&)]];

legColors=(*arXivCategoriesColors*)ArXivClusterLegend[jCat];
assColors=Association@KeyValueMap[#1->Style[#1,legColors[#2]]&,Map[Last,featuresInfo]];

If[!OptionValue["3D"],
	Graph[Flatten@Map[Thread,Normal@KeyMap[Table[assColors@#,k]&,featureNearestF[k]],FilterRules[options,Options[Graph]]],VertexLabels->Automatic],
	Graph3D[Flatten@Map[Thread,Normal@KeyMap[Table[assColors@#,k]&,featureNearestF[k]],FilterRules[options,Options[Graph]]],VertexLabels->Automatic]]]

arXivClusterGraphBlockRandom[netF_NetGraph,test_Association,k_Integer(*neighbours*),options:OptionsPattern[arXivClusterGraphBlockRandom]]:=
	arXivClusterGraphBlockRandom[netF,test,k,First@Values@Map[Length,test],options]


arXivClusterGraphBlockID[netF_NetGraph,set_Association,k_Integer(*neighbours*),options:OptionsPattern[arXivClusterGraphBlockID]]:=
Block[{lgTest,lstRandom,lstID,featuresInfoRd,featuresInfoID,featuresInfo,features,featureNearestF,jCat,legColors,assColors},
	jCat=Length@Union@Lookup[set,"Out"];
	lgTest=First@Values@Map[Length,set];(*
	lstRandom=(SeedRandom[seedSample];RandomSample[Range@lgTest,n]);*)
	lstID=Lookup[set,"InIDs"](*If[MemberQ[Keys@set,"InIDs"],Lookup[set,"InIDs"],lstRandom]*);
	(*featuresInfoRd=Association@Table[i->Map[#[[i]]&,set],{i,lstRandom}];*)
	featuresInfoID:=Association@Map[#[[1]]->AssociationThread[{"InTitles","InAbstracts","Out"},Rest[#]]&,Transpose@Values[set]];
	featuresInfo=featuresInfoID(*If[MemberQ[Keys@set,"InIDs"],featuresInfoID,featuresInfoRd]*);
	features=Map[netF,featuresInfo];

	featureNearestF[i_]:=
Map[Take[Part[First@Transpose@#,Flatten@Comap[{PositionSmallest[Last@Transpose@#,i]&},#]],i]&,
GroupBy[Normal@DeleteCases[AssociationThread[Tuples[Keys@features,{2}],MapApply[CosineDistance,Tuples[Values@features,{2}]]],0.],(#[[1,1]]&)->({#[[1,2]],#[[2]]}&)]];

legColors=(*arXivCategoriesColors*)ArXivClusterLegend[jCat];
assColors=Association@KeyValueMap[#1->Style[#1,legColors[#2]]&,Map[Last,featuresInfo]];

If[!OptionValue["3D"],
	Graph[Flatten@Map[Thread,Normal@KeyMap[Table[assColors@#,k]&,featureNearestF[k]]],FilterRules[Join[{VertexLabels->Automatic},{options}],Options[Graph]]],
	Graph3D[Flatten@Map[Thread,Normal@KeyMap[Table[assColors@#,k]&,featureNearestF[k]]],FilterRules[Join[{VertexLabels->Automatic},{options}],Options[Graph]]]]]

(*arXivClusterGraphBlockID[netF_NetGraph,set_Association,k_Integer(*neighbours*),options:OptionsPattern[arXivClusterGraphBlockID]]:=
	arXivClusterGraphBlockID[netF,set,k,First@Values@Map[Length,set],options]*)


(*ArXivClusterGraph[netF_NetGraph,set_Association,k_Integer(*neighbours*),n_(*features*),seedSample_:1(*random*),options:OptionsPattern[ArXivClusterGraph]]:=
	arXivClusterGraphBlockID[netF,set,k,n,seedSample,options]*)
ArXivClusterCategoriesGraph[netF_NetGraph,set_Association,k_Integer(*neighbours*),options:OptionsPattern[ArXivClusterCategoriesGraph]]:=
	arXivClusterGraphBlockID[netF,set,k,options]



(*ArXivClusterGraph[set_Association,k_Integer(*neighbours*),n_(*features*),seedSample_:1(*random*),options:OptionsPattern[ArXivClusterGraph]]:=
	Block[{netF=ArXivFeaturesCategoriesNet[Length@Union@Lookup[set,"Out"]]},
				arXivClusterGraphBlockID[netF,set,k,n,seedSample,options]]*)
ArXivClusterCategoriesGraph[set_Association,k_Integer(*neighbours*),options:OptionsPattern[ArXivClusterCategoriesGraph]]:=
	Block[{netF=ArXivFeaturesCategoriesNet[Length@Union@Lookup[set,"Out"]]},
				arXivClusterGraphBlockID[netF,set,k,options]]


(* ::Subsection::Closed:: *)
(*Further NNs (next release)*)


(* ::Subsubsection:: *)
(*Introductions/formulas/citations embeddings*)


(* ::Subsubsection:: *)
(*Predict date*)


(* ::Subsubsection:: *)
(*Transformer NN classifier*)


(* ::Section:: *)
(*6. LLM functionality*)


(* ::Subsection::Closed:: *)
(*Explain concept*)


Options[ArXivExplainConcept]=Join[{"LLMUse"->True},Options[LLMFunction]];


ArXivExplainConcept[concept_String,id_String,options:OptionsPattern[ArXivExplainConcept]]:=
	Block[{text},
		text=arXivTeXIntroductionSafe[id];
		If[OptionValue["LLMUse"],
		LLMFunction["Given this text: `1`, explain what is the concept: "<>concept,options][text],
		FindTextualAnswer[text,"What is "<>concept<>"?",3,{"Probability","HighlightedSentence"}]]]


ArXivExplainConcept[concept_String,idL_List,options:OptionsPattern[ArXivExplainConcept]]:=
	Block[{texts},
		texts=Normal@arXivTeXIntroductionList[idL];
		If[OptionValue["LLMUse"],
		LLMFunction["Given this list of texts: `1`, explain what is the concept: "<>concept,options][texts],
		Map[FindTextualAnswer[#,"What is "<>concept<>"?",3,{"Probability","HighlightedSentence"}]&,Flatten@Values@texts]]]


(*Options[ArXivExplainAuthor]={"LLMUse"->True};*)


(*add another parameter or option limiting the number of articles and choosing them by citations*)


(* ::Subsection::Closed:: *)
(*Explain Author*)


ArXivExplainAuthor[authorL_List,catL_List,options:OptionsPattern[LLMFunction]]:=
Block[{mapauth,name,articles,intros,summaries,titles,abstracts,summariescomplete},
name=First@TakeLargestBy[authorL,StringLength,1];
mapauth=MapThread[Values[ArXivArticlesAuthor[#1,#2]]&,{authorL,catL}];
articles=Flatten@mapauth;
intros=arXivTeXIntroductionList[articles](*DeleteCases[Map[(ArXivTeXIntroduction[#])&,articles],_?(!MatchQ[#,_String]&)]*);
summaries=Flatten@Values@Map[TextSummarize,intros];
titles=Map[ArXivTitles,articles];
abstracts=Map[ArXivAbstracts,articles];
summariescomplete=MapThread["Article: "<>#1<>";\n"<>"Title: "<>#2<>";\n"<>"Abstract: "<>#3<>";\n"<>"Summary:\n"<>#4&,{articles,titles,abstracts,summaries}];
LLMFunction["Given the article summaries `1`, create a report of the work of their author, "<>name,options][summariescomplete]]


ArXivExplainAuthor[authorL_List,cat___,options:OptionsPattern[LLMFunction]]:=
Block[{mapauth,name,articles,intros,summaries,titles,abstracts,summariescomplete},
name=First@TakeLargestBy[authorL,StringLength,1];
mapauth=Map[Values[ArXivArticlesAuthor[#1,cat]]&,authorL];
articles=Flatten@mapauth;
intros=arXivTeXIntroductionList[articles](*DeleteCases[MapIndexed[((*Print[First@#2];*)ArXivTeXIntroduction[#])&,articles],_?(!MatchQ[#,_String]&)]*);
summaries=Flatten@Values@Map[TextSummarize,intros];
titles=Map[ArXivTitles,articles];
abstracts=Map[ArXivAbstracts,articles];
summariescomplete=MapThread["Article: "<>#1<>";\n"<>"Title: "<>#2<>";\n"<>"Abstract: "<>#3<>";\n"<>"Summary:\n"<>#4&,{articles,titles,abstracts,summaries}];

LLMFunction["Given the article summaries `1`, create a report of the work of their author, "<>name,options][summariescomplete]]

ArXivExplainAuthor[author_String,options:OptionsPattern[LLMFunction]]:=ArXivExplainAuthor[{author},options]
ArXivExplainAuthor[author_String,cat_,options:OptionsPattern[LLMFunction]]:=ArXivExplainAuthor[{author},{cat},options]


ArXivExplainAuthor[author_Entity,options:OptionsPattern[LLMFunction]]:=
Block[{mapauth,name,articles,intros,summaries,titles,abstracts,summariescomplete},
name=First@TakeLargestBy[author["Names"],StringLength,1];
articles=author["Articles"];
intros=arXivTeXIntroductionList[articles];
summaries=Flatten@Values@Map[TextSummarize,intros];

titles=Map[ArXivTitles,articles];
abstracts=Map[ArXivAbstracts,articles];
summariescomplete=MapThread["Article: "<>#1<>";\n"<>"Title: "<>#2<>";\n"<>"Abstract: "<>#3<>";\n"<>"Summary:\n"<>#4&,{articles,titles,abstracts,summaries}];


LLMFunction["Given the article summaries `1`, create a report of the work of their author, "<>name,options][summariescomplete]]


(* ::Section:: *)
(*-1. Package Footer*)


End[];
EndPackage[];
