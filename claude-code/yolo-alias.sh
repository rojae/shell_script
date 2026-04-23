# =============================================================================
# Claude Code CLI — YOLO mode wrapper
# =============================================================================
# `claude --yolo`  →  내부적으로 `claude --dangerously-skip-permissions` 실행
# YOLO 플래그가 있을 때만 빨간색 경고 1줄 출력.
#
# 직접 source 하거나, 레포 루트의 bootstrap.sh 를 통해 자동 로드.
# bash/zsh 양쪽 호환.
# =============================================================================

claude() {
  local yolo=0
  local args=()
  for a in "$@"; do
    case "$a" in
      --yolo)
        yolo=1
        args+=("--dangerously-skip-permissions")
        ;;
      *)
        args+=("$a")
        ;;
    esac
  done
  [ "$yolo" -eq 1 ] && printf '\033[31m⚠️  YOLO MODE — 권한 확인 스킵\033[0m\n' >&2
  command claude "${args[@]}"
}
