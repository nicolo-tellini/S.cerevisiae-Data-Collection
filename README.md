# S.cerevisiae-Data-Collection
S.cerevisiae Data Collection

# who we are 
# what's inside
-scr
-sample tab
# data provided
# pipeline
# filtering
# HOWTO

- keep only variant positions (SNPs)
  
```
zcat gvcf.gz | grep -E "0/1|1/1" | bgzip > vcf.gz 

```
- get specific samples
 
 ```
 # A list of strains
 bcftools view -S ThisFileContainsOneStrainPerLine.txt vcf.gz -Oz -o myfavoritesamples.gvcf.gz
 
 # A couple of strains
 bcftools view -s AAA,ALH vcf.gz -Oz -o myfavoritesamples.gvcf.gz
 
 ```
 
- rename strains in the header
 
 ```
 # 1) extract the headear
 bcftools head gvcf.gz > header.txt
 
 # 2) replace SRR and ERR codes with strain names
 
 for j in $(cat strainlist.txt)
 do
 k=$(grep -w $j strainlist.txt | cut -f3)
 sed -i "s/\<${j}\>/${k}/g" header.txt
 done
 
 # 3) Add the new header to  
 bcftools reheader -h header.txt -o gvcf.new.gz gvcf.gz

  ```
# Further things you want perform
 ```
 plink missing
 
 bcftools stats
 ```
# FAQ
Q: Only the 1011 S.cerevisae collection mantains the three letter code, where I can download the reads? 

A: At ENA archive project code PRJEB13017, note that fastqs have the three letter code followed by OSW; the number after the second underscore indicate the reads orientation (e.g.BCM_**CAA**OSW_2_**1**_C3F32ACXX.IND4_clean.fastq.gz is CAA_R1.fastq.gz)

Q: The 1011 S.cerevisae collection takes around 1TB, can I have a reduced size of the collection? 

A: We did subsamples the fasqs at an estimated coverage of X40 and X20. This datasets are available on requests (see  [how to request additional data]())

Q: Why do you named the strains using the ENA archive Run Accession?

Q: I do not like your filtering

Q: I want the bam 

Q: I want a subset of the bam

Q: I want separate gVCFs

# how to request additional data

To: nicolo.tellini.2@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY

To: matnamo@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY

keep in mind: 
- timing (2/4 weeks)
- queue 
- anticipate the request
