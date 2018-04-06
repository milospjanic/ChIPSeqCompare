# ChIPSeqCompare

ChIPSeqCompare is a script that compares two ChIPSeq experiments, calculates overlapping regions using bedtools and provides distributions of normalized fold change (in a relative scale 0-100) for overlapping binding sites. It outputs a normalized fold change correlation plot indicating synergistic or antagonistic binding of two factors.

# Usage

To run the script download the .sh file

<pre>
wget https://raw.githubusercontent.com/milospjanic/ChIPSeqCompare/master/ChIPSeqCompare.sh
chmod 755 ChIPSeqCompare.sh
</pre>

Run the script providing the two ChIPSeq file names and the two TF name that will be plotted on the graph.
<pre>
cat file.1
chr1	234413	234875	11.10171
chr1	437737	438028	5.28653
chr1	464787	465135	12.97743
chr1	531621	531932	4.16333
chr1	564665	566826	3.79419
chr1	567243	567748	6.21398
chr1	568692	569022	8.21949
chr1	569159	570390	16.70131
chr1	726773	727043	6.08584
chr1	755430	755639	4.75787


cat file.2
chr1	9987	10299	53.33
chr1	10335	10456	13.93
chr1	26041	26273	7.14
chr1	31792	32271	7.69
chr1	34189	34641	9.14
chr1	34678	35111	11.61
chr1	38548	38825	6.41
chr1	143851	144131	8.63
chr1	173502	173882	15.25
chr1	253268	253448	11.57


./ChIPSeqCompare.sh file.1 file.2 TFX TFY
</pre>

# Examples
Example of a strong correlation between the binding of two factors indicating either synergistic binding to DNA of two factors (one factor helping the other one binds) or the presence of the two factors in a same protein complex. Third option is that these are members of the same TF family and that they stably interchange in the binding complex, hence at each bining site a stable equilibrium is achieved. 

![alt text](https://github.com/milospjanic/ChIPSeqCompare/blob/master/forGit.3.png)



Second example is shows the absence of correlation, with points equally distribited in all areas of the graph.



![alt text](https://github.com/milospjanic/ChIPSeqCompare/blob/master/forGit.4.png)


Third example shows anticorrelation with binding sites appearing to be strongly anticorrelated (in red/green areas of the graph)


![alt text](https://github.com/milospjanic/ChIPSeqCompare/blob/master/forGit.5.png)


Two following examples show two possible artefacts of the ChIPSeq method. First one shows a full corelation for the two factors that are in the same binding complex (JUN, FOS). Fold changes could appear higher in one set when one antibody is stronger then the other one (or due to some other technical factor).


![alt text](https://github.com/milospjanic/ChIPSeqCompare/blob/master/FOS_macs_peaks.bed.txt.JUN_macs_peaks.bed.txt.output.png)


Finally when one dataset is saturated (sequenced to the maximum), each binding site will have consistently higher fold changes than the other data set. Hence, a systemic artefact represented as almost a vertical shape of the correlation.

![alt text](https://github.com/milospjanic/ChIPSeqCompare/blob/master/forGit.2.png)
