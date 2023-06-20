@echo off

:: Определение userAgent и языка системы
powershell "
$userAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.55';
$culture = [System.Globalization.CultureInfo]::CurrentCulture;
$language = $culture.TwoLetterISOLanguageName;
$ProgressPreference = 'SilentlyContinue';

:: Проверка наличия установленного Chrome
if ((Test-Path 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe') -or (Test-Path 'C:\Program Files\Google\Chrome\Application\chrome.exe')) {
    Write-Host 'Chrome is already installed'
} else {
    :: Формирование URL для загрузки установщика Chrome
    $uri = 'https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D&iid=%7B' + [guid]::NewGuid().ToString().ToUpper() + '%7D&lang=' + $language + '&browser=4&usagestats=0&appname=Google%20Chrome&needsadmin=prefers&ap=x64-stable-statsdef_1&installdataindex=empty/chrome/install/ChromeStandaloneSetup64.exe';
    
    :: Отправка запроса HEAD для получения размера файла
    $res = Invoke-WebRequest -UseBasicParsing -Method Head -useragent $userAgent -uri $uri;
    $StatusCode = $res.StatusCode;
    
    if ($StatusCode -eq 200) {
        :: Загрузка установщика Chrome
        $totalBytes = $res.Headers['Content-Length'];
        Write-Host -NoNewLine Downloading installer ($($totalBytes/1024.0/1024.0).ToString('#.##')) MB...;
        $res = Invoke-WebRequest -useragent $userAgent -uri $uri -OutFile chrome_installer.exe -PassThru;
        
        :: Отслеживание прогресса загрузки
        $res.RawContentStream.Position = 0;
        $downloadedBytes = 0;
        while ($downloadedBytes -lt $totalBytes) {
            Start-Sleep -Milliseconds 100;
            $downloadedBytes = $res.RawContentStream.Position;
            Write-Progress -Activity 'Downloading' -Status '$([math]::Round($downloadedBytes / $totalBytes * 100))% complete' -PercentComplete ($downloadedBytes / $totalBytes * 100)
        }
    };
    
    Write-Host '    OK';
    
    :: Запуск установщика Chrome
    start 'Installing Chrome' /wait chrome_installer.exe /silent /install
}"

:: Приостановка выполнения скрипта
pause
