```mermaid
erDiagram
    USERS ||--|| PROFILES : "memiliki"
    USERS ||--|| WALLETS : "mempunyai"
    USERS ||--o{ TRANSACTIONS : "melakukan"
    TRANSACTIONS  ||--o{ TRANSACTION_CATEGORIES : "mempunyai"
    TRANSACTIONS ||--o{ PAYMENT_METHODS : "mempunyai"

    USERS {
        serial id PK
        varchar username
        varchar email
        varchar password
        varchar pin
    }

    PROFILES {
        serial id PK
        int user_id FK
        varchar full_name
        varchar phone
        varchar photo
    }

    WALLETS {
        serial id PK
        int user_id FK
        int balance
    }

    TRANSACTION_CATEGORIES {
        serial id PK
        varchar name
    }

    PAYMENT_METHODS {
        serial id PK
        varchar name
    }

    TRANSACTIONS {
        serial id PK
        int sender_id FK
        int receiver_id FK
        int category_id FK
        int payment_method_id FK
        int subtotal 
        int tax_amount 
        int total_amount
        varchar transaction_type
        varchar status
        text notes
        timestamp created_at
        timestamp updated_at
    }

```