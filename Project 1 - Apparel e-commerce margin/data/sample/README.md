# Sample data

Small, relationally consistent extract of the full dataset (Mar 2022 - Feb 2024) for previewing the structure on GitHub.
Same columns and formats as the full files (CSV, `,` separator, LF line endings). Full data: see `data/README.md`.

## clickstream/
| File | Rows | Content |
|---|---|---|
| `clickstream_sample.csv` | 6,228 | all events of 1,277 sessions from all 24 months: the sessions behind the sampled orders + ~25 random sessions per month |

## other/
| File | Rows | How it was sampled |
|---|---|---|
| `orders.csv` | 538 | 12 random orders per month + extra orders with returns, complaints, cancellations and discount codes |
| `order_items.csv` | 538 | items of the sampled orders |
| `returns.csv` | 158 | returns of the sampled orders |
| `customer_complaints.csv` | 89 | complaints of the sampled orders |
| `support_tickets.csv` | 263 | tickets of the sampled orders + 60 pre-sale questions |
| `loyalty_ledger.csv` | 527 | points for the sampled orders + sign-up bonuses of their customers |
| `sessions_meta.csv` | 1,277 | the sessions in `clickstream_sample.csv` |
| `customers.csv` | 227 | every customer referenced by the files above |
| `inventory_daily.csv` | 7,310 | 10 products, full 731 days |
| `purchase_orders.csv`, `stock_receipts.csv`, `supplier_claims.csv` | 145 / 150 / 22 | the same 10 products |
| `marketing_spend.csv` | 6,233 | Jan 2023 and Jan 2024 (YoY comparison) |
| `channels`, `suppliers`, `products_catalog`, `discount_codes`, `campaigns`, `sales_plan`, `marketing_budget` | full | small reference tables, complete |

## Limitations
- The sample is enriched with purchasing sessions, so do **not** use it to calculate conversion rates or KPIs; use the full data.
- A few random sessions contain a `purchase` event whose order is not in the sample.
- Every foreign key between the sampled files resolves (orders -> sessions/customers, items -> orders, complaints -> tickets/returns, etc.).
