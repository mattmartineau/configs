export EDITOR=/usr/bin/vim

export LLREPOS=/gsa/yktgsa/projects/l/llvm/ 
test -s ~/.alias && . ~/.alias || true

# Use different command line if within VIM shell.
if env | grep -q ^VIM_RUNTIME=; then
  export PS1="\[\033[1;31m\]\w (\u@\h) *VIM* \n\[\033[1;30m\] >\[\033[0;30m\] ";
else
  export PS1="\[\033[1;31m\]\w (\u@\h) \n\[\033[1;30m\] >\[\033[0;30m\] ";
fi

export CLICOLOR=1
export LS_COLORS='di=1;34:fi=0:ex=1;32:*.f90=1;1'
export LS_COLORS=$LS_COLORS':*.c=1;1:*.cpp=1;1:*.hpp=1;1:*.h=1;1:*.o=37:*.mod=37:*~=37'
alias ls='ls -aG --color'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias mcm='make clean; make -j 4'
alias delcache="find . -name '*~' -type f -delete"

export PATH=/localhd/mattmar/scripts/:$PATH

# Get the profile for LSF
source /shared/lsf/conf/profile.lsf

if [[ $HOSTNAME == *tulgb* ]]; then
  export PATH=/shared/compteam/opt/tigervnc/bin:/shared/compteam/opt/eclipse/:$PATH
  export LD_LIBRARY_PATH=/shared/compteam/opt/clang-build/3.6-libcxx/lib/:/usr/lib/powerpc64le-linux-gnu/mesa/:$LD_LIBRARY_PATH
fi

export MM=/localhd/mattmar/
export CG=$MM/trunk/src/tools/clang/lib/CodeGen/
export LH=/localhd/mattmar/

export LD_LIBRARY_PATH=/localhd/mattmar/lomp/lomp/source/lib64/:$LD_LIBRARY_PATH
export LIBRARY_PATH=/localhd/mattmar/trunk/obj/lib/:$LIBRARY_PATH
export LOMP_DEBUG=none
export PATH=/usr/local/cuda/bin/:$PATH
export CUDA_PATH=/usr/local/cuda
alias ctags=/compteam/mattmar/ctags/bin/ctags

