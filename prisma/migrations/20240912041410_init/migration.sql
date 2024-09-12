-- CreateTable
CREATE TABLE `Pelanggan` (
    `id_pelanggan` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL DEFAULT '',
    `email` VARCHAR(191) NOT NULL DEFAULT '',
    `password` VARCHAR(191) NOT NULL DEFAULT '',
    `nomor_telp` VARCHAR(191) NOT NULL DEFAULT '',
    `jenis_kelamin` ENUM('P', 'L') NOT NULL DEFAULT 'L',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Pelanggan_email_key`(`email`),
    PRIMARY KEY (`id_pelanggan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Admin` (
    `id_admin` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(191) NOT NULL DEFAULT '',
    `password` VARCHAR(191) NOT NULL DEFAULT '',

    UNIQUE INDEX `Admin_username_key`(`username`),
    PRIMARY KEY (`id_admin`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Game` (
    `id_game` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_game` VARCHAR(191) NOT NULL DEFAULT '',
    `gambar_game` VARCHAR(191) NOT NULL DEFAULT '',
    `video_game` VARCHAR(191) NOT NULL DEFAULT '',
    `developer_game` VARCHAR(191) NOT NULL DEFAULT '',
    `harga` INTEGER NOT NULL DEFAULT 0,
    `deskripsi_game` VARCHAR(191) NOT NULL DEFAULT '',
    `tahun_rilis` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `link_download` VARCHAR(191) NOT NULL DEFAULT '',
    `description` TEXT NOT NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_game`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Transaksi` (
    `id_transaksi` INTEGER NOT NULL AUTO_INCREMENT,
    `metode_pembayaran` ENUM('OVO', 'Gopay', 'BANK', 'KARTU_KREDIT') NOT NULL DEFAULT 'KARTU_KREDIT',
    `status_bayar` ENUM('LUNAS', 'BELUM_LUNAS') NOT NULL DEFAULT 'BELUM_LUNAS',
    `total_bayar` INTEGER NOT NULL DEFAULT 0,
    `tanggal_transaksi` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `idPelanggan` INTEGER NULL,
    `idAdmin` INTEGER NULL,

    PRIMARY KEY (`id_transaksi`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DetailTransaksi` (
    `id_detailTransaksi` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `idGame` INTEGER NULL,
    `idTransaksi` INTEGER NULL,

    PRIMARY KEY (`id_detailTransaksi`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Transaksi` ADD CONSTRAINT `Transaksi_idPelanggan_fkey` FOREIGN KEY (`idPelanggan`) REFERENCES `Pelanggan`(`id_pelanggan`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Transaksi` ADD CONSTRAINT `Transaksi_idAdmin_fkey` FOREIGN KEY (`idAdmin`) REFERENCES `Admin`(`id_admin`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailTransaksi` ADD CONSTRAINT `DetailTransaksi_idGame_fkey` FOREIGN KEY (`idGame`) REFERENCES `Game`(`id_game`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailTransaksi` ADD CONSTRAINT `DetailTransaksi_idTransaksi_fkey` FOREIGN KEY (`idTransaksi`) REFERENCES `Transaksi`(`id_transaksi`) ON DELETE SET NULL ON UPDATE CASCADE;
