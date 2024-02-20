$vmsEncendidas = @(Get-VM | Where-Object {$_.State -eq "Running"} | Select-Object -ExpandProperty Name)
foreach ($vm in $vmsEncendidas) {
	$CPname = @(Get-VMCheckpoint -VMName $vm | Select-Object -ExpandProperty Name)
	foreach ($cp in $CPname) {
		createcp $cp
	}
}


function deletecp {
  [Parameter(Mandatory=$true)]
  [string]
  $vm  
  
  [Parameter(Mandatory=$true)]
  [string]
  $cp

  Remove-VMCheckpoint -VMName $vm -Name $cp
}


function createcp {
  [Parameter(Mandatory=$true)]
  [string]
  $vm

  Checkpoint-VM -Name $vm
}

Select-String -Path "C:\Users\Admin\Desktop\PH\*.vcx" -Pattern "error"
Get-Item "C:\Users\Admin\Desktop\PH\*.vcx"
Find-File -Path "C:\Users\Admin\Desktop\PH" -Name "*.vmcx" -Recurse

