
#!/bin/bash


bedtools intersect -a $1  -b $2  -wa -wb > $1.$2.intersect
cut -f4,8 $1.$2.intersect > $1.$2.intersect.cut
cp $1.$2.intersect.cut test.txt
cut -f4 $1 >file.1
cut -f4 $2 >file.2

#write R script to get ENSEMBL id, needs biomaRt in R

echo "#!/usr/bin/Rscript

library (ggplot2)
x<-read.table(\"test.txt\", header=F)
x\$V3<-(x\$V1-min(x\$V1))/(max(x\$V1)-min(x\$V1))*100
x\$V4<-(x\$V2-min(x\$V2))/(max(x\$V2)-min(x\$V2))*100
x\$V5<-ifelse(x\$V3/x\$V4 < 0.5, \"red\", ifelse((x\$V4/x\$V3 < 0.5), \"darkgreen\", \"deepskyblue3\"))

o4 <- ggplot(x, aes(x\$V1, x\$V2)) + geom_point(colour=x\$V5, alpha=0.25) + geom_density2d(colour=\"black\")


pdf(\"$1.$2.output.pdf\")
o4 + theme(axis.text=element_text(size=24),axis.title=element_text(size=26))+ labs(title = \"Overlapping $3 and $4 sites \", x=\"Normalized $3 binding \", y=\"Normalized $4 binding\") + theme(plot.title = element_text(size = rel(2)))
dev.off()

x<-read.table(\"file.1\", header=F)
pdf(\"$1.initial_distribution.pdf\")
o5<-ggplot(x, aes(x=V1)) + geom_histogram(color=\"black\", fill=\"darkgreen\")
o5+ theme(axis.text=element_text(size=24),axis.title=element_text(size=26))+ labs(title = \"$3 ChIPSeq\",x = \"$3 Fold Change Distribution\", y=\"Frequency\") + theme(plot.title = element_text(size = rel(2)))

dev.off()

x<-read.table(\"file.2\", header=F)
pdf(\"$2.initial_distribution.pdf\")
o6<-ggplot(x, aes(x=V1)) + geom_histogram(color=\"black\", fill=\"red\")
o6+ theme(axis.text=element_text(size=24),axis.title=element_text(size=26))+ labs(title = \"$4 ChIPSeq\",x = \"$4 Fold Change Distribution\", y=\"Frequency\") + theme(plot.title = element_text(size = rel(2)))
dev.off()
" > script.r

#run R script

chmod 775 script.r
./script.r


rm $1.$2.intersect.cut
rm file.1
rm file.2

rm script.r

#hist(x\$V1, breaks=100, xlab=\"Fold Change Distribution - $4 binding\", main=\"$4 ChIPSeq\", col=\"red\", cex.lab = 2)
#hist(x\$V1, breaks=100, xlab=\"Fold Change Distribution - $3 binding\", main =\"$3 ChIPSeq\", col=\"darkgreen\",cex.lab = 2)
