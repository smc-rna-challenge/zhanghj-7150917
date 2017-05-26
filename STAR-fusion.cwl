arguments:
- {position: 0, prefix: --genome_lib_dir, valueFrom: '$(inputs.index[0].path.split("/").slice(0,-1).join("/"))'}
baseCommand: [STAR-Fusion]
class: CommandLineTool
cwlVersion: cwl:draft-3
description: STAR Fusion Detection
hints: []
inputs:
- id: index
  type: {items: File, type: array}
- id: J
  inputBinding: {position: 1, prefix: -J}
  type: File
- id: output_dir
  inputBinding: {position: 2, prefix: --output_dir}
  type: string
- id: threads
  inputBinding: {position: 2, prefix: --CPU}
  type: ['null', int]
name: STAR-fusion.cwl
outputs:
- id: output
  outputBinding: {glob: $(inputs.output_dir+'/star-fusion.fusion_candidates.final.abridged')}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: dreamchallenge/star}
