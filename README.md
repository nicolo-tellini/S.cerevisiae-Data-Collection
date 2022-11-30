*S.cerevisiae* gVCF 1600 samples

### what's inside
- scr
- sample tab
- linktothegVCF.txt
### data provided
### pipeline
### filtering
### HOWTO

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
### Further things you want perform
 ```
 plink missing
 
 bcftools stats
 ```
### FAQ

**Q**: Only the 1011 *S.cerevisae* collection mantains the three letter code, where I can download the reads? </br>
**A**: At ENA archive project code PRJEB13017, note that fastqs have the three letter code followed by OSW; the number after the second underscore indicate the reads orientation (e.g. BCM_**CAA**OSW_2_**1**_C3F32ACXX.IND4_clean.fastq.gz is CAA strain R1.fastq.gz)

**Q**: The 1011 *S.cerevisae* collection occupies around 1TB, can I have a reduced size of the collection?</br> 
**A**: We did subsampled the fastqs at an estimated coverage of **X40** and **X20**. These datasets are available on requests (see  [how to request additional data](https://github.com/nicolo-tellini/S.cerevisiae-Data-Collection/blob/main/README.md#how-to-request-additional-data))

**Q**: Why do you named the strains using the ENA archive Run Accession?</br>
**A**: You can select the strains you are interested in and downloading the original fastqs withouth looking at the original paper, searching for the PRJ number, opening the browser and nagvigating NCBI or ENA etc ...

You have the Run Accession, you can run:

```fastq-dump --split-3 --gzip RunAccession```

DONE. 

Available, Easy and, (hopefully) Fast.

**Q**: I do **not** agree with your filtering</br>
**A**: The filters we applied are summarised below.

 - MQ >= 5 (bcftools mpileup ```-q``` option)
 - DP >= 10 (bcftools view ```-e``` option 'FORMAT/DP <= 10')
 - QUAL >= 20 (bcftools view ```-e``` option 'QUAL <= 20')
 
 The scripts are available and provided in this *repo* and can be reused. 

**Q**: Can you rerun the pipeline with different parameters?</br>
**A**: Yes, I can. please see [how to request additional data](https://github.com/nicolo-tellini/S.cerevisiae-Data-Collection/blob/main/README.md#how-to-request-additional-data)

**Q**: How long will take rerun the pipeline?</br>
**A**: As we do not work as a facility, we collect data and perform analyses on our own server and storage which are both primarily dedicated to our main projects. Currently, there around 8 people working in our team and using the server, the time vary a lot in a range of 2 weeks up to months for a complete rerun of the entire dataset depending on the number of requests, server traffic, and network. 

**Q**: How can I access to the additional data?</br>
**A**: The data are stored in a network attached storage (NAS) and shared throught a link. The download is protected by password and the access to the data restricted to a few devices. The link has a validity period that will allow you to download the data. Once the download is ultimated the data will be deleted for freeing space and the link will expire.

**Q**: Can I modify and use the modified scripts?</br>
**A**: Yes, you can.

### Request additional data

Short-term contact:</br>
To: nicolo.tellini.2@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY

note: If I (Nicolò Tellini) do not reply in 5 working days I am probably hard coding/debugging, freaking out because of the dissertation, sampling *Saccharomyces* in a remote place, tryharding in CoD or all four together.</br>
Feel free to contact Dr. Matteo De Chiara.

Long-term contact:</br>
To: matnamo@gmail.com </br>
Subject: DATAEXT-*yourname*-DD/MM/YYYY
