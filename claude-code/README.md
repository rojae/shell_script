# claude-code

Claude Code CLI 관련 alias / function.

## yolo-alias.sh

`claude --yolo` 호출 시 `--dangerously-skip-permissions` 로 자동 치환하고 빨간색 경고를 1줄 표시.

```bash
claude --yolo           # ⚠️ YOLO MODE 경고 후 실행
claude chat             # 평소처럼 정상 동작
```

## 로드 방법

레포 루트의 `bootstrap.sh` 를 쉘 설정에 추가하면 자동으로 source 됨:

```bash
[ -f "$HOME/shell_script/bootstrap.sh" ] && source "$HOME/shell_script/bootstrap.sh"
```

또는 이 파일만 직접 source:

```bash
source ~/shell_script/claude-code/yolo-alias.sh
```
