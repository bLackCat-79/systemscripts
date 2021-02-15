git config --global user.name "bLackCat-79"
git config --global user.email "blackcat.purring@gmail.com"
git config --global credential.helper store
DIR="/opt/systemscripts/"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "GIT is ready to be used! ${DIR}..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  cd /opt/
  git clone https://github.com/bLackCat-79/systemscripts
fi
git commit -a
