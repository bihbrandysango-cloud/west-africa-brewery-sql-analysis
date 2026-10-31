# Contributing to West Africa Brewery Sales Analysis

Thank you for considering a contribution. This is a SQL analysis project, so contributions are mostly about queries and how well they answer the question.

## Ways to contribute

- **Fix or sharpen a query.** If a query in `sql/02_analysis.sql` answers a different question from the one it is labelled with, open an issue with the query number (A1 to C3) and the proposed change.
- **Add a question.** A new query that answers a real business question about the data is welcome. Add it to the right section, number it, and add its result to `docs/results.md`.
- **Improve the documentation.** If a sentence in the README is unclear or wrong, open an issue or a pull request with the rewrite.
- **Port to another database.** MySQL, SQL Server or SQLite versions are welcome in their own folder, such as `sql-mysql/`.

## How to submit

1. Fork the repository
2. Create a branch named for your change (`add-quarterly-trend`, `fix-b6-region`)
3. Run both SQL files on PostgreSQL 13 or later and check that the results match `docs/results.md`
4. Update the README if the change affects the headline findings
5. Open a pull request that says what changed and why

## Questions

Open an issue with the `question` label.
