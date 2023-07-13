if ($args.Length -ne 2) {
    Write-Error "Missing arguments: run-diff.ps1 <source> <target>"
    exit -1
}

$source=$args[0]
$target=$args[1]

Write-Output "Using source=$source"
Write-Output "Using target=$target"

$sourceFiles = Get-ChildItem -Path $source -Include * -Recurse -File -Force

$numErrors = 0;
foreach ($sourceFile in $sourceFiles)
{
    $sourceFilePath = $sourceFile.FullName
    $relativePath = [System.IO.Path]::GetRelativePath($source, $sourceFile.FullName)
    $targetFilePath = [System.IO.Path]::Combine($target, $relativePath)

    $sourceHash = Get-FileHash -Path $sourceFilePath -Algorithm SHA256
    $targetHash = Get-FileHash -Path $targetFilePath -Algorithm SHA256

    if ($sourceHash.Hash -eq $targetHash.Hash) {
        continue;
    }

    Write-Error "File $targetFilePath differs from the source file $sourceFilePath"
    $numErrors += 1;
}

if ($numErrors -ne 0) {
    Write-Error "Compare finished with errors!"
    exit -1
} else {
    Write-Output "Compare finished successfully"
    exit 0
}
