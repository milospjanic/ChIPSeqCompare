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


cat file.2


./ChIPSeqCompare.sh file.1 file.2 TFX TFY
</pre>

# Examples
Example of a strong correlation between two factors indicating either synergistic binding to DNA of two factors (one factor helping the other one) or the presence of the two factors in a same protein complex.

![alt text](https://github.com/milospjanic/ChIPSeqCompare/blob/master/forGit.3.png)
