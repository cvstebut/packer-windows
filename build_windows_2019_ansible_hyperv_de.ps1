<#
For use with 
    https://github.com/taliesins/packer-baseboxes

For best practices, see also
    https://hodgkins.io/best-practices-with-packer-and-windows



Might try to use these KMS keys with MSDN media:
https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/jj612867(v=ws.11)
#>


[Environment]::SetEnvironmentVariable("hyperv_switchname", 'external', "User")

$TemplateName = 'windows_2019_ansible_hyperv_de.json'

get-date
$sw = [Diagnostics.Stopwatch]::StartNew()
packer build  -on-error=ask -parallel=false -force -only hyperv-iso  ('.\{0}' -f $TemplateName)
$enddate = get-date
$enddate
$sw.Stop()
write-output ('Run time [min]: {0}' -f $sw.Elapsed.TotalMinutes)
