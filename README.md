# Chrome Auto Installer

Этот скрипт для Windows автоматически загружает и устанавливает последнюю версию Google Chrome.

## Как это работает

Скрипт проверяет наличие установленного Chrome в системе. Если Chrome не установлен, скрипт определяет язык системы и генерирует новый GUID. Затем скрипт использует язык системы и сгенерированный GUID для формирования URL для загрузки установщика Chrome с серверов Google. Скрипт запускает установщик с параметрами `/silent` и `/install`, чтобы установить Chrome без дополнительных подтверждений.

GUID (Globally Unique Identifier) - это уникальный идентификатор, который используется для обеспечения уникальности объектов в глобальном масштабе. В контексте этого скрипта GUID используется в параметре iid URL для загрузки установщика Chrome с серверов Google. Этот параметр используется серверами Google для отслеживания инсталляций Chrome и сбора статистики.

Скрипт генерирует новый GUID каждый раз, когда он запускается, чтобы каждая инсталляция Chrome имела уникальный идентификатор. Это позволяет серверам Google отслеживать количество установок Chrome и собирать статистику об использовании.

# Chrome Auto Installer

This Windows script automatically downloads and installs the latest version of Google Chrome.

## How it works

The script checks if Chrome is installed on your system. If Chrome is not installed, the script detects the system language and generates a new GUID. The script uses the system language and the generated GUID to generate a URL to download the Chrome installer from Google's servers. The script launches the installer with the `/silent` and `/install` parameters to install Chrome without any additional confirmations.

A GUID (Globally Unique Identifier) is a unique identifier used to ensure that objects are globally unique. In the context of this script, the GUID is used in the iid URL parameter to download the Chrome installer from Google's servers. This parameter is used by Google servers to track Chrome installations and collect statistics.

The script generates a new GUID each time it runs so that each Chrome installation has a unique identifier. This allows Google servers to track the number of Chrome installations and collect usage statistics.
