```mermaid
erDiagram
    KATEGORI ||--o{ PRODUK : memiliki

    KATEGORI {
        string id_kategori PK
        string nama_kategori
    }

    PRODUK {
        string id_produk PK
        string nama_produk
        decimal harga
        int stok
        string id_kategori FK
    }
```
