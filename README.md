SMC-RNA Challenge Entry: zhanghj-7150917
========================================================

This is a CWL workflow which was submitted to the [SMC-RNA Challenge][smcrna] in the fusion detection category.

Example and reference data files are stored on [Synapse][data] and are
defined in synapse_inputs.json.  
A Synapse user account is required to access data from Synapse.

Usage
--------------------------------------------------------

```bash
# Clone this repo
git clone https://github.com/smc-rna-challenge/zhanghj-7150917
cd zhanghj-7150917

# Install the requirements
pip install -r requirements.txt

# Download the test data to ./data
# You'll need a synapse.org account.
python download.py

# Run the workflow
cwltool main.cwl
```

Resource Usage
--------------------------------------------------------

Most SMC-RNA entries were tested on machines with 16 vCPUs and 60 GB of RAM.
Many entries did not use the full amount of resources.
Some required more memory and were allowed 104 GB of RAM.


Docker images
--------------------------------------------------------


- [quay.io/smc-rna-challenge/zhanghj-7150917-star:1.0.0](https://quay.io/smc-rna-challenge/zhanghj-7150917-star:1.0.0)





Details
========================================================

Challenge participants were asked to complete a quiz to describe some of the
details about their entry:



#### What methods does the tool use?
Split-read mapping



#### What alignment algorithms does the tool use?
STAR



#### Are there non-default parameters used for the alignment algorithms?
Yes





#### Are there other inputs other than sequencing reads and gene annotation?
No



#### Does the tool report the following types of fusions?
Inter-chromosomal, Intra-chromosomal, read-through, Self-fusion



#### Does the tool report fusions with their junctions in the following regions?
Canonical exonic boundaries



#### Does the tool report only the consensus isoform of a gene fusion, or all the isoforms?
Consensus isoform only



#### Does the tool report any scores for gene fusions?
Other





























#### Is your method alignment independent?
No



#### Does your method use the quality of the read mapping at all (e.g. filter out poorly mapped reads)?
Yes



#### Does your method use information about strand-specific sequences?
Yes



#### Does your method output transcript-length- and library size- adjusted estimates of abundance (such as RPKM, FPKM, or TPM)?
Yes





[smcrna]: https://www.synapse.org/#!Synapse:syn2813589/wiki/401435
[data]: https://www.synapse.org/#!Synapse:syn9878834
