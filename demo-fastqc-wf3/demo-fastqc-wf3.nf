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

include { demoFastqc2 } from './wfpr_modules/github.com/jtracker-io/awesome-wfpkgs1/demo-fastqc2@0.1.0/demo-fastqc2'
include { cleanupWorkdir; getSecondaryFiles; getBwaSecondaryFiles } from './wfpr_modules/github.com/icgc-argo/demo-wfpkgs/demo-utils@1.2.0/main.nf'


// please update workflow code as needed
workflow DemoFastqcWf3 {
  take:  // update as needed
    input_file


  main:  // update as needed
    demoFastqc2(input_file)
    if (params.cleanup) { cleanupWorkdir(demoFastqc2.out, true) }

  emit:  // update as needed
    output_file = demoFastqc2.out.output_file
}