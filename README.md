# Chrome Auto Installer

Этот скрипт для Windows автоматически загружает и устанавливает последнюю версию Google Chrome.

## Как это работает

Скрипт проверяет наличие установленного Chrome в системе.
Если Chrome не установлен, скрипт определяет язык системы и загружает установщик Chrome на соответствующем языке с серверов Google.
Затем скрипт запускает установщик с параметрами `/silent` и `/install`, чтобы установить Chrome без дополнительных подтверждений.

## Использование

1. Скачайте файл `ChromeAutoInstaller.cmd` на свой компьютер или виртуальную машину.
2. Откройте командную строку и перейдите в каталог, в который вы скачали файл.
3. Запустите скрипт, набрав `GoogleChromeInstaller.cmd` и нажав клавишу `Enter`.

Скрипт проверит наличие установленного Chrome и, если он не установлен, загрузит и запустит установщик на языке системы.

# Chrome Auto Installer

This Windows script automatically downloads and installs the latest version of Google Chrome.

## How it works

The script checks if Chrome is installed on your system.
If Chrome is not installed, the script detects the system language and downloads the Chrome installer in the corresponding language from Google servers.
The script then runs the installer with the `/silent` and `/install` parameters to install Chrome without any further confirmation.

## Usage.

1. Download the file `ChromeAutoInstaller.cmd` to your computer or virtual machine.
2. Open the command line and navigate to the directory where you downloaded the file.
3. Run the script by typing `GoogleChromeInstaller.cmd` and pressing the `Enter` key.

The script will check if Chrome is installed and if it is not, it will download and run the installer in the system language.
