umask 022
set filec

setenv USER `whoami`
set prompt=`hostname`-$USER%

set path=(. /usr/local/bin /usr/ccs/bin /usr/bin /usr/ucb /usr/sbin /etc /usr/atria/bin $path)
if ( $?prompt ) then
        set history=100
endif
setenv TERM vt100
setenv EDITOR vi
setenv MANPATH /usr/man:/usr/local/man:
setenv JASYPT_PASSWORD EbfYkitulv73I2p0mXI50JMXoaxZTKJ0
setenv PATH ${HOME}/java/bin:$PATH

##################################
#   for english input
##################################
setenv LANG en_US.utf8
##################################


##################################
#       for aliases
##################################
alias h history
alias ls ls -F
alias sc source ~/.cshrc

##################################
#       for java heapdump and javacore
##################################
setenv IBM_HEAP_DUMP true
setenv IBM_HEAPDUMP_OUTOFMEMORY true
setenv IBM_JAVADUMP_OUTOFMEMORY true
setenv IBM_JAVA_HEAPDUMP_TEXT true
setenv TZ CST-8