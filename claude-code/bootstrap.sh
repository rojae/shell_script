#!/usr/bin/env bash
# =============================================================================
# claude-code 폴더의 모든 *.sh 를 자동 source (자기 자신은 제외).
#
# 사용법: ~/.zshrc 또는 ~/.bashrc 끝에 한 줄 추가
#   [ -f "$HOME/path/to/shell_script/claude-code/bootstrap.sh" ] \
#     && source "$HOME/path/to/shell_script/claude-code/bootstrap.sh"
# =============================================================================

# bash 와 zsh 양쪽에서 현재 스크립트 경로 구하기
if [ -n "$BASH_SOURCE" ]; then
  _CC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
elif [ -n "$ZSH_VERSION" ]; then
  _CC_DIR="$(cd "$(dirname "${(%):-%x}")" && pwd)"
else
  _CC_DIR="$(pwd)"
fi

# 같은 폴더의 .sh 를 모두 로드 (bootstrap.sh 자체는 건너뜀)
for _cc_f in "$_CC_DIR"/*.sh; do
  [ "$(basename "$_cc_f")" = "bootstrap.sh" ] && continue
  [ -r "$_cc_f" ] && . "$_cc_f"
done

unset _CC_DIR _cc_f
