class: Workflow
cwlVersion: cwl:draft-3
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': zhanghj@synapse.org,
  'foaf:name': zhanghj}
description: creates custom genome from reference genome and two phased VCF files
  SNPs and Indels
doc: 'SMC-RNA challenge fusion detection submission

  '
hints: []
id: main
inputs:
- {id: index, type: File}
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
name: main
outputs:
- {id: OUTPUT, source: converttobedpe/fusionout, type: File}
steps:
- id: tar
  inputs:
  - {id: index, source: index}
  outputs:
  - {id: output}
  run: tar.cwl
- id: star
  inputs:
  - {default: Basic, id: twopassMode}
  - {default: None, id: outReadsUnmapped}
  - {default: 12, id: chimSegmentMin}
  - {default: 12, id: chimJunctionOverhangMin}
  - {default: 10, id: alignSJDBoverhangMin}
  - {default: 200000, id: alignMatesGapMax}
  - {default: 200000, id: alignIntronMax}
  - {default: parameter, id: chimSegmentReadGapMax}
  - {default: 3, id: chim2}
  - {default: 5, id: alignSJstitchMismatchNmax}
  - {default: -1, id: align2}
  - {default: 5, id: align3}
  - {default: 5, id: align4}
  - {default: 5, id: runThreadN}
  - {default: '31532137230', id: limitBAMsortRAM}
  - {default: BAM, id: outSAMtype}
  - {default: SortedByCoordinate, id: outSAMsecond}
  - {default: zcat, id: readFilesCommand}
  - {id: index, source: tar/output}
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  outputs:
  - {id: output}
  run: STAR.cwl
- id: starfusion
  inputs:
  - {id: index, source: tar/output}
  - {id: J, source: star/output}
  - {default: starOut, id: output_dir}
  - {default: 5, id: threads}
  outputs:
  - {id: output}
  run: STAR-fusion.cwl
- id: converttobedpe
  inputs:
  - {id: input, source: starfusion/output}
  - {default: output.bedpe, id: output}
  outputs:
  - {id: fusionout}
  run: converter.cwl
