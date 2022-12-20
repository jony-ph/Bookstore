from brownie import Bookstore, accounts, network, config

def main():
    dev = accounts.add(config['wallets']['from_key'])
    print(network.show_active())

    book_store = Bookstore[len(Bookstore) - 1]
    print(book_store)

    book_store.publish("Song of Ice and Fire", 100, {'from': dev})
    print(book_store.tokenCounter())