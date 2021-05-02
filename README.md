# Project-1-Elk-Stack

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/macmcm95/Project-1-Elk-Stack/blob/main/Diagrams/Project1.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the filebeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancers protects the system from DDoS attacks by distributing traffic evenly among multiple servers. The advantage of the jump box is that any tools used in an enviroment can be maintained, secured, deployed and updated from a single system.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the JumpBox and system network.
- Filebeat helps generate and organize log files to send to Logstash and Elasticsearch, specifically watching for which files have changes and when these changes occured. Metricbeat collect metrics from the operating system and from the services running on the server.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| JumpBox  | Gateway  | 10.0.0.4   | Linux            |
| Web-1    | Webserver| 10.0.0.5   | Linux            |
| Web-2    | Webserver| 10.0.0.6   | Linux            |
| Elk      |Monitoring| 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Port 5601, Kibana

Machines within the network can only be accessed by the JumpBox.
- My IP Address: 71.34.75.242

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 |  71.34.75.242        |
| Web-1    | No                  |  10.1.0.4            |
| Web-2    | No                  |  10.1.0.4            |
| Elk      | No                  |  10.1.0.4            |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because:
- Ansible is an open-source tool, making it free and cost effective.
- Simple to set up, configure and use.
- Ability to manage (set up and update) entire enviroment no matter where it is deployed.
- Customize application based on needs.
- Increased efficiency because there is no need to install extra software, leaving more room for other resources on server.

The playbook implements the following tasks:
- Install docker.io
- Install pip3
- Install Docker Python Module
- Increase virtual memory
- Download and launch Docker

Examples of playbooks used: [filebeat](https://github.com/macmcm95/Project-1-Elk-Stack/blob/main/Ansible/filebeat-playbook.yml "filebeat-playbook.yml)

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text](https://github.com/macmcm95/Project-1-Elk-Stack/blob/main/Images/docker%20ps.png)

### Target Machines & Beats

This ELK server is configured to monitor the following machines:
| Name     | IP Addresses | 
|----------|--------------|
| Web-1    | 10.0.0.5     |  
| Web-2    | 10.0.0.6     |

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat is used to collect log files from specific files. Types of lops include ones generated by Apache, Microsoft Azure tools, MySQL databases, etc. We used it to monitor the Apache server and MySQL database logs.
- Metricbeat collects metrics from systems and services. System-level montioring includes statistics such as CPU usage, memory, file system, disk and network input/output. Service metrics are acquired from servies such as Apache, MySQL, Azure, Docker, etc. 

### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook files to /etc/ansible.
- Update the hosts file to include the webservers, elk and respective private IP Addresses to make Ansible run the playbook on specific machines.
- Run the playbook, and navigate to Kibana (http://[your.VM.IP]:5601/app/kibana) to check that the installation worked as expected.

### **Bonus**

Provide the specific commands the user will need to run to download the playbook, update the files, etc.
- Move to directory where playbooks are located: `cd /etc/ansible`
- To run playbooks: `ansible-playbook install-elk.yml` `ansible-playbook filebeat-playbook.yml` `ansible-playbook metricbeat-playbook.yml`
- Use `nano` to update files as needed
