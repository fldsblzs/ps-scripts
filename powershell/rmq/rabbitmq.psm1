function Start-RabbitMQ {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            Position = 0)]
        [bool]
        $GetNewest = $true,

        [Parameter(
            Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            Position = 1)]
        [string]
        $Hostname = "rabbitmq"
    )
        
    process {

        if ($GetNewest) {
            Write-Output "Checking docker image version..."

            docker.exe pull rabbitmq:3-management
        }

        if ($host.ui.RawUI.WindowTitle -ne "RabbitMq") {
            $host.ui.RawUI.WindowTitle = “RabbitMq”
        }

        Write-Output "Starting RabbitMq instance..."

        docker.exe run --rm -it --hostname $Hostname -p 15672:15672 -p 5672:5672 rabbitmq:3-management

    }
}

Export-ModuleMember -Function Start-RabbitMQ