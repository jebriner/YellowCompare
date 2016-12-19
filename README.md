# YellowCompare


**Purpose:** 

For several different visual systems, compare the visibility of Heliconius yellow vs. Eueides yellow. This applies the predictions of our discriminability modeling to complex spectra measured from butterfly wings. 

**Goal:** 

For each visual system, get the percentage of pairwise comparisons that exceed 1 JND.

**Hypothesis:** 
The violet receptor (UV2) is coded for by the more derived UV gene copy (UVRh2). This new UV2 photoreceptor with its long-shifted sensitivity may replace the UV1 receptor because it does a better job allowing butterflies to distinguish different species' yellow wing pigments, giving them an edge in species recognition.

The comparison of the actual male H. erato eye vs. the hypothetical eye tests this hypothesis. Is the actual male *H. erato* eye better at discriminating *Eueides* yellow from *Heliconius* yellow? Vision is costly, and if an animal can only afford 3 photoreceptors, it makes sense to for it to change its UV photoreceptor to the one that does a better job discriminating between ecologically relevant signals, like those used for intraspecific recognition. 

------------------------------------------------------------


**Inputs:** 

1. SPEC output for the visual systems 
2. a spreadsheet of the spectra of different yellow pigments (groups: Heliconius or Eueides)

**Process:** 

Do pairwise discriminability between different visual models 

1. female *H. erato* **(UV1, UV2, B, L)**
2. male *H. erato* **(UV2, B, L)**
3. a hypothetical, ancestral male *H. erato* eye **(UV1, B, L)**: has UV1 [like a female] rather than UV2)
4.  *H. melpomene* (sexually monomorphic) **(UV1, B, L)**
4.  *H. ismenius* (sexually monomorphic) **(UV1, B, L)**


Run data for *H. melpomene* eye (using SPEC to process Kyle's smoothed sensitivity curves from electrophysiology experiments). Can use M or F *H. melpomene* for this, since they're visually monomorphic. Reveals how good we can expect *H. melpomene* to be at discriminating *Eueides* yellow from *Heliconius* yellow.


**Expectations:** 

Adriana has previously calculated that 73% of pairwise pigment comparisons are > 1 JND for the male *H. erato* visual system, while only 45% are > 1 JND for the hypothetical male *H. erato* eye.



