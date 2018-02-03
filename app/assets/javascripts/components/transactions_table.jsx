function TransactionsTable(props) {
  return (
    <table className="transactions-table">
      <thead>
        <tr>
          <th>Date</th>
          <th>Description</th>
          <th>Amount</th>
          <th>Type</th>
        </tr>
      </thead>

      <tbody>
        {
          props.transactions.map((transaction, i) =>
            <tr key={i}>
              <td>{transaction.date}</td>
              <td>{transaction.description}</td>
              <td>{transaction.amount}</td>
              <td>{transaction.transaction_type}</td>
            </tr>
          )
        }
      </tbody>
    </table>
  )
}
