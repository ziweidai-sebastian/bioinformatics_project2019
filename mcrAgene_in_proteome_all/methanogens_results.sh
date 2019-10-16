for i in {1..9}
do
	cat mcrAgene_in_proteome_0$i.txt >> methanogens_results.txt
done

for i in {10..50}
do
	cat mcrAgene_in_proteome_$i.txt >> methanogens_results.txt
done

