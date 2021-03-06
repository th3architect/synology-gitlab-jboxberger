#!/bin/bash
IS_DEBUG=""

########################################################################################################################
# PARAMETER HANDLING
########################################################################################################################
for i in "$@"
do
    case $i in
        --debug)
            IS_DEBUG="--debug"
        ;;
        *)
            # unknown option
        ;;
    esac
    shift
done

gitlab_package_name="sameersbn/gitlab"
postgresql_package_name="sameersbn/postgresql"
redis_package_name="redis"
spk_version=0102

# https://microbadger.com/images/sameersbn/gitlab
declare -A versions;      declare -a orders;
#versions["9.4.4"]="557"; orders+=( "9.4.4" )
#versions["10.1.4"]="699"; orders+=( "10.1.4" )
#versions["10.2.5"]="747"; orders+=( "10.2.5" )
#versions["10.3.6"]="728"; orders+=( "10.3.6" )
#versions["10.4.1"]="735"; orders+=( "10.4.1" )
#versions["10.5.1"]="761"; orders+=( "10.5.1" )
#versions["10.5.5"]="763"; orders+=( "10.5.5" )
#versions["10.5.6"]="764"; orders+=( "10.5.6" )
#versions["10.6.0"]="815"; orders+=( "10.6.0" )
#versions["10.6.2"]="816"; orders+=( "10.6.2" )
#versions["10.6.4"]="817"; orders+=( "10.6.4" )
#versions["10.7.2"]="840"; orders+=( "10.7.2" )
#versions["10.7.4"]="838"; orders+=( "10.7.4" )
#versions["11.0.0"]="880"; orders+=( "11.0.0" )
#versions["11.0.1"]="882"; orders+=( "11.0.1" )
#versions["11.0.4"]="896"; orders+=( "11.0.4" )
#versions["11.1.3"]="761"; orders+=( "11.1.3" )
#versions["11.1.4"]="761"; orders+=( "11.1.4" )
#versions["11.2.3"]="696"; orders+=( "11.2.3" )
#versions["11.3.0"]="672"; orders+=( "11.3.0" )
#versions["11.3.4"]="674"; orders+=( "11.3.4" )
versions["11.4.0"]="679"; orders+=( "11.4.0" )

declare -A redis_sizes
redis_sizes["3.2.6"]=74
redis_sizes["3.2.11"]=37

for i in "${!orders[@]}"
do
    gitlab_version=${orders[$i]}
    gitlab_size=${versions[${orders[$i]}]}
    gitlab_package_fqn=$gitlab_package_name:$gitlab_version

    postgresql_version="9.6-4"
    postgresql_size="83"
    postgresql_package_fqn=$postgresql_package_name:$postgresql_version

    redis_version="3.2.11"
    redis_size=${redis_sizes[$redis_version]}
    redis_package_fqn=$redis_package_name:$redis_version

    echo "building $gitlab_package_fqn ("$gitlab_size"MB) with $postgresql_package_fqn ("$postgresql_size"MB), $redis_package_fqn ("$redis_size"MB)"
    ./build.sh --gitlab-fqn=$gitlab_package_fqn --gitlab-download-size=$gitlab_size \
       --postgresql-fqn=$postgresql_package_fqn --postgresql-download-size=$postgresql_size \
       --redis-fqn=$redis_package_fqn --redis-download-size=$redis_size \
       --spk-version=$spk_version \
       "$IS_DEBUG"
done
