#/bin/bash
set -xe

docker run -it --net host --pid host --userns host --cap-add audit_control \
            -e DOCKER_CONTENT_TRUST=$DOCKER_CONTENT_TRUST \
            -v /var/lib:/var/lib \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v /etc/init.d:/etc/init.d \
            -v /etc:/etc --label docker_bench_security \
            docker/docker-bench-security -e check_1,check_4_9,check_5_1,check_5_2,check_7
