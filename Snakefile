
import glob, ntpath 

inFiles = set() ## set of all input files (only file names) 
## extract file names from paths 
inPaths = glob.glob( "test/*.fastq" )            
for p in inPaths:   
    inFiles.add( os.path.basename(p).replace(".fastq", "") )
rule all:    
    input:       
        I1 = expand("reports/{filename}_fastqc.zip",filename=inFiles)
rule fastqc:   
    input: "test/{afile}.fastq"    
    output: "reports/{afile}_fastqc.zip"    
    shell: "fastqc -o reports {input}"

