# Shell_Script
- 로재의 쉘 스크립트 레파지토리

```bash
├── claude-code
│   ├── README.md
│   └── yolo-alias.sh
├── Etc_sh
│   ├── backup.sh
│   ├── deployTemp.sh
│   ├── notify.sh
│   └── tail_n.sh
├── Tomcat_sh
│   └── restart.sh
├── mysqlDump
│   ├── README.md
│   ├── bin
│   │   ├── killRunner.sh
│   │   ├── mysqlBackupRunner.pid
│   │   ├── mysqlBackupRunner.sh
│   │   └── runnerState.sh
│   ├── cron
│   └── db_backup_files
├── pm2
│   ├── pm2-monitor.sh
│   ├── pm2-run.sh
│   ├── pm2-status.sh
│   └── pm2-stop.sh
├── springboot_sh
│   ├── app.pid
│   └── script
│       ├── pid.sh
│       ├── restart.sh
│       ├── run.sh
│       ├── status.sh
│       ├── stop.sh
│       └── 설명
└── bootstrap.sh    # 하위 모든 */*.sh 를 자동 source (쉘 설정에서 한 줄로 로드)
```

## bootstrap.sh 사용법

주제 폴더의 alias/function 을 쉘에 자동 로드하려면 `~/.zshrc` 또는 `~/.bashrc` 끝에 한 줄 추가:

```bash
[ -f "$HOME/shell_script/bootstrap.sh" ] && source "$HOME/shell_script/bootstrap.sh"
```

각 주제별 상세는 해당 폴더의 README 참고 (예: `claude-code/README.md`, `mysqlDump/README.md`).
