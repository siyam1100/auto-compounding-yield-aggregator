# Auto-Compounding Yield Aggregator

This repository provides a professional framework for a **Yield Optimizer**. It consists of a "Vault" that manages user accounting and a "Strategy" contract that handles the complex interaction with external DeFi protocols.

## Architecture
* **Vault Contract:** Acts as the entry point. It mints "share" tokens to users representing their portion of the pool.
* **Strategy Contract:** Contains the logic to deposit funds into protocols, harvest rewards, and swap those rewards back into the base asset for reinvestment.
* **Harvesting:** A public or bot-triggered function that claims incentives and triggers the auto-compounding cycle.



## Key Benefits
* **Gas Efficiency:** Batching rewards collection for all users reduces individual overhead.
* **Automation:** No need for users to manually claim and sell reward tokens.
* **Risk Management:** Centralized control via the vault allows for quick migration if an underlying protocol becomes risky.
