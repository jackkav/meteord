set -e

npm config set registry https://registry.npm.taobao.org
npm config set disturl https://npm.taobao.org/dist

if [ -d /bundle ]; then
  cd /bundle
  tar xzf *.tar.gz
  cd /bundle/bundle/programs/server/
  echo "installing npm packages..."
  npm install --unsafe-perm &>/dev/null
  cd /bundle/bundle/
else
  echo "=> You don't have an meteor app to run in this image."
  exit 1
fi

# Honour already existing PORT setup
export PORT=${PORT:-80}

echo "=> Starting meteor app on port:$PORT"
node main.js
