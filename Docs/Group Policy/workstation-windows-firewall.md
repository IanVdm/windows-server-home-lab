# Workstation Windows Firewall

## Objective
Configure Windows Defender Firewall through GP so that firewall protection is centrally managed for domain-joined workstations.

The GPO is linked to the ```Workstaitoions``` OU, allowing the firewall policy to be applied to computers within that OU.

## Environment
|Component|Coniguration|
|---------|------------|
|Domain|```lab.home.arpa```|
|Domain Controller|```DC01```|
|Target OU|```Workstations```|
|Target Computer|```WIN01```|
|GPO|```Workstations - Windows Firewall```|

## Configuration
Created the following GPO:

**GPO:** ```Workstation - Windows Firewall```

**Linked To:** ```Workstations``` OU

The following setting were configured:

**Computer Configuration → Policies → Windows Settings → Security Settings → Windows Defender Firewall with Advanced Security**

Under the **Domain Profile**:

- **Firewall State:** ```On```
- **Inbound Connections:** ```Block (Default)```
- **Outbound Connections:** ```Allow (Defualt)```

The GPO was configured to centrally manage Windows Firewall settings for domain-joined workstations.

## Verification
On ```WIN01```, GP was manually refreshed:

```gpupdate /forece```

The workstation was then restarted:

```shutdown /r /t 0```

GP results were used to verify that the GPO was being applied:

```gpresult /r /scope computer```

The following GPOs were listed under **Applied Group Policy Objects**:

- ```Workstations - Logon Banner```
- ```Workstations - Windows Firewall```

The Windows Firewall profile was also check using:

```Get-NetFirewallProfile -Name Domain```

The Domain firewall profile was enabled.

## Troubleshooting
When running ```gpresult /r /scope computer```, the command returned ```Access Denied```.

The command was re-run from an elevated PowerShell session using **Run as administrator**, after which the GP results were displayed correctly.

## Result
The Windows Firewall GPO was successfully created, linked to the ```Workstations``` OU, and applied to ```WIN01```.

This demonstrated centralised firewall management through AD GP.
