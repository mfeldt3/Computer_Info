<# Michael Feldt mfeld4 #>

<# System name, date, display a title #>
write-host ("Getting specs");
$pcname=get-item env:\Computername | select -property Value | ConvertTo-HTML -Fragment
$pcnamep=get-item env:\Computername | select -property Value | Format-list *

$date=get-date | select -property date | ConvertTo-HTML -Fragment
$datep=get-date | select -property date | Format-list *

<# Manufacturer, model, description, etc #>
write-host ("Getting Manufacturer, model, and name");
$mmd=get-wmiobject -class win32_computersystem | select -property manufacturer, model, name | ConvertTo-HTML -Fragment
$mmdp=get-wmiobject -class win32_computersystem | select -property manufacturer, model, name | Format-list *
<# info on boot disk #>
write-host ("Getting Boot drive");
$boot=get-wmiobject -class win32_bootconfiguration | select -property Description | ConvertTo-HTML -Fragment
$bootp=get-wmiobject -class win32_bootconfiguration | select -property Description | Format-list *

<# Operating System #>
write-host ("Getting Operating System");
$OP=get-wmiobject -class win32_operatingsystem | select -property buildnumber, serialnumber, version | ConvertTo-HTML -Fragment
$OPp=get-wmiobject -class win32_operatingsystem | select -property buildnumber, serialnumber, version | Format-list *
<# System drives #>
write-host ("Getting Hard Drive Space");
$HDD=get-wmiobject -class Win32_LogicalDisk | ConvertTo-HTML -Fragment
$HDDp=get-wmiobject -class Win32_LogicalDisk | Format-list *
<# Proccessor #>
write-host ("Getting Proccessor info");
$pro=get-wmiobject -class win32_processor | select -property name, manufacturer, maxclockspeed, caption | ConvertTo-HTML -Fragment
$prop=get-wmiobject -class win32_processor | select -property name, manufacturer, maxclockspeed, caption | Format-list *
<# System Memory #>
write-host ("Getting System memory");
$mem=get-wmiobject -class win32_computersystem | select -property totalphysicalmemory | ConvertTo-HTML -Fragment
$memp=get-wmiobject -class win32_computersystem | select -property totalphysicalmemory | Format-list *
<#installed Software Sorted#>
write-host ("Getting installed programs");
$proc= get-wmiobject -class win32_product |sort name | select -property name, vendor, version, description | ConvertTo-HTML -Fragment
$procp= get-wmiobject -class win32_product |sort name |select -property name,vendor, version, description | Format-list *

$pcnamep;
$datep;
$mmdp;
$bootp;
$OPp;
$HDDp;
$prop;
$memp;
$procp;

ConvertTo-HTML -Body "$pcname $date $mmd $boot $OP $HDD $pro $mem $proc" -Title "Computer Specifications" |  Out-File c:\StatusReport.html