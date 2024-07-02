# Building images

### Prerequisites

Ensure your system meets the following requirements:

* Operating System: CentOS Stream 8/9, Fedora, or RHEL 8/9.


### Preparation

Copy configuration file:

```shell
cp inventory/minimal.yml.example inventory/minimal.yml
```

Review and update configuration:

* Review the values and modify them as necessary to suit your environment and requirements.

Provide a manifest file:

* Place your manifest file in directory `roles/build_image/templates`.

Examples of osbuild manifest files can be found in [automotive/sample-images](https://gitlab.com/CentOS/automotive/sample-images/-/tree/main/images).


### Build the image

Execute the Ansible playbook to build the image:

```shell
ansible-playbook -i inventory/minimal.yml build.yml
```
