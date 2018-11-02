# Architecture


## Components

| Components       | Usage                                                                                                |
| ---------------- | ---------------------------------------------------------------------------------------------------- |
| Portainer        | Container management                                                                                 |
| Grafana          | Monitoring                                                                                           |
| Prometheus       | Metrics scraping / store                                                                             |
| CAdvisor         | Container metrics                                                                                    |
| Node exporter    | System metrics                                                                                       |
| HAProxy          | Reverse proxy                                                                                        |
| Volumerize       | Backup and Restore solution for Docker volume backups                                                |
| MatterMost       | Default Instant Chat (Slack like)                                                                    |
| PostgreSQL       | The PostgreSQL object-relational database system provides reliability and data integrity             |
| MySQL            | MySQL is a widely used, open-source relational database management system (RDBMS).                   |
| Drupal           | Drupal is an open source content management platform powering millions of websites and applications. |
| boogy/apache-php | Docker image based on ubuntu which provides apache server with php and ssl.                          |


## OS Compatibility

Allspark is compatible with:
  - CentOS 7 or above
  - RedHat 7 or above
  - Fedora Server/Atomic 28 or above
  - Ubuntu 14.04 or above
  - Debian 8 or above

## Playbooks
- `release.yml`

> Package an GeekHomeInside release in a `.tar.gz` file

- `setup.yml`

> Load a packaged GeekHomeInside release into the system

- `install.yml`

> Install GeekHomeInside on the machine (either with an internet access or after using `setup.yml` playbook)
