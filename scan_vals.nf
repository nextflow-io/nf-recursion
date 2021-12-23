nextflow.enable.dsl=2
nextflow.preview.recursion=true

process foo {
  input:
    val x
  output:
    val z
  exec:
     z = x.sum()+1
}

workflow {
  main:
    data = channel.of(10,20,30)
    foo.scan(data)
    foo.out.view()
}
