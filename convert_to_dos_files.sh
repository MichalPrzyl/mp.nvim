export USER=michal
export NVIM_CONF_PATH=/home/$USER/.config/nvim
export NVIM_CONF_PATH2=/home/$USER/.local/share/nvim

cd $NVIM_CONF_PATH
find . -type f -print0 | xargs -0 dos2unix
cd $NVIM_CONF_PATH2
find . -type f -print0 | xargs -0 dos2unix
