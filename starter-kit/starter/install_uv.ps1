$ErrorActionPreference = "Stop"

$version = "0.11.26"
$expectedSha256 = "37b3bc94708aacb315254dfc69df326e40b670d3f4785cbde189903369dbd21b"
$url = "https://github.com/astral-sh/uv/releases/download/$version/uv-installer.ps1"
$installer = Join-Path $env:TEMP "uv-installer-$version.ps1"

try {
    Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile $installer
    $actualSha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $installer).Hash.ToLowerInvariant()
    if ($actualSha256 -ne $expectedSha256) {
        throw "uv installer checksum mismatch; refusing to run it."
    }

    & $installer
    if ($LASTEXITCODE -ne 0) {
        throw "uv installer exited with code $LASTEXITCODE."
    }
}
catch {
    Write-Error $_
    exit 1
}
finally {
    Remove-Item -LiteralPath $installer -Force -ErrorAction SilentlyContinue
}
