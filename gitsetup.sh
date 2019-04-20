# set .git/config to include ./.gitconfig
echo '[include]' >> .git/config
echo $'\t''path="../.gitconfig"' >> .git/config