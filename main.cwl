class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': jasper1918@synapse.org,
  'foaf:name': jasper1918}
doc: 'SMC-RNA challenge fusion detection submission

  STAR-SEQR workflow'
hints: []
id: main
inputs:
- {id: REFERENCE_GENOME, type: File}
- {id: REFERENCE_GTF, type: File}
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: index, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: starseqr/starseqr_bedpe, type: File}
steps:
- id: starseqr
  in:
  - {id: fq1, source: TUMOR_FASTQ_1}
  - {id: fq2, source: TUMOR_FASTQ_2}
  - {default: 1, id: mode}
  - {default: starseqrout, id: name_prefix}
  - {id: star_fasta, source: REFERENCE_GENOME}
  - {id: star_gtf, source: REFERENCE_GTF}
  - {id: star_index_dir, source: tar/output}
  - {default: 8, id: worker_threads}
  out: [starseqr_bedpe]
  run: STAR-SEQR.cwl
- id: tar
  in:
  - {id: index_name, source: index}
  out: [output]
  run: tar.cwl
