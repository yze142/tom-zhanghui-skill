#!/usr/bin/env bash
# macOS / Linux One-Click Install Script for Tom Zhanghui Skill
# Usage: curl -fsSL https://raw.githubusercontent.com/yze142/tom-zhanghui-skill/main/install.sh | bash

set -e

echo -e "\033[36m\n========================================================"
echo -e " 🚀 正在安装 张慧（慧哥 / 汤姆张）数字分身 Antigravity Skill"
echo -e "========================================================\n\033[0m"

TARGET_DIR="$(pwd)/.agent/skills/tom_zhanghui"
echo -e "\033[90m[*] 正在安装到项目目录: ${TARGET_DIR}\033[0m"

mkdir -p "${TARGET_DIR}/references"

BASE_URL="https://raw.githubusercontent.com/yze142/tom-zhanghui-skill/main"
FILES=(
  "SKILL.md"
  "references/business_models.md"
  "references/human_nature.md"
  "references/parenting_and_family.md"
  "references/heuristics.md"
  "references/punchlines.md"
  "references/case_studies.md"
)

for file in "${FILES[@]}"; do
  dest="${TARGET_DIR}/${file}"
  mkdir -p "$(dirname "$dest")"
  echo -e "\033[90m  -> 正在下载 ${file} ...\033[0m"
  curl -fsSL "${BASE_URL}/${file}" -o "$dest"
done

echo -e "\033[32m\n========================================================"
echo -e " 🎉 安装成功！张慧（慧哥）数字分身已就绪！"
echo -e "========================================================\033[0m"
echo -e "\033[33m 💡 使用方式：\033[0m"
echo -e " 在 Antigravity 聊天窗口中直接提问："
echo -e " \033[36m👉 '慧哥，22岁迷茫怎么办？'\033[0m"
echo -e " \033[36m👉 '慧哥，朋友拉我投20万合伙开实体店，能干吗？'\033[0m"
echo -e " \033[36m👉 '女朋友要30万彩礼加房产证加名，我很痛苦……'\033[0m\n"
