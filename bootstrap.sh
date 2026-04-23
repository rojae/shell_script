#!/usr/bin/env bash
# =============================================================================
# shell_script 레포의 모든 하위 *.sh 를 자동 source.
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

# 주제별 하위 디렉토리의 모든 .sh 로드 (bootstrap.sh 자체는 제외)
for _ss_f in "$_SS_ROOT"/*/*.sh; do
  [ -r "$_ss_f" ] && . "$_ss_f"
done

unset _SS_ROOT _ss_f
