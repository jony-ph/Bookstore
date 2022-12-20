from brownie import Bookstore, accounts, network, config

def main():
    dev = accounts.add(config['wallets']['from_key'])
    print(network.show_active())

    publish_source = False

    Bookstore.deploy({'from': dev}, publish_source=publish_source)
    #0x7530230Cb14E3Bc2a263e8fdf6dB95d6A62e87d2