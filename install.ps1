# AIKit Free - Windows Installer
# No GitHub token required. Public repo.

$claudeDir = Join-Path $env:USERPROFILE ".claude"
$skillsDst = Join-Path $claudeDir "skills"
$tmpClone  = Join-Path $env:TEMP "aikit-free-clone"

New-Item -ItemType Directory -Force $skillsDst | Out-Null

Write-Host "  Cloning AIKit Free skills..." -ForegroundColor Cyan
if (Test-Path $tmpClone) { Remove-Item $tmpClone -Recurse -Force }
git clone https://github.com/henkietenki/aikit-free.git $tmpClone 2>&1 | Out-Null

$skillsSrc = Join-Path $tmpClone "skills"
if (Test-Path $skillsSrc) {
    $count = 0
    Get-ChildItem $skillsSrc -Directory | ForEach-Object {
        Copy-Item $_.FullName (Join-Path $skillsDst $_.Name) -Recurse -Force
        $count++
    }
    Write-Host "  $count skills installed to ~/.claude/skills/" -ForegroundColor Green
}

Remove-Item $tmpClone -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "  Done. Open any project folder and run: claude" -ForegroundColor Cyan
Write-Host "  Upgrade to Pro at: https://aikit.originforge.net" -ForegroundColor Gray
