# Windows Server Home Lab

## Objective
Build a virtualised Windows environment to gain hands-on experience with Windows Server administration, Active Directory, DNS, FHCP, networking, and domain management.

## Environment

|system|OS|Role|IP|
|------|--|----|--|
|DC01|Windows Server 2025|AD DS, DNS, DHCP|192.168.10.0|
|WIN01|Windows 11 Pro|Domain client|DHCP|

**Network:** ```192.168.10.0/24```

**Domain:** ```lab.home.arpa```

**Hypervisor:** VMware Workstation 16 Pro

## What Is Implemented
- [x] Created isolated virtual network
- [x] Installed Windows Server 2025
- [x] Configured static IP addressing
- [x] Installed Active Directory Domain Services
- [x] Created ```lab.home.arpa``` domain
- [x] Configured DNS
- [x] Configured DHCP
- [x] Created Windows 11 client
- [x] Joined Windows 11 client to domain
- [ ] Create OUs and security groups
- [ ] Create domain users
- [ ] Configure Group Policy
- [ ] Configure file shares and NTFS permissions
- [ ] Practice troubleshooting
- [ ] Add Linux server
- [ ] Automate administrative tasks with PowerShell/Python
