<p align="center">
  <img src="https://github.com/nicolo-tellini/S.cerevisiae-gVCF/blob/main/img/imagelogo.png" alt="phylo logo" width="500"/> 
</p>

[![Licence](https://img.shields.io/github/license/nicolo-tellini/S.cerevisiaeData?style=plastic)](https://github.com/nicolo-tellini/S.cerevisiaeData/blob/main/LICENSE)
[![Release](https://img.shields.io/github/v/release/nicolo-tellini/S.cerevisiaeData?style=plastic)](https://github.com/nicolo-tellini/S.cerevisiaeData/releases/tag/v.1)
[![release date](https://img.shields.io/github/release-date/nicolo-tellini/S.cerevisiaeData?color=violet&style=plastic)](https://github.com/nicolo-tellini/S.cerevisiaeData/releases/tag/v.1)
[![commit](https://img.shields.io/github/last-commit/nicolo-tellini/S.cerevisiaeData?color=yellow&style=plastic)](https://github.com/nicolo-tellini/S.cerevisiaeData/graphs/commit-activity)

## NEWS:
 Easer access to the collection and the manuscripts 

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
- short illumina reads data of the hybrids ScerxSpar OS162 and OS2389
```

## COLLECTIONS

| First Name  | Year | Population | Paper |
| :---         | :---         | :---         | :---         |
| Dunn cooming soon | 2012  | - | [link]()  |
| Skelly | 2013  | Beer | [link](https://www.nature.com/articles/s41559-019-0997-9)  |
| Marsit (GENOWINE proj)  | 2015  | Wine  | [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4476156/)  |
| Marsit (EVOLYA proj) cooming soon | 2015  | Wine  | [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4476156/)  |
| Almeida | 2015  | Mediterranean/North America/Japan  | [link](https://onlinelibrary.wiley.com/doi/10.1111/mec.13341)  |
| Strope (100-genome proj) | 2015  | Multi | [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4417123/)  |
| Barbosa  | 2016  | Brasilian  | [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4779607/)  |
| cooming soon | 201?  | Clinical | [link]()  |
| Gonçalves | 2016  | wine/beer  | [link](https://www.cell.com/current-biology/fulltext/S0960-9822(16)30984-8?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0960982216309848%3Fshowall%3Dtrue)  |
| cooming soon | 2016  | Wine | [link]()  |
| Gallone | 2016  | Beer | [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5018251/)  |
| Almeida coming soon | 2017 | - | [link]()  |
| Barbosa | 2018  | Cachaça  | [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6101510/)  |
| Peter and De Chiara (1011 proj)  | 2018  | Multi  | [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6784862/)  |
| Legras | 2018  | Wine/Fermented food environments  | [link](https://pubmed.ncbi.nlm.nih.gov/29746697/)  |
| Duan | 2018  | Chinese | [link](https://pubmed.ncbi.nlm.nih.gov/30002370/)  |
| Ramazzotti | 2019  | Wine/insect  | [link](https://ami-journals.onlinelibrary.wiley.com/doi/10.1111/1462-2920.14422)  |
| Pontes | 2019  | Alpechin  | [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6548830/)  |
| Gallone | 2019  | Beer | [link](https://www.nature.com/articles/s41559-019-0997-9)  |
| Fay coming soon | 2019  | Beer | [link](https://www.nature.com/articles/s41559-019-0997-9)  |
| cooming soon | 202?  | NZ | [link]()  |
| cooming soon | 202?  | African Fermented Food | [link]()  |
| cooming soon | 202?  | Wild | [link]()  |
| cooming soon | 202?  | ??? | [link]()  |





## SOFTWARE

* [bwa](https://github.com/lh3/bwa/releases/tag/v0.7.17) v. 0.7.17-r1198-dirty

* [samtools](https://github.com/samtools/samtools/releases/tag/1.14) v. 1.14

* [bcftools](https://github.com/samtools/bcftools/releases/tag/1.15.1) v. 1.15.1

## gVCF/BCF FEATURES

The fastqs have been aligned against [S288C_reference_genome_R64-3-1_20210421.fa](http://sgd-archive.yeastgenome.org/sequence/S288C_reference/genome_releases/S288C_reference_genome_R64-3-1_20210421.tgz) (*Scer.genome.fa* in ```pipeline/rep```). 

The files are provided in text format (```.gvcf```).

All the genomic positions are included (as long as at least 1 strain has been genotyped at that position).

Chromosome names are lower case and mantain roman numerals eg. chrIII (chrMT is the only exception).

Strain names are replaced by the ENA archive *Run Accession*.

The HOWTO below allows to rename the strains in the header.

<details><summary>Example</summary>
    
  The strain **MTZ13.12** in the gVCF is named SRR7851920. Renaming SRR7851920 results in **MTZ13.12** 
  
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
 bcftools query -l gvcf.gz
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


Please cite this paper when using data for the 1674 strains for your publications.

> Ancient and recent origins of shared polymorphisms in yeast </br>
> Nicolò Tellini, Matteo De Chiara, Simone Mozzachiodi, Lorenzo Tattini, Chiara Vischioni, Elena S. Naumova, Jonas Warringer, Anders Bergström & Gianni Liti </br>
> Nature Ecologya and Evolution, 2024, https://doi.org/10.1038/s41559-024-02352-5

```
@article{tellini2024ancient,
  title={Ancient and recent origins of shared polymorphisms in yeast},
  author={Tellini, Nicol{\`o} and De Chiara, Matteo and Mozzachiodi, Simone and Tattini, Lorenzo and Vischioni, Chiara and Naumova, Elena S and Warringer, Jonas and Bergstr{\"o}m, Anders and Liti, Gianni},
  journal={Nature Ecology \& Evolution},
  pages={1--16},
  year={2024},
  publisher={Nature Publishing Group UK London}
}
```
