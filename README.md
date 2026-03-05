# BookUML
Overview
This schema models a library system where:

Books can have zero, one, or multiple authors
Each book copy has a unique alphanumeric reference and belongs to a single edition
Registered members can borrow copies, with tracked dates and loan durations


Tables

TableDescriptionbookStores title, year, summary of each bookauthorAuthor details: name, birthdate, countrycountryCountry reference table (ISO 2-char code)typeBook genre/category (novel, poetry, sci-fi…)book_authorJunction table linking books and authors (many-to-many)copyIndividual physical copies with alphanumeric referenceseditionPublisher editionsborrowLoan records with date and allowed durationuserRegistered library members

Relationships

author      >-- country        (many authors → one country)
type        >-- book           (many types → one book)
book_author >-- book           (many-to-many: books ↔ authors)
book_author >-- author
copy        >-- book           (many copies → one book)
copy        >-- edition        (each copy belongs to one edition)
borrow      >-- copy           (many borrows → one copy)
borrow      >-- user           (many borrows → one user)

Tools

Schema designed with dbdiagram.io
Language: DBML
