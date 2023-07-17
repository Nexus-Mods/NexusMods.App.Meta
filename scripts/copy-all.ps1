if ($args.Length -ne 2) {
    Write-Error "Missing arguments: copy-all.ps1 <source> <target>"
    exit -1
}

$source=$args[0]
$target=$args[1]

Write-Output "Using source=$source"
Write-Output "Using target=$target"

$sourceFiles = Get-ChildItem -Path $source -Include * -Recurse -File -Force
foreach ($sourceFile in $sourceFiles)
{
    $sourceFilePath = $sourceFile.FullName
    $relativePath = [System.IO.Path]::GetRelativePath($source, $sourceFile.FullName)
    $targetFilePath = [System.IO.Path]::Combine($target, $relativePath)

    Copy-Item -Path $sourceFilePath $targetFilePath
}

Write-Output "Copied all files"
