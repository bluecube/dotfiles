export PATH=~/local/bin:$PATH

# these are for local installs
export CPATH=~/local/include:$CPATH 
export LIBRARY_PATH=~/local/lib:$LIBRARY_PATH 
export LD_LIBRARY_PATH=~/local/lib:$LD_LIBRARY_PATH 
export PKG_CONFIG_PATH=~/local/lib/pkgconfig:$PKG_CONFIG_PATH 

# Use pythonrc file
export PYTHONSTARTUP=$HOME/.pythonrc

#to be able to control mpd with mpc
export MPD_HOST=9e452faa21eda85e72aea5e3e8696083@localhost
export MPD_PORT=6600

#should enable some 3D speedups
export INTEL_BATCH=1

export BROWSER="firefox"
export EDITOR="vim"

# For ripping DVDs
export VIDEO_FORMAT=PAL
