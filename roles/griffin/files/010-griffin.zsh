export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-12.jdk/Contents/Home
export PATH=${JAVA_HOME}/bin:${PATH}

alias aws-read="aws-vault exec read -- vault-to-creds.sh"
alias aws-sudo="aws-vault exec sudo -- vault-to-creds.sh"
