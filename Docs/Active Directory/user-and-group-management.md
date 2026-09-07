# Active Directory User and Group Management

## Objective
Create a basic department structure in AD, manage users through security groups, and use those groups to control access to shared resources.

This demonstrates the relathionship between OUs, users, security groups, shared permissions, and NTFS permissions.

## Environment
|Component|Configuration|
|---------|-------------|
|Domain|```lab.home.arpa```|
|Domain Controller|```DC01```|
|User OUs|```Departments\IT```, ```Departments\Sales```|
|Groups OU|```Groups```|
|IT User|```alex.jhonsen```|
|Sales User|```sarah.bakker```|
|IT Group|```IT-Staff```|
|Sales Group|```Sales-Staff```|
|Shared Resources|```C:\Shares\IT```,```C:\Shares\Sales```|

## Active Directory Structure
Created a ```Departments``` OU containing separate OUs for IT and Sales:

```
lab.home.arpa
|--- Groups
|--- Servers
|--- Workstations
|___ Departments
      |--- IT
      |     |___ Alex Jhonsen
      |___ Sales
            |___ Sarah Bakker
```

The existing ```IT-Admins``` group remained in the ```Groups``` OU.

## User and Group Configuration
Created two security groups in the ```Groups``` OU.

- ```IT-Staff```
- ```Sales-Staff```

Both groups use:

- **Group scope:** Global
- **Group type:** Security

Created the following users:

|User|OU|Security Group|
|----|--|--------------|
|Alex Jhonsen|```Departments\IT```|```IT-Staff```|
|Sarah Bakker|```Departments\Sales```|```Sales-Staff```|

Users were assigned to their respective groups rather than being given individual permissions to resources.

## Shared Resources

Created the following directories on ```DC01```:

```
C:\Shares
  |--- IT
  |___ Sales
```

Each directory contains a test file.

## Permissions

### IT Share / Sales Share

The ```IT-Staff``` and ```Sales-Staff``` groups were granted:

**Share permissions:**

- Read
- Change

**NTFS permissions:**

- Modify

## Verification
User group memberships were verified using:

```whoami /groups```

The following access tests were performed from ```WIN01```.

|User|IT Share (```\\DC01\IT```)|Sales Share (```\\DC01\Sales```)|
|----|--------|-----------|
|Alex Jhonsen|Allowed|Deneid|
|Sarah Bakker|Deneid|Allowed|

This confirmed that the group membership and permissions were functioning as intended.

## Results
Users were organized into department-specific OUs and assigned to security groups based on their roles. These groups were then used to control access to network shares and NTFS protected folders.

This demonstrates the principle of managing resource access through security groups rather than assigning permissions directly to individual users.

