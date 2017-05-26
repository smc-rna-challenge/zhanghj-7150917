baseCommand: [tar, xvzf]
class: CommandLineTool
cwlVersion: cwl:draft-3
description: 'command line: tar'
hints: []
inputs:
- id: index
  inputBinding: {position: 1}
  type: File
name: tar.cwl
outputs:
- id: output
  outputBinding: {glob: star_index/*}
  type: {items: File, type: array}
