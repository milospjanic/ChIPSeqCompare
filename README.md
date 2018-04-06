# ChIPSeqCompare

ChIPSeq compare is a script that compares two ChIPSeq experiments, calculates overlapping regions using bedtools and provides distributions of normalized fold change (in a relative scale 0-100) for overlapping binding sites. It outputs a normalized fold change correlation plot indicating synergistic or antagonistic binding of two factors.

# Usage

To run the script download the .sh file

<pre>
wget https://raw.githubusercontent.com/milospjanic/ChIPSeqCompare/master/ChIPSeqCompare.sh
chmod 755 ChIPSeqCompare.sh
</pre>

Run the script providing the two ChIPSeq file names and the two TF name that will be plotted on the graph.
<pre>
cat gene
SLC22A4

./HCASMCeQTLviewer.sh gene rs1537373 9 
</pre>

# Examples
Example of a strong eQTL for FES gene.

![alt text](https://github.com/milospjanic/HCASMCeQTLviewer/blob/master/rs2521501.png)
