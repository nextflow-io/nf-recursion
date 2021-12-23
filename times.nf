nextflow.enable.dsl=2
nextflow.preview.recursion=true

process foo {
  input:
    val x
    val z
  output:
    val y
    val p
  exec:
    y = x+1
    p = z * 2
}

workflow {
  foo.recurse(10, 20).times(4)
  foo.out[1].view()
}
