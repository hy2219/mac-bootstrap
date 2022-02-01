run_taskset(){
  cd "$TASKS_DIR"/"$1" || exit
  candidates=(*)
  for candidate in "${candidates[@]}"
  do
    sh "$TASKS_DIR"/"$1"/"$candidate"/run.sh
  done
}
