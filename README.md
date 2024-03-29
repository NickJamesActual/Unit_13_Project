# Unit_13_Project
UCB Cybersecurity - Unit 13 Project

### Included in the Linux directory are scripts and activities that demonstrate my path toward becoming proficient with Linux

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![network_diagram.png](Diagrams/Azure_Network_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - Default path: /etc/ansible/playbooks
  - Project path: /Ansible/*.yml

This document contains the following details:
```
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build
```

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, or "Damn Vulnerable Web Application."

Load balancing helps to ensure that the application will be available, in addition to restricting access to the network.
- Load Balancers help ensure availability by balancing client requests between various servers.
- Load Balancers allows restriction of access to a single external entry point; this minimizes the possible attack vectors.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the config and system files.
- Filebeat monitors log files
- Metricbeat records OS info, as well as service statistics (for accessible VMs)

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1     | DVWA Host         | 10.0.0.5           | Linux                 |
| Web-2     | DVWA Host         | 10.0.0.6           | Linux                 |
| Web-3     | DVWA Host         | 10.0.0.7           | Linux                 |
| ELK-VM     | ELK Stack         |  10.1.0.4          | Linux                 |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner VM can accept connections from the Internet. Access to this machine is only allowed from the following IP address:
- 24.23.212.58

Machines within the network can only be accessed by the Jump Box Provisioner.
- The Jump Box Provisioner has access to the ELK-VM through SSH. Its IP is: 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes - SSH             | 24.23.212.58    |
| Web-1         | No - Internal Only                    | 10.0.0.4                     |
| Web-2         | No - Internal Only                    | 10.0.0.4                     |
| Web-3         | No - Internal Only                    | 10.0.0.4                     |
| ELK-VM         | No - Internal Only                    | 10.0.0.4                     |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Configuration (building and deployment) is performed automatically, uniformly, and quickly
- Allows updates to be quickly deployed

The playbook implements the following tasks:

#### playbook-dvwa.yml
```
- Installs Docker
- Installs Python(3)
- Install Python Docker Module
- Download + Launch docker web container (w/ DVWA)
```
#### playbook-elk.yml
```
- Install Docker
- Install Python3
- Install Docker Python Module
- Increases memory useage
```
#### playbook-filebeat.yml
```
- Download filebeat .deb file
- Install filebeat w/ .deb file
- Drop in filebeat.yml
- Enable + Config System Module
- Setup Filebeat
- Start Filebeat
- Enable filebeat service on boot
```
#### playbook-metricbeat.yml
```
- Download Metricbeat .deb file
- Install Metricbeat w/ .deb file
- Drop in Metricbeat.yml
- Enable + Config System Module
- Setup Metricbeat
- Start Metricbeat
- Enable Metricbeat service on boot
```
#### playbook-elk.yml
```
- Install Docker
- Install Python(3)
- Install Docker Python Module
- Increase memory useage
- Download + Launch Docker ELK Container
- Enable Docker service on boot
```
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker_ps.png](Images/docker_ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1: 10.0.0.5
- Web-2: 10.0.0.6
- Web-3: 10.0.0.7

I have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat: Specified logs and log events from configured VMs are forwarded to Elasticsearch
- Metricbeat: OS system metrics and services from configured VMs are forwarded to Elasticsearch

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook-*.yml files to Ansible Docker Container: /etc/ansible/playbooks
- Update Ansible /etc/ansible/ansible.cfg - "remote_user" to "azadmin"
- Update the /etc/ansible/hosts file to include:
```
[webservers]

10.0.0.5 ansible_python_interpreter=/usr/bin/python3
10.0.0.6 ansible_python_interpreter=/usr/bin/python3
10.0.0.7 ansible_python_interpreter=/usr/bin/python3

[elk]

10.1.0.4 ansible_python_interpreter=/usr/bin/python3
```
- Run the playbooks, and navigate to http://20.38.9.237:5601/app/kibana to check that the installation worked as expected.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
