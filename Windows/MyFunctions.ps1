Function Safe-Remove-FlashDrive
{
    Write-Host "请选择要删除的U盘："
    foreach ($device in (Get-WmiObject -Class Win32_LogicalDisk –filter "DriveType=2") | Out-GridView -PassThru )
    {
        $sa = new-object -com Shell.Application
        $sa.Namespace(17).items() |
        ForEach {
            If ($_.Name -match $device.$DeviceID )
            {
                $_.InvokeVerb("Eject")
            }
           }
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($sa)
        Remove-Variable sa
    }   
}

Function Global:MarkEXE
{
    begin
    {
        # 记录控制台的背景色
        $oldcolor = $host.ui.rawui.ForegroundColor
    }
    process
    {
        # 当前管道的元素 $_
        # 如果后缀名为 ".exe",
        # 改变背景色为红色:
        If ($_.name.toLower().endsWith(".exe"))
        {
            $host.ui.Rawui.ForegroundColor = "Green"
        }
        Else
        {
            # 否则, 使用正常的背景色:
            $host.ui.Rawui.ForegroundColor = $oldcolor
         }
        # 输出当前的背景色
        $_
      }
    end
    {
        # 最后,恢复控制台的背景色:
        $host.ui.Rawui.ForegroundColor = $oldcolor
     }
}

Function All-Set-AuthenticodeSignature{
Set-AuthenticodeSignature (Dir -recurse -include *.ps1) $HLMPSC
}

Function Update-Profile{
rm 'C:\Users\He Linming\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1'
cp  .\Microsoft.PowerShell_profile.ps1 'C:\Users\He Linming\Documents\WindowsPowerShell\'
}

# SIG # Begin signature block
# MIIFiwYJKoZIhvcNAQcCoIIFfDCCBXgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU3grdUAJ1qn/JWxfjx6eOoCwt
# VnygggMkMIIDIDCCAgygAwIBAgIQfhPhJr2jWpBOT9kW3WMNrzAJBgUrDgMCHQUA
# MBwxGjAYBgNVBAMTEUhMTVBvd2VyU2hlbGxDZXJ0MB4XDTE2MDYxOTAzMTcwM1oX
# DTM5MTIzMTIzNTk1OVowHDEaMBgGA1UEAxMRSExNUG93ZXJTaGVsbENlcnQwggEi
# MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCd2T6qlbisZAHJ1bk9CkDZgWDc
# ScALB7o7/Zz6gTrWaAMha2jNyOxY8brhMVMpps79CE0Iz/sgfIOvTSOAk0EHHtZn
# 4vQmAPLSuJmpaYN4JaCBUTRh16ojdDRly7x49FWyuOifkAloAKL9DTM+lfAfu7La
# nQBmDGUzfRUgNwzd5gdtyJKvbXTNJfdkIhboIRVFT0cUWLNDk7/sDyrSvjEIh72R
# hngN1U6GwgBIbLfuvzF3DPyHDMe/091mC/EhprKO2n8rx5/vQPaODxb4+OQM4Dow
# VrzjAGqJrhcI+ifShRXQT5DCQqx0v0bmCAi42gCYIh5LSJJRFxxYOdduvvkzAgMB
# AAGjZjBkMBMGA1UdJQQMMAoGCCsGAQUFBwMDME0GA1UdAQRGMESAECHHn0rHhc9g
# 55Nir8PVAAehHjAcMRowGAYDVQQDExFITE1Qb3dlclNoZWxsQ2VydIIQfhPhJr2j
# WpBOT9kW3WMNrzAJBgUrDgMCHQUAA4IBAQBGjg5kRESVoY3kL58o5XUENOwC5fpB
# xKmPMrgbYpKiD7bEHoUfkZ5ShBNvlktPpfu2Xn3eAVtVfQM4zOw3n0zUybrMGaaN
# Pe833xzupNtvnNic8/M/tV2lFBLb0CgV7Nfy3hc0VUsIaEcXjnGSJFjwuUfDM5m4
# xSiaTvFRF2Lw2HTZvLP4MF9L1dXz2eCT+0VoHi29jYhVVzH60HNMVIgBByR6y/nI
# asXDJt+9j5+jBqHkNEECKQguOzRrjNHCKYfuQ4IfVpzBA40gLrdjl3YZO5lztVY1
# tKsgVKo83pIVyth1dKwdpSmoeeAxQS95ZnVww0xGC2GkSVSvoDme8HP4MYIB0TCC
# Ac0CAQEwMDAcMRowGAYDVQQDExFITE1Qb3dlclNoZWxsQ2VydAIQfhPhJr2jWpBO
# T9kW3WMNrzAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZ
# BgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYB
# BAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUDd0zp9tDr2YjdvSmiPmTH1Sc3Z8wDQYJ
# KoZIhvcNAQEBBQAEggEAYy4VvucjZX3zf3RzNtKZ6d+Tt9+gsqAkJrAo21bT3zs9
# amEqt3NhTWRSIBv7Qw+sSF+iqcQ8k6is0YSWRH2X1cEakG4utEeNBK4Yf9NF0YPJ
# kmn5DVwb2eC2DfFi2bVBCuJDaDwhNPzkUESpcpzgpL9AYlvGvKEUxmaLH4rLofM0
# 08um3TNRmmz6NSh7NXLvXlnOXxa+pQykEZ+wniACwaNeAHp9kW9vbdnat76MTABI
# ig5wxMBzheunusVIrRVNC2QX+BbQSv8RsqN1uxCVxNySq1gkCUG+gjA7S3u6GXeU
# crFFSzIC1WJrYLSQx6eOW3hBp6Z3BRSK2p5viezPbw==
# SIG # End signature block
