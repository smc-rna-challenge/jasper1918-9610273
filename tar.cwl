baseCommand: [tar, xvzf]
class: CommandLineTool
cwlVersion: v1.0
doc: 'command line: tar'
hints: []
inputs:
- id: index_name
  inputBinding: {position: 1}
  type: File
outputs:
- id: output
  outputBinding: {glob: .}
  type: Directory
