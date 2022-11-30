*S.cerevisiae* gVCF 1600 samples

<p align="center">
  <img src="https://github.com/nicolo-tellini/S.cerevisiae-gVCF/blob/main/imagelogo.png" alt="S.cer phylo"/>
</p>

BTS

<details>
</br>
Based on a true story. 

PART I: the logo

NT:"I like this logo!"

MDC:"Of course! it is identical to MY tree which is magnificent"
</details>

## :open_file_folder: CONTENT

What's inside:

- scr
- sample tab
- linktothegVCF.txt

BTS

<details>
</br>
Based on a true story.

PART II: the trailer?!

NT:"I want to replace the bullet points with the directory tree"

MDC:"a trailer!?"

NT:"a trailer? An opening!"

The opening: [centuryfoxbadflute](https://www.youtube.com/watch?v=2IRcM9qwDwo)

</details>

## :computer: SOFTWARE

* [bwa](https://github.com/lh3/bwa/releases/tag/v0.7.17) v. 0.7.17-r1198-dirty
* [samtools](https://github.com/samtools/samtools/releases/tag/1.14) v. 1.14
* [bcftools](https://github.com/samtools/bcftools/releases/tag/1.15.1) v. 1.15.1

## :sos: HOWTO

- keep only variant positions (SNPs)
  ```
  zcat gvcf.gz | grep -E "0/1|1/1" | bgzip > vcf.gz
  ```
- get specific samples
  ```
  # A list of strains
  bcftools view -S ThisFileContainsOneStrainPerLine.txt vcf.gz -Oz -o myfavoritesamples.gvcf.gz
  ```
  ```
  # A couple of strains
  bcftools view -s AAA,ALH vcf.gz -Oz -o myfavoritesamples.gvcf.gz
  ```
 
- rename strains in the header
  1) extract the headear
  ```
  bcftools head gvcf.gz > header.txt
  ```
  2) replace SRR and ERR codes with strain names
  ```
  for j in $(cat strainlist.txt)
  do
  k=$(grep -w $j strainlist.txt | cut -f3)
  sed -i "s/\<${j}\>/${k}/g" header.txt
  done
  ```
  3) Add the new header to *gvcf.new.gz*
  ```
  bcftools reheader -h header.txt -o gvcf.new.gz gvcf.gz
  ```
- Statistics on *allele frequency, depth distribution, stats by quality and per-sample counts, singleton stats, etc.* (cit. [bcftools stats](https://samtools.github.io/bcftools/bcftools.html#stats)).
  ```
  bcftools stats gvcf.gz > gvcf.stats
  ```

## :e-mail: REQUEST FOR ADDITIONAL DATA

Short-term contact:</br>
To: nicolo.tellini.2@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY

note: If I (Nicolò Tellini) do not reply in 5 working days I am probably hard coding/debugging, freaking out because of the dissertation, sampling *Saccharomyces* in a remote place, tryharding in CoD or all four together.</br>
Feel free to contact Dr. Matteo De Chiara.

Long-term contact:</br>
To: matnamo@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY

## :scroll: CITATION

Please cite the paper below when using the data for your publications, along with the papers to the collections you use and the software listed above.

> Ancient and modern origin of shared polymorphisms among two yeast species </br>
> Nicolò Tellini, Matteo De Chiara, Simone Mozzachiodi, Lorenzo Tattini, Chiara Vischioni, Elena S Naumova, Anders Bergström and Gianni Liti </br>
> BioRxiv
