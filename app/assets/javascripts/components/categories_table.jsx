class CategoriesTable extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      categories: props.categories
    };
  }

  render() {
    return (
      <table>
        <thead>
          <th>Category</th>
          <th>Budget</th>
        </thead>
        <tbody>
          {
            this.state.categories.map((category, i) =>
              <tr>
                <td>{category.name}</td>
                <td>{category.budget}</td>
              </tr>
            )
          }
        </tbody>
      </table>
    )
  }
}
