#/bin/bash

docker run -it --net host --pid host --userns host --cap-add audit_control \
            -v /var/lib:/var/lib \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v /etc/init.d:/etc/init.d \
            -v /etc:/etc --label docker_bench_security \
            docker/docker-bench-security
