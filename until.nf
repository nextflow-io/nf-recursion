nextflow.enable.dsl=2
nextflow.preview.recursion=true

params.data = "$baseDir/hello.txt"

process foo {
  input:
    path 'input.txt'
  output:
    path 'result.txt'
  script:
    """
    cat input.txt > result.txt
    echo "Task $task.index added this" >> result.txt
    """
}

workflow {
  foo
    .recurse(file(params.data))
    .until{ it-> it.size() > 100 }

  foo
    .out
    .view(it->it.text)
}
