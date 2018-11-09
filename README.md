## [sysdig](https://github.com/draios/sysdig) BOSH release

This is work in progress.

Colocate this release on your BOSH deployed VMs in order to monitor BOSH jobs with sysdig.

Example deployment manifest:


```
---
name: sysdig

releases:
- name: sysdig
  version: latest

stemcells:
- alias: ubuntu
  os: ubuntu-trusty
  version: latest

instance_groups:
- name: sysdig
  instances: 1
  vm_type: tiny
  stemcell: ubuntu
  networks:
  - name: default
  jobs:
  - name: libelf-dev-pkg-install
    release: sysdig
  - name: sysdig
    release: sysdig
  azs: [default_az]
 ...
```

### Current state

Sysdig continuously captures everything into rotating files `/var/vcap/sys/log/sysdig/sysdig.scap`.

### Next steps

- Make sysdig able to see BPM containers. For example `csysdig -pc container.type=bpm` should show processes. This will require changes to sysdig and bpm.
- Introduce job spec properties to provide filter. Currently, by capturing everything the scap files get filled up quickly.
