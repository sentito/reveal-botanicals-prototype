$slugs = @(
  'force-within','the-space-between','the-prospect-of-a-new-day','guard-your-thoughts','compassion',
  'to-be-revealed','connect','let-the-orchestra-play','be-yourself','light-and-shade'
)

$titles = @{
  'force-within' = 'The Force Within'
  'the-space-between' = 'The Space Between'
  'the-prospect-of-a-new-day' = 'The Prospect of a New Day'
  'guard-your-thoughts' = 'Guard Your Thoughts'
  'compassion' = 'Compassion'
  'to-be-revealed' = 'Gone to the Meadow'
  'connect' = 'Connect'
  'let-the-orchestra-play' = 'Let the Orchestra Play'
  'be-yourself' = 'Be What You Are'
  'light-and-shade' = 'Light and Shade'
}

function Get-BestImageUrl($dataSrc, $dataSrcset) {
  if ($dataSrcset) {
    $best = $null
    $bestW = 0
    foreach ($part in ($dataSrcset -split ',')) {
      if ($part -match '(\S+)\s+(\d+)w') {
        $url = $Matches[1].Trim()
        $w = [int]$Matches[2]
        if ($w -le 1920 -and $w -gt $bestW) { $best = $url; $bestW = $w }
      }
    }
    if ($best) { return $best }
  }
  return $dataSrc
}

function Strip-Html($html) {
  $t = $html -replace '<br\s*/?>', ' '
  $t = $t -replace '<[^>]+>', ''
  $t = [System.Net.WebUtility]::HtmlDecode($t)
  $t = $t -replace '\s+', ' '
  return $t.Trim()
}

function Escape-Js($s) {
  if ($null -eq $s) { return '' }
  return ($s -replace '\\', '\\\\' -replace "'", "\'" -replace "`r", '' -replace "`n", ' ')
}

$all = @()

foreach ($slug in $slugs) {
  $path = Join-Path $PSScriptRoot "gallery_$slug.html"
  $html = Get-Content $path -Raw -Encoding UTF8

  # Main content only (before other-projects)
  $main = $html
  if ($html -match '(?s)(<div id="project-modules">)(.*?)(</div>\s*</div>\s*</div>\s*</section>\s*<section class="other-projects")') {
    $main = $Matches[2]
  }

  $description = ''
  $attribution = ''
  if ($html -match '<p class="description">([^<]*)</p>') {
    $description = Strip-Html $Matches[1]
  }
  if ($html -match '<div class="custom1[^"]*">([^<]*)</div>') {
    $attribution = Strip-Html $Matches[1]
  }

  $blocks = @()
  $pos = 0
  while ($pos -lt $main.Length) {
    $imgIdx = $main.IndexOf('class="grid__item-image', $pos)
    $textIdx = $main.IndexOf('project-module-text', $pos)
    if ($imgIdx -eq -1 -and $textIdx -eq -1) { break }

    $useImg = $false
    if ($imgIdx -ge 0 -and ($textIdx -lt 0 -or $imgIdx -lt $textIdx)) { $useImg = $true }

    if ($useImg) {
      $chunk = $main.Substring($imgIdx, [Math]::Min(2500, $main.Length - $imgIdx))
      $dataSrc = ''
      $dataSrcset = ''
      $alt = ''
      $caption = ''
      if ($chunk -match 'data-src="([^"]+)"') { $dataSrc = $Matches[1] }
      if ($chunk -match 'data-srcset="([^"]+)"') { $dataSrcset = $Matches[1] }
      if ($chunk -match 'alt="([^"]*)"') { $alt = Strip-Html $Matches[1] }
      if ($chunk -match 'grid__caption-text">([^<]+)</h6>') { $caption = Strip-Html $Matches[1] }
      $src = Get-BestImageUrl $dataSrc $dataSrcset
      if ($src) {
        $blocks += [ordered]@{ type = 'image'; src = $src; caption = $caption; alt = $alt }
      }
      $pos = $imgIdx + 50
    } else {
      if ($textIdx -ge 0) {
        $chunk = $main.Substring($textIdx, [Math]::Min(3000, $main.Length - $textIdx))
        if ($chunk -match 'rich-text[^>]*>(.*?)</div>\s*</div>') {
          $text = Strip-Html $Matches[1]
          if ($text.Length -gt 10) {
            $blocks += [ordered]@{ type = 'text'; text = $text }
          }
        }
        $pos = $textIdx + 30
      } else { break }
    }
  }

  # Remove consecutive duplicate blocks
  $deduped = @()
  foreach ($b in $blocks) {
    if ($deduped.Count -gt 0) {
      $prev = $deduped[$deduped.Count - 1]
      if ($prev.type -eq $b.type) {
        if ($b.type -eq 'text' -and $prev.text -eq $b.text) { continue }
        if ($b.type -eq 'image' -and $prev.src -eq $b.src) { continue }
      }
    }
    $deduped += $b
  }

  $all += [ordered]@{
    slug = $slug
    title = $titles[$slug]
    description = $description
    attribution = $attribution
    blocks = $deduped
  }

  Write-Host "$slug : $($blocks.Count) blocks"
}

# Output JS file
$js = "// Auto-generated collection gallery data`nconst collectionGalleryData = {`n"
foreach ($item in $all) {
  $js += "  '$($item.slug)': {`n"
  $js += "    title: '" + (Escape-Js $item.title) + "',`n"
  $js += "    description: '" + (Escape-Js $item.description) + "',`n"
  $js += "    attribution: '" + (Escape-Js $item.attribution) + "',`n"
  $js += "    blocks: [`n"
  foreach ($b in $item.blocks) {
    if ($b.type -eq 'image') {
      $js += "      { type: 'image', src: '" + (Escape-Js $b.src) + "', caption: '" + (Escape-Js $b.caption) + "', alt: '" + (Escape-Js $b.alt) + "' },`n"
    } else {
      $js += "      { type: 'text', text: '" + (Escape-Js $b.text) + "' },`n"
    }
  }
  $js += "    ]`n"
  $js += "  },`n"
}
$js += "};`n"

$outPath = Join-Path $PSScriptRoot 'collection_gallery_data.js'
Set-Content -Path $outPath -Value $js -Encoding UTF8
Write-Host "Wrote $outPath ($((Get-Item $outPath).Length) bytes)"