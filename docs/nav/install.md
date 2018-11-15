# Installation guide

## Requirements

### On the OneForAll machine
- Docker ( tested with version 18.06.0 )

### On the control machine
- Ansible ( tested with version 2.7.1 )

## Ansible playbook

If you are on to adapt the configuration see the [configuration pages](/configuration.md)

!!! warning
    For offline install, the images configuration must be the same on both end.

If you are on a migration see the [operation pages](/operation.md)

### Install

- Change the hosts file to point to the OneForAll machine.

```bash
ansible-playbook -i hosts install.yml
```

!!! warning
    Before using the playbook, you need to be sure to have your deployment user in the wheel groups

At this point, you will be able to see component show up along with their access URL
at `ingress.YOUR_ROOT_DOMAIN`.
