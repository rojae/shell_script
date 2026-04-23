#!/usr/bin/env bash
# =============================================================================
# shell_script 레포의 claude-code/*.sh 만 자동 source.
# (다른 폴더는 운영용 실행 스크립트라 쉘에 로드하지 않음)
#
# 사용법: ~/.zshrc 또는 ~/.bashrc 끝에 한 줄 추가
#   [ -f "$HOME/path/to/shell_script/bootstrap.sh" ] && source "$HOME/path/to/shell_script/bootstrap.sh"
# =============================================================================

# bash 와 zsh 양쪽에서 현재 스크립트 경로 구하기
if [ -n "$BASH_SOURCE" ]; then
  _SS_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
elif [ -n "$ZSH_VERSION" ]; then
  _SS_ROOT="$(cd "$(dirname "${(%):-%x}")" && pwd)"
else
  _SS_ROOT="$(pwd)"
fi

# claude-code 폴더의 모든 .sh 만 로드
for _ss_f in "$_SS_ROOT"/claude-code/*.sh; do
  [ -r "$_ss_f" ] && . "$_ss_f"
done

unset _SS_ROOT _ss_f
