#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
version = '0.1.0'  // package version

// universal params go here, change default value as needed
params.container = ""
params.container_registry = ""
params.container_version = ""
params.cpus = 1
params.mem = 1  // GB
params.publish_dir = ""  // set to empty string will disable publishDir

// tool specific parmas go here, add / change as needed
params.input_file = ""
params.cleanup = true

include { cleanupWorkdir; getSecondaryFiles; getBwaSecondaryFiles } from './wfpr_modules/github.com/icgc-argo/demo-wfpkgs/demo-utils@1.3.0/main.nf'
include { demoFastqc } from './wfpr_modules/github.com/icgc-tcga-pancancer/awesome-wfpkgs1/demo-fastqc@0.2.0/demo-fastqc'


// please update workflow code as needed
workflow FastqcWf {
  take:  // update as needed
    input_file


  main:  // update as needed
    demoFastqc(input_file)
    if (params.cleanup) { cleanupWorkdir(demoFastqc.out, true) }

  emit:  // update as needed
    output_file = demoFastqc.out.output_file
}