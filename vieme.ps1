$vmsEncendidas = @(Get-VM | Select-Object -ExpandProperty Name)
foreach ($vm in $vmsEncendidas) {
	$estado = @(Get-VM -VMName $vm | Select-Object -ExpandProperty State)
	if ($estado -eq "OFF"){
        Write-Host "Encendiendo..."
        Start-VM -Name $vm
        Start-Sleep -Seconds 20
        $estado = @(Get-VM -VMName $vm | Select-Object -ExpandProperty State)
        Write-Host "Estado actual de $vm -> $estado"      
    }elseif ($estado -eq "Running"){
        Write-Host "Apagando"
        Stop-VM -Name $vm
        Start-Sleep -Seconds 20
        $estado = @(Get-VM -VMName $vm | Select-Object -ExpandProperty State)
        Write-Host "Estado actual de $vm -> $estado"
    }
}
