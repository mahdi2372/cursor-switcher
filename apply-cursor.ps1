# Apply cursor pack by folder name - auto role detection
param([Parameter(Mandatory=$true)][string]$PackName)

$packsRoot = "$env:LOCALAPPDATA\CursorSwitcher\Packs"
$dir = Join-Path $packsRoot $PackName
if (-not (Test-Path $dir)) { Write-Host "Pack not found: $PackName" -ForegroundColor Red; exit 1 }

$files = Get-ChildItem $dir -File | Where-Object { $_.Extension -in '.cur','.ani' }
if ($files.Count -eq 0) { Write-Host "No cursor files in $PackName" -ForegroundColor Red; exit 1 }

# Build lowercase basename -> fullpath map
$map = @{}
foreach ($f in $files) { $map[$f.BaseName.ToLower()] = $f.FullName }

function Find-Role([string[]]$patterns) {
  # exact match first
  foreach ($p in $patterns) {
    if ($map.ContainsKey($p)) { return $map[$p] }
  }
  # starts-with match (longer patterns safer)
  foreach ($p in $patterns) {
    if ($p.Length -lt 3) { continue }  # skip short patterns for partial match
    $hit = $map.Keys | Where-Object { $_ -like "$p*" } | Select-Object -First 1
    if ($hit) { return $map[$hit] }
  }
  # contains match (only for patterns >= 4 chars)
  foreach ($p in $patterns) {
    if ($p.Length -lt 4) { continue }
    $hit = $map.Keys | Where-Object { $_ -like "*$p*" } | Select-Object -First 1
    if ($hit) { return $map[$hit] }
  }
  return $null
}

# Role patterns (priority order - specific first)
# Special: if pack has both cursor.* and pointer.* (neon style): cursor=arrow, pointer=hand
# If only pointer.* (material style): pointer=arrow
$hasCursorFile = $map.ContainsKey('cursor')
$hasPointerFile = $map.ContainsKey('pointer')

if ($hasCursorFile -and $hasPointerFile) {
  # neon style: cursor=arrow, pointer=hand
  $roles = @{
    Arrow        = @('cursor','normal','arrow','default','left_ptr','01-normal','left-pointer','normal-select','normal_select','001')
    Hand         = @('pointer','link','hand','pointer-select','pointer_select','02-link','link-select','link_select')
  }
} elseif ($hasPointerFile) {
  # material style: pointer=arrow, link=hand
  $roles = @{
    Arrow        = @('pointer','normal','arrow','default','left_ptr','01-normal','left-pointer','normal-select','normal_select','001','cursor')
    Hand         = @('link','hand','pointer-select','pointer_select','02-link','link-select','link_select')
  }
} else {
  $roles = @{
    Arrow        = @('normal','arrow','default','left_ptr','01-normal','cursor','left-pointer','normal-select','normal_select','001')
    Hand         = @('link','hand','pointer-select','pointer_select','02-link','link-select','link_select')
  }
}

# Common roles for all packs
$roles += @{
  Help         = @('help','question','04-help','help-select','help_select','helpsel')
  AppStarting  = @('working','appstarting','working_background','working-background','background','progress','03-loading','work')
  Wait         = @('busy','wait','loading','03-loading','start-loading')
  Crosshair    = @('precision','crosshair','cross','07-precision','precision-select','precision_select')
  IBeam        = @('text','beam','ibeam','xterm','05-text','text-select','text_select')
  NWPen        = @('handwrit','pen','06-handwriting','handwriting')
  No           = @('unavailable','unavailiable','unavralible','no','not-allowed','08-unavailable','no-drop','unavail')
  SizeNS       = @('vertical','vert','size-ns','11-vertical','v-resize')
  SizeWE       = @('horizontal','horz','size-we','12-horizontal','h-resize')
  SizeNWSE     = @('dgn1','diagonal1','diagonal-resize-1','diagonal_1','13-diagonal','nwse','resize_1','resize1')
  SizeNESW     = @('dgn2','diagonal2','diagonal-resize-2','diagonal_2','14-diagonal','nesw','resize_2','resize2','resize-2')
  SizeAll      = @('move','size-all','all-scroll','15-move','grab')
  UpArrow      = @('alternate','alt-select','alt_select','up','16-alternate','alt','alternate_select','altselect')
  Pin          = @('pin','place','location','09-location','location-select','location_select','color-picker')
  Person       = @('person','account','user','10-person','person-select','person_select')
}

# Windows default fallbacks for missing roles
$wd = "$env:SystemRoot\Cursors"
$defaults = @{
  Arrow="$wd\aero_arrow.cur"; Help="$wd\aero_helpsel.cur"; AppStarting="$wd\aero_working.ani"
  Wait="$wd\aero_busy.ani"; Crosshair="$wd\cross.cur"; IBeam="$wd\ibeam.cur"
  NWPen="$wd\pen_r.cur"; No="$wd\aero_no.cur"; SizeNS="$wd\aero_ns.cur"
  SizeWE="$wd\aero_we.cur"; SizeNWSE="$wd\aero_nwse.cur"; SizeNESW="$wd\aero_nesw.cur"
  SizeAll="$wd\aero_move.cur"; UpArrow="$wd\aero_up.cur"; Hand="$wd\aero_link.cur"
  Pin="$wd\aero_pin.cur"; Person="$wd\aero_person.cur"
}

$curs = 'HKCU:\Control Panel\Cursors'
$applied = 0; $fallback = 0
foreach ($k in $roles.Keys) {
  $path = Find-Role $roles[$k]
  if (-not $path) { $path = $defaults[$k]; $fallback++ } else { $applied++ }
  Set-ItemProperty $curs -Name $k -Value $path
}
Set-ItemProperty $curs -Name 'precisionhair' -Value (Find-Role $roles['Crosshair'])
if (-not (Find-Role $roles['Crosshair'])) { Set-ItemProperty $curs -Name 'precisionhair' -Value $defaults['Crosshair'] }
Set-ItemProperty $curs -Name '(default)' -Value $PackName

# Register scheme name
$schemes = 'HKCU:\Control Panel\Cursors\Schemes'
$all = @(
  (Find-Role $roles['Arrow']), (Find-Role $roles['Help']), (Find-Role $roles['AppStarting']),
  (Find-Role $roles['Wait']), (Find-Role $roles['Crosshair']), (Find-Role $roles['IBeam']),
  (Find-Role $roles['NWPen']), (Find-Role $roles['No']), (Find-Role $roles['SizeNS']),
  (Find-Role $roles['SizeWE']), (Find-Role $roles['SizeNWSE']), (Find-Role $roles['SizeNESW']),
  (Find-Role $roles['SizeAll']), (Find-Role $roles['UpArrow']), (Find-Role $roles['Hand']),
  (Find-Role $roles['Pin']), (Find-Role $roles['Person'])
) -join ','
# filter nulls
$all = ($all -split ',' | Where-Object { $_ -and $_.Trim() }) -join ','
New-ItemProperty -Path $schemes -Name $PackName -Value $all -PropertyType String -Force -ErrorAction SilentlyContinue | Out-Null

# Broadcast + refresh
Add-Type -Namespace W -Name C -MemberDefinition '[DllImport("user32.dll",CharSet=CharSet.Auto)] public static extern IntPtr SendMessageTimeout(IntPtr h,uint m,IntPtr w,IntPtr l,uint f,uint t,out IntPtr r);'
$r = [IntPtr]::Zero
[void][W.C]::SendMessageTimeout([IntPtr]0xffff,0x1A,[IntPtr]::Zero,[IntPtr]::Zero,2,3000,[ref]$r)
[void][W.C]::SendMessageTimeout([IntPtr]0xffff,0x1B,[IntPtr]::Zero,[IntPtr]::Zero,2,3000,[ref]$r)
Add-Type -Namespace W2 -Name S -MemberDefinition '[DllImport("user32.dll")] public static extern bool SystemParametersInfo(int a,int v,IntPtr p,int f);'
[void][W2.S]::SystemParametersInfo(0x57,0,[IntPtr]::Zero,0x3)

Write-Host "APPLIED: $PackName ($applied roles from pack, $fallback default fallbacks)" -ForegroundColor Green
