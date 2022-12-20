from brownie import Bookstore, accounts, network, config

def main():
    dev1 = accounts.add(config['wallets']['from_key'])
    dev2 = accounts.add(config['wallets']['from_key2'])

    print(network.show_active())

    bookstore = Bookstore[len(Bookstore) - 1]
    print(bookstore)

    token_ID = bookstore.tokenCounter()
    print(token_ID)

    bookstore.Approve('0x0c370d52CE3357679A0317d552b741534b9cEA18', {'from': dev1})
    bookstore.purchaseFromAuthor(token_ID, 20, {'from': dev2})