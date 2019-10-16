#align mcrAgene
for i in {1..9}
do
	cat ./bioinformatics_project2019/proteomes/proteomes_0$i.fasta
	./muscle3.8.31_i86linux64 -in ./bioinformatics_project2019/ref_sequences/mcrAgene_0$i.fasta -out ./bioinformatics_project2019/ref_sequences/mcrAgene_0$i.afasta -maxiters 1
done

for i in {10..18}
do
	./muscle3.8.31_i86linux64 -in ./bioinformatics_project2019/ref_sequences/mcrAgene_$i.fasta -out ./bioinformatics_project2019/ref_sequences/mcrAgene_$i.afasta -maxiters 1
done

#building profile from alignment
for i in {1..9}
do	
	/afs/crc.nd.edu/user/z/zdai2/hmmer-3.2.1/src/hmmbuild /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/ref_sequences/mcrAgene_0$i.hmm /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/ref_sequences/mcrAgene_0$i.afasta
done

for i in {10..18}
do
	/afs/crc.nd.edu/user/z/zdai2/hmmer-3.2.1/src/hmmbuild /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/ref_sequences/mcrAgene_$i.hmm /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/ref_sequences/mcrAgene_$i.afasta
done

#search for mcrAgene sequence in proteomoes
for i in {1..9} #mcrAgene numbering
do
	for x in {1..9} #proteome numbering
	do
		/afs/crc.nd.edu/user/z/zdai2/hmmer-3.2.1/src/hmmsearch --tblout mcrAgene_in_proteome_0$x.txt /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/ref_sequences/mcrAgene_0$i.hmm /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/proteomes/proteome_0$x.fasta
	done
	for x in {10..50}
	do
		/afs/crc.nd.edu/user/z/zdai2/hmmer-3.2.1/src/hmmsearch --tblout mcrAgene_in_proteome_$x.txt /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/ref_sequences/mcrAgene_0$i.hmm /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/proteomes/proteome_$x.fasta
	done
done
for i in {10..18}
do
	for x in {1..9}
	do
		/afs/crc.nd.edu/user/z/zdai2/hmmer-3.2.1/src/hmmsearch --tblout mcrAgene_in_proteome_0$x.txt /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/ref_sequences/mcrAgene_$i.hmm /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/proteomes/proteome_0$x.fasta
	done
	for x in {10..50}
	do
		/afs/crc.nd.edu/user/z/zdai2/hmmer-3.2.1/src/hmmsearch --tblout mcrAgene_in_proteome_$x.txt  /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/ref_sequences/mcrAgene_$i.hmm /afs/crc.nd.edu/user/z/zdai2/bioinformatics_project2019/proteomes/proteome_$x.fasta 
	done
done

