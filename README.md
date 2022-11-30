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

- keep only vaiant positions (SNPs)
  
```
zcat gvcf.gz | grep -E "0/1|1/1" | bgzip > vcf.gz 

```
- rename the header
 
 ```
 # 1) extract the headear
 bcftools head gvcf.gz > header.txt
 
 # 2) replace SRR and ERR name with strain names
 for j in $(cat strainlist.txt)
 do
 
 k=$(grep -w $j strainlist.txt | cut -f3)
 sed -i "s/\<${j}\>/${k}/g" header.txt
 
 done
 
 # 3) Add the new header to  
 bcftools reheader -h header.txt -o gvcf.new.gz gvcf.gz

  ```

  
  - get specific samples
 
 ```
 # A list of strains
 bcftools view -S ThisFileContainsOneStrainPerLine.txt vcf.gz -Oz -o myfavoritesamples.gvcf.gz
 
 # A couple of strains
 bcftools view -s AAA,ALH vcf.gz -Oz -o myfavoritesamples.gvcf.gz
 
 ```
# Further things you want perform
 ```
 plink missing
 
 bcftools stats
 ```
# FAQ
Q:I do not like your filtering
Q:I want the bam 
Q:I want a subset of the bam
Q:I want separate gVCFs

# how to request additional data

To: nicolo.tellini.2@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY

To: matnamo@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY

keep in mind: 
- timing (2/4 weeks)
- queue 
- anticipate the request
