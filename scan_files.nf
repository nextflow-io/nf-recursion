nextflow.enable.dsl=2
nextflow.preview.recursion=true

process foo {
  input:
    path data
  output:
    path 'out_*.txt'
  """
    echo "Task $task.index inputs: $data" > out_${task.index}.txt
  """
}

workflow {
  data = channel.fromPath("sample*.txt").toSortedList(it->it.name).flatten()
  foo.scan( data ).view(it -> it.text)
}
