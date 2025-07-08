echo running .bash_profile

export LOGINDIR=$HOME/il
export PATH=$LOGINDIR/homedir/bin:"$PATH"

# bind mount shared directory
if [[ -n "${WSL_DISTRO_NAME}" ]]; then
   if [[ -d "/mnt/wsl/${WSL_DISTRO_NAME}" ]]; then
      ls "/mnt/wsl/${WSL_DISTRO_NAME}"
   else 
      echo "mounting /mnt/wsl/${WSL_DISTRO_NAME}"
      mkdir "/mnt/wsl/${WSL_DISTRO_NAME}"
      # note the terminating / on the directory name below!
      wsl.exe -d ${WSL_DISTRO_NAME} -u root mount --bind / "/mnt/wsl/${WSL_DISTRO_NAME}/"
   fi
fi

export PATH=/usr/lib/git-core:"$PATH"

. $HOME/.bashrc









source "/home/larry/il/emsdk/emsdk_env.sh"
