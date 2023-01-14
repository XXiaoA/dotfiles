# git root
function gr --description "Jump to the git root"
    cd (git rev-parse --show-toplevel)
end
