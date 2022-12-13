echo  hello Durga Bhavani Deepika

# Color Syntax
# echo -e "\e[COLmHello\e[0m"
# -e - enable \e
# \e - enable COL
# COL - COL CODE , 31-26 (31- REd, 32 - Green, 33 - YELLOW, 34 - BLUE , 35 - MAGENTA, 36 - CYAN )
# 0m - Disable the enabled color

echo -e "\e[31mDemo on vars on play level in RED Color\e[0m"
- name: Demo on vars on play level
  hosts: all
  connection: local
  vars:
    URL: play.example.com
  tasks:
    - name: Print URL
      ansible.builtin.debug:
        msg: URL = {{ URL }}
echo -e "\e[34mDemo on vars on task level in blue Color\e[0m"
- name: Demo on vars on task level
  hosts: all
  connection: local
  tasks:
    - name: Print URL
      ansible.builtin.debug:
        msg: URL = {{ URL }}
      vars:
        URL: task.example.com
echo -e "\e[35mDemo on vars from file on play levelin blMAGENTAue Color\e[0m"
- name: Demo on vars from file on play level
  hosts: all
  connection: local
  vars_files:
    - sample-vars.yml
  tasks:
    - name: Print URL
      ansible.builtin.debug:
        msg: URL = {{ URL }}

- name: Vars from Inventory file
  hosts: all
  connection: local
  tasks:
    - name: Print URL
      ansible.builtin.debug:
        msg: URL = {{ URL }}

- name: Access fact
  hosts: all
  connection: local
  tasks:
    - name: Print FACT
      ansible.builtin.debug:
        msg: Hostname = {{ ansible_hostname }}

- name: Demo on runtime variables
  hosts: all
  connection: local
  tasks:
    - name: Execute uptime shell command
      ansible.builtin.shell: uptime
      register: out

    - name: Set a fact
      ansible.builtin.set_fact:
        UPTIME: "{{out.stdout}}"

    - name: Print out
      ansible.builtin.debug:
        msg: "{{UPTIME}}"

- name: Vars Print from roles
  hosts: all
  connection: local
  roles:
    - sample
