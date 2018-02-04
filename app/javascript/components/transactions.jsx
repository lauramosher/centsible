class Transactions extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      transactions: props.transactions
    }
  }

  render() {
    return (
      <section>
        <TransactionsTable transactions={this.state.transactions} />
      </section>
    )
  }
}
