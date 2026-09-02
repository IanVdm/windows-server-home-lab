# Workstation Logon Banner

## Objective
Configure a Group Policy Object (GPO) that displayes a security notice to users when they attempt to log on to domain-joined workstations.

The GPO is linked to the ```Workstations``` Organizational Unit (OU), ensuring that the policy applies to computers located within that OU.

## Environment
|Component|Configuration|
|---------|-------------|
|Domain|```lab.home.arpa```|
|Domain Controller|```DC01```|
|Target OU|```Workstation```|
|Target Computer|```WIN01```|
|GPO|```Workstations - Logon Banner```|

## Configuration
Created the following GPO:

**GPO:** ```Workstations - Logon Banner```

**Linked To:** ```Workstations``` OU

The following settings were configured:

**Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Local Policies -> Security Options**

- **Interactive logon: Message title for users attempting to log on**
  - ```Lab Environment```

- **Interactive logon: Message text for users attempting to log on**
  - ```This computer is part of the LAB domain.```
  - ```Authorized users only.```

## Verification
On ```WIN01```, the GP was manually refreshed:

```gpupdate /force```

The workstation was then restarted.

After restarting, the configured logon message was displayed before the Windows login screen.

## Result
The GPO was successfully applied to ```WIN01```.

This demonstrates the ability to create, configure, link, and verify a GPO within an AD environment.