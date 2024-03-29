

h1. Where is WSL relative to Windows and vice versa?
from https://askubuntu.com/questions/1380253/where-is-wsl-located-on-my-computer

h2. From Windows To Ubuntu

PS C:\Users\Me> ls '\\wsl.localhost\Ubuntu\'
or older version:
PS C:\Users\Me> ls '\\wsl$\Ubuntu\'

h3. java 
Install sdkman:
`sudo curl -s "https://get.sdkman.io"|bash`

commands:
'''
sdk list java
sdk install java 8.0.392-tem
'''

h4. Java Locations
\\wsl.localhost\Ubuntu\usr\bin\java

PS C:\Users\Me> Get-ChildItem "HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss" -Recurse
    Hive: HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss
Name                           Property
----                           --------
{11a1885e-974f-4dab-8f0d-2a609 State             : 1
31b18ec}                       DistributionName  : Ubuntu
                               Version           : 2
                               BasePath          :
                               C:\Users\Me\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc\LocalState
                               Flags             : 15
                               DefaultUid        : 1000
                               PackageFamilyName : CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc

h2. From Ubuntu to Windows
If you are in Ubuntu and need access to a file on a Windows drive (e.g. C:), then you'll find those are (by default) auto-mounted for you:

ls /mnt/c/Users
ls /mnt/c

