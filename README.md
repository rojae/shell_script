# shell_script

주제별 폴더로 shell alias / function 을 정리한 저장소.

## 구조

    shell_script/
    ├── claude-code/       # Claude Code CLI 관련
    │   └── yolo-alias.sh
    ├── bootstrap.sh       # 모든 하위 .sh 를 자동 source
    └── README.md

## 설치

레포를 홈 아래 원하는 위치에 clone 후, 쉘 설정 파일 끝에 한 줄 추가.

**zsh:**
```bash
echo "[ -f \"\$HOME/shell_script/bootstrap.sh\" ] && source \"\$HOME/shell_script/bootstrap.sh\"" >> ~/.zshrc
source ~/.zshrc
```

**bash:**
```bash
echo "[ -f \"\$HOME/shell_script/bootstrap.sh\" ] && source \"\$HOME/shell_script/bootstrap.sh\"" >> ~/.bashrc
source ~/.bashrc
```

## 포함된 기능

### Claude Code YOLO 모드
`claude --yolo` 로 호출 시 `--dangerously-skip-permissions` 자동 치환 + 빨간색 경고 표시.

```bash
claude --yolo           # YOLO 경고 후 실행
claude chat             # 평소처럼 정상 동작
```

## 새 주제 추가

1. 레포 루트에 주제별 디렉토리 생성 (예: `git/`, `docker/`)
2. 그 안에 `*.sh` 파일 작성
3. 새 셸을 열면 자동 로드됨 (bootstrap.sh 가 `*/*.sh` 전부 source 함)
