# Windows One-Click Install Script for Tom Zhanghui Skill
# Usage: irm https://raw.githubusercontent.com/yze142/tom-zhanghui-skill/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

Write-Host "`n========================================================" -ForegroundColor Cyan
Write-Host " 🚀 正在安装 张慧（慧哥 / 汤姆张）数字分身 Antigravity Skill" -ForegroundColor Yellow
Write-Host "========================================================`n" -ForegroundColor Cyan

# Target Directory Detection
$userHome = [System.Environment]::GetFolderPath('UserProfile')
$globalSkillDir = Join-Path $userHome ".gemini\antigravity\skills\tom_zhanghui"
$localSkillDir = Join-Path (Get-Location) ".agent\skills\tom_zhanghui"

# Choose install location
if (Test-Path (Get-Location)) {
    $targetDir = $localSkillDir
    Write-Host "[*] 检测到当前工作空间，将安装到项目目录: $targetDir" -ForegroundColor Gray
} else {
    $targetDir = $globalSkillDir
    Write-Host "[*] 将安装到全局 Skill 目录: $targetDir" -ForegroundColor Gray
}

New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $targetDir "references") | Out-Null

$baseUrl = "https://raw.githubusercontent.com/yze142/tom-zhanghui-skill/main"
$files = @(
    "SKILL.md",
    "references/business_models.md",
    "references/human_nature.md",
    "references/parenting_and_family.md",
    "references/heuristics.md",
    "references/punchlines.md",
    "references/case_studies.md"
)

foreach ($f in $files) {
    $dest = Join-Path $targetDir $f
    $destDir = Split-Path $dest
    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    }
    $downloadUrl = "$baseUrl/$f"
    Write-Host "  -> 正在下载 $f ..." -ForegroundColor DarkGray
    Invoke-WebRequest -Uri $downloadUrl -OutFile $dest -UseBasicParsing
}

Write-Host "`n========================================================" -ForegroundColor Green
Write-Host " 🎉 安装成功！张慧（慧哥）数字分身已就绪！" -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Green
Write-Host " 💡 使用方式：" -ForegroundColor Yellow
Write-Host "  在 Antigravity 聊天窗口中直接提问：" -ForegroundColor White
Write-Host "  👉 '慧哥，22岁迷茫怎么办？'" -ForegroundColor Cyan
Write-Host "  👉 '慧哥，朋友拉我投20万合伙开实体店，能干吗？'" -ForegroundColor Cyan
Write-Host "  👉 '女朋友要30万彩礼加房产证加名，我很痛苦……'`n" -ForegroundColor Cyan
