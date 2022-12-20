from brownie import Bookstore, network

def main():
    print(network.show_active())

    book_store = Bookstore[len(Bookstore) - 1]
    print(book_store)

    token_id = book_store.tokenCounter()
    print(token_id)

    author_book = book_store.AuthorBook(token_id)
    print("Author of the book: " + author_book)

    title_book = book_store.TitleBook(token_id)
    print("Title of the book: " + title_book)

    total_copies_book = book_store.CopiesBook(token_id);
    print("Total copies of the book: " + str(total_copies_book))

    balance = book_store.balanceOf('0x0c370d52CE3357679A0317d552b741534b9cEA18', token_id)
    print(balance)
