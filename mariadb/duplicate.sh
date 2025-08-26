# Ganti dengan nama database sumber Anda
SOURCE_DB="manusa_agustus_backup"
# Ganti dengan nama database target yang baru
TARGET_DB="manusa_agustus"
# Ganti dengan nama pengguna MariaDB Anda
DB_USER="root"
# Ganti dengan kata sandi pengguna MariaDB Anda (hati-hati dengan skrip produksi)
# Jika tidak ada kata sandi, biarkan kosong atau hapus `-p$DB_PASSWORD`
DB_PASSWORD="docker"

# 1. Buat database target baru
echo "Membuat database target baru: $TARGET_DB"
mariadb -u$DB_USER -h127.0.0.1 -p$DB_PASSWORD -e "DROP DATABASE $TARGET_DB; CREATE DATABASE IF NOT EXISTS $TARGET_DB;"

# 2. Ekspor database sumber ke file SQL
echo "Mengekspor database sumber: $SOURCE_DB ke $SOURCE_DB.sql"
mariadb-dump -u$DB_USER -h127.0.0.1 -p$DB_PASSWORD $SOURCE_DB >$SOURCE_DB.sql

# 3. Impor file SQL ke database target
echo "Mengimpor $SOURCE_DB.sql ke database target: $TARGET_DB"
mariadb -u$DB_USER -h127.0.0.1 -p$DB_PASSWORD $TARGET_DB <$SOURCE_DB.sql

echo "Kloning database selesai dari $SOURCE_DB ke $TARGET_DB."
echo "Anda dapat menghapus file $SOURCE_DB.sql jika tidak diperlukan lagi."
