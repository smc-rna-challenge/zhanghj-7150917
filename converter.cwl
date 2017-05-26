baseCommand: [convert_star_to_bedpe.py]
class: CommandLineTool
cwlVersion: cwl:draft-3
description: Convert star fusion output to bedpe format
hints: []
inputs:
- id: input
  inputBinding: {position: 1}
  type: File
- {id: output, type: string}
name: converter.cwl
outputs:
- id: fusionout
  outputBinding: {glob: $(inputs.output)}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: dreamchallenge/star}
stdout: $(inputs.output)
