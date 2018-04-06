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
Example of a strong correlation between the binding of two factors indicating either synergistic binding to DNA of two factors (one factor helping the other one binds) or the presence of the two factors in a same protein complex. Third option is that these are members of the same TF family and that they stably interchange in the binding complex, hence at each bining site a stable equilibrium is achieved. 

![alt text](https://github.com/milospjanic/ChIPSeqCompare/blob/master/forGit.3.png)


Second example is shows the absence of correlation, with points equally distribited in all areas of the graph.

![alt text](https://github.com/milospjanic/ChIPSeqCompare/blob/master/forGit.4.png)
