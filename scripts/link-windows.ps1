param(
  [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
)

$Dests = @(
  "$HOME\.codex\skills",
  "$HOME\.claude\skills",
  "$HOME\.lingma\skills"
)

foreach ($dest in $Dests) {
  New-Item -ItemType Directory -Force -Path $dest | Out-Null
}

$linked = 0
$skipped = 0

Get-ChildItem $Root -Directory | ForEach-Object {
  $skill = $_.FullName
  $name = $_.Name
  $skillMd = Join-Path $skill "SKILL.md"
  if (!(Test-Path $skillMd)) { return }

  foreach ($dest in $Dests) {
    $target = Join-Path $dest $name

    if (Test-Path $target) {
      $item = Get-Item $target -Force
      if ($item.LinkType -eq "SymbolicLink" -or $item.LinkType -eq "Junction") {
        Remove-Item $target -Force -Recurse
      } else {
        Write-Host "SKIP: $target exists and is not a link"
        $skipped += 1
        continue
      }
    }

    try {
      New-Item -ItemType SymbolicLink -Path $target -Target $skill | Out-Null
    } catch {
      New-Item -ItemType Junction -Path $target -Target $skill | Out-Null
    }
    Write-Host "linked: $target -> $skill"
    $linked += 1
  }
}

Write-Host "done: linked=$linked skipped=$skipped root=$Root"
