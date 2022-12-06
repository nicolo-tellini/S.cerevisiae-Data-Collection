*S.cerevisiae* gVCF 1600 samples

<p align="center">
  <img src="https://github.com/nicolo-tellini/S.cerevisiae-gVCF/blob/main/imagelogo.png" alt="S.cer phylo"/>
</p>

## :open_file_folder: CONTENT

What's inside:

- scr
- sample tab
- linktothegVCF.txt

## :computer: SOFTWARE

* [bwa](https://github.com/lh3/bwa/releases/tag/v0.7.17) v. 0.7.17-r1198-dirty
* [samtools](https://github.com/samtools/samtools/releases/tag/1.14) v. 1.14
* [bcftools](https://github.com/samtools/bcftools/releases/tag/1.15.1) v. 1.15.1

## gVCF FEATURES

All the genomic positions are included.

Chromosome names are lower case and (sadly) mantain roman numerals eg. chrIII (chrMT is the only exception). 

<details><summary>Warning</summary>
    
    plink without --aec will convert chrX in chr23 
     
</details>

For the joy of bioinfo, strain names are replaced by the ENA archive Run Accession.

The HOWTO below ("rename strains in the header") allows to rename the strains.

<details><summary>Example</summary>
    
      The strain *UWO 03-433.3* from Malaysian clade in the gVCF is named ERR1352879.
  
      Renaming ERR1352879 results in 
  
      ERR1352879-UWO_03_433_3-Malaysian
  
      NOTE: also white spaces in the name are replaced with underscore
     
</details>
     
The use of the Run Accession facilitates the filtering phase.

This prevents the misselection of strains with overlapping, similar, multisymbolic names.

Moreover, renaming the strains results in an easy-to-parse meaningful dash-separated tag.

I recommend to run it at the last of your analyses.

## :wrench: HOWTO

Before subsetting, index the VCF with 

```
bcftools index vcf.gz
```

 - get a group of samples
 ```
 bcftools view -S thisFIELcontainsONEstrainPERline.txt vcf.gz -Oz -o myfavoritesamples.gvcf.gz
 ```

 - get specific region/s
 ```
 bcftools view -R thisFILEcontainsCHRstartENDtabSEPARATEDcoordinates.bed vcf.gz -Oz -o myfavoritesamples.gvcf.gz
 ```
 
 - keep only variant positions (SNPs)
 ```
 zcat gvcf.gz | grep -E "0/1|1/1" | bgzip > vcf.gz
 ```
 NOTE: the output of this command will remove the header. 
 Nevermind, we can put it back.
 
 - extract the headear from the original gVCF
 ```
 bcftools head gvcf.gz > header.txt
 ```
 NOTE: If you want **keep** the ENA archive Run Accession codes as strain names jump to 2. If you want **replace** the ENA archive Run Accession codes with the original strain names follow all the steps. 
        
 1) replace ENA archive Run Accession codes with the original strain names
 
 ```
 for j in $(cat strainlist.txt)
 do
  k=$(grep -w $j strainlist.txt | cut -f3)
  sed -i "s/\<${j}\>/${k}/g" header.txt
 done
 ```
 2) Add the new header to *gvcf.new.gz*
 ```
 bcftools reheader -h header.txt -o vcf.newheader.gz vcf.gz
 ```
 - Statistics on *allele frequency, depth distribution, stats by quality and per-sample counts, singleton stats, etc.* (cit. [bcftools stats](https://samtools.github.io/bcftools/bcftools.html#stats)).
 ```
 bcftools stats gvcf.gz > gvcf.stats
 ```

## :paperclip: ADDITIONAL DATA

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


## :e-mail: CONTACTS

Short-term contact:</br>
To: nicolo.tellini.2@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY

note: If I (Nicolò Tellini) do not reply in 5 working days I am probably hard coding/debugging, freaking out because of the dissertation, sampling *Saccharomyces* in a remote place or tryharding in CoD.</br>

Feel free to contact Dr. Matteo De Chiara.

Long-term contact:</br>
To: matnamo@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY

## :scroll: CITATION

Please cite the paper below when using the data for your publications, along with the papers to the collections you use and the software listed above.

> Ancient and modern origin of shared polymorphisms among two yeast species </br>
> Nicolò Tellini, Matteo De Chiara, Simone Mozzachiodi, Lorenzo Tattini, Chiara Vischioni, Elena S Naumova, Anders Bergström and Gianni Liti </br>
>
