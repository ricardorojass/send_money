# Money Transfer Service App: Database Model & Use Cases

This is ther first version of the app structure with database models, relationships and use cases for TDD approach.

## Database Models

Here's a proposed relational database model:

### 1. Users

Stores information about system users (staff members)
Attributes: id, email, password_digest, first_name, last_name, role, created_at, updated_at

### 2. Customers

People who send money (Remitters)
Attributes: id, first_name, last_name, address, city, country, phone_number, email (optional), id_type, id_number, created_at, updated_at

### 3. Recipients

People who receive money (Beneficiaries)
Attributes: id, first_name, last_name, address, city, country, phone_number, created_at, updated_at

### 4. Transfers

Core entity representing money transfers
Attributes: id, customer_id, recipient_id, origin_country, destination_country, amount_usd, fee_amount, total_amount_usd, exchange_rate, destination_amount, destination_currency, status, estimated_delivery_time, tracking_number, created_at, updated_at

### 5. PaymentMethods

Different methods customers can use to pay
Attributes: id, name, description, is_active, created_at, updated_at

### 6. TransferMethods

Different methods to deliver money to recipients
Attributes: id, name, description, is_active, supported_countries, created_at, updated_at

### 7. BankAccounts

For recipients who want bank transfers
Attributes: id, recipient_id, bank_name, account_number, account_type, branch_name, routing_number, created_at, updated_at

### 8. Transactions

Record of payment transactions related to transfers
Attributes: id, transfer_id, payment_method_id, amount, status, transaction_reference, created_at, updated_at

### 9. ExchangeRates

To store and track exchange rates
Attributes: id, source_currency, target_currency, rate, effective_date, created_at, updated_at

### 10. SystemConfiguration

Store configurable parameters like fees, service times
Attributes: id, parameter_name, parameter_value, description, created_at, updated_at

### Relationships

1. Customer has many Transfers
2. Recipient has many Transfers and optionally many BankAccounts
3. Transfer belongs to Customer and Recipient
4. ransfer has one Transaction
5. Transaction belongs to Transfer and PaymentMethod
6. Recipient has many BankAccounts

## Use Cases for TDD

### Customer Management

1. Create a new customer profile with validation
2. Search for existing customers by name/ID
3. Update customer information
4. View customer transfer history

### Recipient Management

1. Create a new recipient with validation
2. Associate a recipient with a customer
3. Add/update bank account information for a recipient
4. Search recipients by name and customer

### Transfer Creation

1. Create a new transfer with customer and recipient
2. Calculate fees based on amount and destination
3. Calculate exchange rate and final amount in destination currency
4. Generate tracking number for the transfer

### Transfer Processing

1. Update transfer status (pending, in process, completed, cancelled)
2. Process payments from customers
3. Handle failed transfers and refunds
4. Estimate delivery time based on destination and method

### Receipt Generation

1. Generate a transfer receipt with all necessary information
2. Format receipt for WhatsApp delivery
3. Include translated terms in appropriate language

### System Configuration

1. Update configurable parameters (fees, exchange rates)
2. Connect to third-party service for real-time exchange rates
3. Configure delivery time estimates by country

### Reporting

1. Generate daily/weekly/monthly transfer reports
2. Calculate revenue from fees
3. Track transfer volumes by origin/destination
