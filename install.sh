for file in .??*
do
  [[ $file == ".git" ]] && continue
  ln -nfs `pwd`/$file ~/$file
  echo $file
done
