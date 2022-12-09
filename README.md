<img
  src="https://github.com/nicolo-tellini/S.cerevisiae-gVCF/blob/main/img/imagelogo.png"
  alt="Superset"
  width="500"
/>

[![Licence](https://img.shields.io/github/license/nicolo-tellini/S.cerevisiaeData)](https://github.com/nicolo-tellini/S.cerevisiaeData/blob/main/LICENSE)
[![Release](https://img.shields.io/github/v/release/nicolo-tellini/S.cerevisiaeData)](https://github.com/nicolo-tellini/S.cerevisiaeData/releases/tag/v.1)
[![Downloads](https://img.shields.io/github/downloads/nicolo-tellini/S.cerevisiaeData/total)]()


## CONTENT

What's inside:

```
- pipeline
- scerstrains.csv # info on S.cer. strains
- sceradditionalstrains.txt # sequencing not available in ENA but downloadable elsewhere
- scerlowcoveragestrains.txt # scer strains without DP filtering
- publicdata.txt # link to the data
- QRCode.png # access to the data
- collectionIncluded.txt # collection references
```

## SOFTWARE

* [bwa](https://github.com/lh3/bwa/releases/tag/v0.7.17) v. 0.7.17-r1198-dirty

* [samtools](https://github.com/samtools/samtools/releases/tag/1.14) v. 1.14

* [bcftools](https://github.com/samtools/bcftools/releases/tag/1.15.1) v. 1.15.1

## gVCF/BCF FEATURES

The fastqs have been aligned against [S288C_reference_genome_R64-3-1_20210421.fa](http://sgd-archive.yeastgenome.org/sequence/S288C_reference/genome_releases/S288C_reference_genome_R64-3-1_20210421.tgz) (*Scer.genome.fa* in ```pipeline/rep```). 

The files are both provided in binary (```.bcf```) and text format (```.gvcf```).

All the genomic positions are included (as long as at least 1 strain has been genotyped at that position).

Chromosome names are lower case and mantain roman numerals eg. chrIII (chrMT is the only exception).

For the joy of bioinfo., strain names are replaced by the ENA archive *Run Accession*.

The HOWTO below allows to rename the strains in the header.

<details><summary>Example</summary>
    
  The strain **UWO 03-433.3** in the gVCF is named ERR1352879. Renaming ERR1352879 results in **UWO 03-433.3** 
  
</details>
     
The use of the Run Accession facilitates the filtering phase. This prevents the misselection of strains with overlapping, similar or multisymbolic names.

The gVCFs/BCFs were filtered as follow:

- MQ >= 5

- QUAL >= 20

- DP >= 10

NOTE: some of the *S.cerevisiae* isolates were made available via custom website; these strains are listed in *sceradditionalstrains.txt* and genomic data stored in *sceradditionalstrains* files;

NOTE: some of the *S.cerevisiae* isolates were low coverage (DP filtering was not applied); these strains are listed in *scerlowcoveragestrains.txt* and genomic data stored in *scerlowcoveragestrains* files.


## DATA ACCESS

:link: [Public link](https://github.com/nicolo-tellini/S.cerevisiaeData/blob/main/publicdata.txt)

<p align="left">
  <img src="https://github.com/nicolo-tellini/S.cerevisiaeData/blob/main/img/ScerPublic-QRcode_correct.png" alt="QRCODE"/>
</p>


## HOWTO

 - extract per-sample/s data
 ```
 bcftools view -S thisFIELcontainsONEstrainPERline.txt gvcf.gz -Oz -o myfavoritesamples.gvcf.gz
 ```

 - extract per-region/s data
 ```
 bcftools view -R thisFILEcontainsCHRstartENDtabSEPARATEDcoordinates.bed gvcf.gz -Oz -o myfavoritesamples.gvcf.gz
 ```
 
 - extract only variant positions (SNPs)
 ```
 bcftools view -e 'ALT="."' gvcf.gz -Oz -o vcf.gz
 ```
 
 - replace ENA archive Run Accession codes with the original strain names 
 
 Before proceed: the order of the ENA archive *Run Asccession* in *scerstrains.csv* *must* be the same of the output given by
 
  ``` 
 bcftools query -l --samples gvcf.gz
 ```
 
   <details><summary>Important</summary>
    
  The file we provide is already ordered but, if you subsetted by samples you need to subset *scerstrains.csv* and be sure the order is mantained as intended. 
  
</details>
 
 If/when the order is the same you can move to the next step.
 
 ```
 cut -f2 scerstrains.csv | grep -v strainName > fromENAtoStrainName.txt
 
 bcftools reheader --samples fromENAtoStrainName.txt -Oz -o gvcf.renamedstrains.gz gvcf.gz
 ```
 
 - renaming the strains in any other ```.txt``` file from downstream analyses.
   
 Make a copy (backup copy) of the ```.txt``` file before running ```sed``` (*sed* is as powerful as dangerous).
 
 ```
 for j in $(cut -f1 DATAonSCER.csv | grep -v vcfname)
 do
  k=$(grep -w $j DATAonSCER.csv | cut -f2)
  sed -i "s+\<${j}\>+${k}+g" myresults.txt
 done
 ```

## ADDITIONAL DATA

Additional data are stored in a network attached storage (NAS) and shared through a personal *link* protected by *password*; both will be provided by email.

The **password** is *personal and unique*.

The **access** to the data is *restricted* to a few devices for security reasons.

The **validity period** of the link is *limited to the date the download is ultimated*.

Additional data:

- single-strain gVCF (filtered as described below) [available]
  <details><summary>Filters</summary>
  
     MQ >= 5
  
     QUAL >= 20
  
     DP >= 10
  
  </details>

- single-strain BAM files [not available but can be request]

- Any other intermediate file [not available but can be request]


## CONTACTS

Short-term contact:</br>
To: nicolo.tellini.2@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY

Long-term contact:</br>
To: matnamo@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY

## VERSION

| Version | Date          |   N. isolates    |
| ------- | ------------------ | ----------- |
| 1.0     | 09/12/2022     | 1,674 |


## CITATION

Please cite the paper below when using the data for your publications, along with the papers to the collections you use and the software listed above.

>  </br>
> Nicolò Tellini,</br>
>
