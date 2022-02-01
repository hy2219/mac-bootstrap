clone_git(){
  sudo rm -rf $2
  echo "Cloning $3"
  git clone --depth=1 $1 $2
}
