#!/bin/bash

# TESTS
# New Setup, No Args
# New Setup, Wrong Arg
# New Setup, SSH Arg (both forms)
# New Setup, Help Arg (both forms)
# New Setup, Clean Arg (Does nothing)

# Existing Setup, No Args
# Existing Setup, Clean Args
# Existing Setup, SSH Args
# Existing Setup, SSH & Clean Args

echo ""

print_line() {
    echo "${1}"
    echo ""
}

instructions() {
	print_line "Usage Intructions:-"
    print_line "./pull_deps.sh [-s|--ssh]  [-c|--clean]  [-h|--help]"
    print_line "-s|--ssh     Clones github repositories using SSH, default is HTTPS"
    print_line "-c|--clean   Clean pull. Re-downloads and updates everything"
}

if ! type "git" > /dev/null; then
	print_line "ERROR: Git is not installed or unavailable in the path!!"
  exit -1
fi

use_git_ssh=0

#arguments parsing
for i in "$@"
do
case $i in
    -s|--ssh)
    print_line "Using SSH to pull repos"
    use_git_ssh=1
    ;;
  
  -h|--help)
    instructions
    exit 0
    ;;

  -c|--clean)
    print_line "Clean pull requested. Purging everything."
    rm -rf libs/external
    ;;

    *)
	print_line "ERROR: Unknown paramter: ${i}"
	instructions
	exit -1
    ;;
esac
shift
done

declare -A github_repos=(
    ["google/benchmark"]="ed1bac8434b3f970a5b7de3fea8f09dc4b1773ee"
    ["google/googletest"]="dc043e1ca6bd509a92452ed54e817b6979869372"
    );

readonly external_libs_folder="libs/external/"

if [ ! -d "${external_libs_folder}" ]; then
  mkdir "${external_libs_folder}"
fi

push_into_dir() {
    pushd ${1} > /dev/null
}

pop_outof_dir() {
    popd > /dev/null
}

push_into_dir ${external_libs_folder}

pull_new_repo() {
    local repo_name=${1}
    local use_ssh=${2}

    local git_url=""

    if [[ ${use_ssh} -eq 0 ]]; then
        git_url="https://github.com/${repo_name}.git"
    else
        git_url="git@github.com:${repo_name}.git"
    fi

    echo "CLONING: ${repo_name}...."
    
    git clone ${git_url} ${repo_name}

    if [[ $? -ne 0 ]]; then
        echo "ERROR: FAILED!"
        exit -1
    fi
    
    echo ""
}

update_repo() {
    local repo_name=${1}

    print_line "UPDATING: ${repo_name}....."

    push_into_dir ${repo_name}
    git checkout master > /dev/null 2>&1
    git pull origin master
    pop_outof_dir ${repo_name}

    echo ""
}

for key in ${!github_repos[@]}
do
    repository=${key}
    commit_hash=${github_repos[${repository}]}

    if [ ! -d "${repository}" ]; then
        pull_new_repo ${repository} ${use_git_ssh}
    else
        update_repo ${repository}
    fi
    
    push_into_dir ${repository}
    git checkout ${commit_hash} > /dev/null 2>&1
    pop_outof_dir ${repository}
done

pop_outof_dir ${external_libs_folder}

print_line "Dependencies updated."
print_line "Please clean and rerun your cmake config."
