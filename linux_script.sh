cat > setup.sh << 'EOF'
#!/bin/bash
echo "========================================"
echo "   Linux Task - Directory & File Setup"
echo "========================================"
mkdir -p myproject/{logs,config,scripts,data}
echo "[+] Created directory structure"
cat > myproject/README.txt << 'CONTENT'
=== My Linux Project ===
This project demonstrates directory creation,
file creation with content, and permission management.
Directories: logs/ config/ scripts/ data/
CONTENT
cat > myproject/config/app.conf << 'CONTENT'
APP_NAME=MyLinuxApp
APP_VERSION=1.0
APP_PORT=8080
DEBUG_MODE=false
LOG_LEVEL=INFO
DATABASE_HOST=localhost
MAX_CONNECTIONS=100
CONTENT
cat > myproject/logs/app.log << 'CONTENT'
[2024-01-01 10:00:01] INFO  - Application started
[2024-01-01 10:05:00] WARN  - High memory usage: 75%
[2024-01-01 10:15:00] ERROR - Connection timeout
[2024-01-01 10:15:05] INFO  - Reconnected successfully
CONTENT
cat > myproject/scripts/backup.sh << 'CONTENT'
#!/bin/bash
BACKUP_DIR="/tmp/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
mkdir -p $BACKUP_DIR
tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" ./data
echo "Backup created: backup_$TIMESTAMP.tar.gz"
CONTENT
cat > myproject/data/users.csv << 'CONTENT'
id,name,email,role
1,Alice,alice@example.com,admin
2,Bob,bob@example.com,developer
3,Carol,carol@example.com,designer
CONTENT
cat > myproject/data/notes.txt << 'CONTENT'
=== Important Notes ===
1. Always backup before changes
2. Check logs daily
3. Monitor disk usage
TODO: Setup automated backups, configure log rotation
CONTENT
chmod 755 myproject/ myproject/logs myproject/config myproject/scripts myproject/data
chmod 644 myproject/README.txt myproject/config/app.conf
chmod 644 myproject/data/users.csv myproject/data/notes.txt
chmod 664 myproject/logs/app.log
chmod 755 myproject/scripts/backup.sh
echo "[+] All files created & permissions set!"
echo ""
echo "=== DIRECTORY STRUCTURE ==="
find myproject -print | sed -e 's;[^/]*/;|-- ;g;s;-- |;   |;g'
echo ""
echo "=== FILE PERMISSIONS ==="
ls -lR myproject/
echo ""
echo "Task Complete!"
EOF
chmod +x setup.sh
./setup.sh
